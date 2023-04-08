import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanChat =
    StateNotifierProvider<PeamanChatProvider, PeamanChatProviderState>((ref) {
  return PeamanChatProvider(ref);
});

final providerOfPeamanUserChatsStream = StreamProvider<List<PeamanChat>>((ref) {
  final authUser = ref.watch(providerOfPeamanAuthUser);
  if (authUser.isNull) return Stream.value([]);
  return ref
      .watch(providerOfPeamanChatRepository)
      .getUserChatsStream(uid: authUser!.uid);
});

final providerOfSinglePeamanChatFromChatsStream =
    Provider.family<PeamanChat?, String>((ref, chatId) {
  final chatsStream = ref.watch(providerOfPeamanUserChatsStream);
  return chatsStream.maybeWhen(
    data: (data) {
      final index = data.indexWhere((element) => element.id == chatId);
      if (index == -1) return null;
      return data[index];
    },
    orElse: () => null,
  );
});

final providerOfPeamanChatMessagesStream = StreamProvider.family
    .autoDispose<List<PeamanChatMessage>, String>((ref, chatId) {
  if (chatId.trim().isEmpty) return Stream.value([]);
  final chat = ref.read(providerOfSinglePeamanChatFromChatsStream(chatId));
  final authUser = ref.watch(providerOfPeamanAuthUser);

  final startAfter = chat?.startAfters
      .firstWhere(
        (element) => element.uid == authUser?.uid,
        orElse: PeamanChatStartAfter.new,
      )
      .messageCreatedAt;

  return ref.watch(providerOfPeamanChatRepository).getChatMessagesStream(
        chatId: chatId,
        startAfter: startAfter,
      );
});

final providerOfPeamanChatUsersFuture = FutureProvider.family<
    PeamanEither<List<PeamanUser>, PeamanError>, PeamanListWrapper<String>>(
  (ref, userIdsWrapper) async {
    var users = <PeamanUser>[];

    final authUser = ref.watch(providerOfPeamanAuthUser);
    if (authUser.isNull) return Success(users);

    var receiverIds = userIdsWrapper.values
        .where((element) => element != authUser!.uid)
        .toList();

    receiverIds = receiverIds.sublist(
      0,
      receiverIds.length > 3 ? 3 : receiverIds.length,
    );

    final futures = <Future<PeamanEither<PeamanUser, PeamanError>>>[];
    for (final receiverId in receiverIds) {
      final future = ref
          .watch(providerOfPeamanUserRepository)
          .getSingleUser(uid: receiverId);
      futures.add(future);
    }
    final results = await Future.wait(futures);

    PeamanError? error;
    for (final result in results) {
      error = result.when(
        (success) {
          users = [...users, success];
          return null;
        },
        (failure) => failure,
      );
    }

    if (error != null) {
      return Failure(error);
    }

    return Success(users);
  },
);

final providerOfSinglePeamanChatMessageStream =
    StreamProvider.family<PeamanChatMessage, PeamanSingleChatMessageArgs>(
        (ref, args) {
  return ref.watch(providerOfPeamanChatRepository).getSingleChatMessageStream(
        chatId: args.chatId,
        messageId: args.messageId,
      );
});

class PeamanChatProvider extends StateNotifier<PeamanChatProviderState> {
  PeamanChatProvider(final Ref ref)
      : _ref = ref,
        super(
          PeamanChatProviderState(
            messageController: TextEditingController(),
          ),
        );

  final Ref _ref;
  PeamanUser get _appUser => _ref.read(providerOfLoggedInUser);
  PeamanChatRepository get _chatRepository =>
      _ref.watch(providerOfPeamanChatRepository);
  PeamanStorageRepository get _storageRepository =>
      _ref.watch(providerOfPeamanStorageRepository);
  PeamanInfoProvider get _logProvider =>
      _ref.read(providerOfPeamanInfo.notifier);

  Future<void> sendMessage({
    required final String chatId,
    required final PeamanChatType chatType,
    required final List<String> receiverIds,
  }) async {
    if (state.messageController.text.trim().isEmpty && state.files.isEmpty) {
      return;
    }

    final millis = DateTime.now().millisecondsSinceEpoch;
    var message = PeamanChatMessage(
      chatId: chatId,
      chatType: chatType,
      senderId: _appUser.uid,
      senderName: _appUser.name,
      receiverIds: receiverIds,
      parentId: state.messageToReply?.id,
      parentText: state.messageToReply?.text,
      parentFiles: state.messageToReply?.files ?? [],
      files: state.files,
      text: state.messageController.text.trim(),
      type: state.files.isNotEmpty
          ? PeamanChatMessageType.file
          : PeamanChatMessageType.text,
      isTemp: true,
      createdAt: millis,
      updatedAt: millis,
    );
    if (message.type == PeamanChatMessageType.file) addToTempMessages(message);

    final localFiles = state.files.where((element) => element.isLocal).toList();
    clearValues();

    final filesResult = await _uploadLocalFiles(
      chatId: chatId,
      localFiles: localFiles,
    );
    if (filesResult.isFailure) {
      _logProvider.logError(filesResult.failure.message);
      state = state.copyWith(
        sendMessageState: SendMessageState.error(filesResult.failure),
      );
      return;
    }

    message = message.copyWith(
      files: filesResult.success,
      isTemp: false,
    );

    state = state.copyWith(
      sendMessageState: const SendMessageState.loading(),
    );
    final result = await _chatRepository.createChatMessage(
      message: message,
    );
    state = result.when(
      (success) => state.copyWith(
        sendMessageState: SendMessageState.success(success),
      ),
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          sendMessageState: SendMessageState.error(failure),
        );
      },
    );
    removeFromToTempMessages(message);
    setTypingStatus(chatId: chatId, typedValue: '');
  }

  Future<void> unsendMessage({
    required final String chatId,
    required final String messageId,
  }) async {
    state = state.copyWith(
      unsendMessageState: const UnsendMessageState.loading(),
    );
    final result = await _chatRepository.unsendChatMessage(
      chatId: chatId,
      messageId: _appUser.uid!,
    );
    state = result.when(
      (success) => state.copyWith(
        unsendMessageState: UnsendMessageState.success(success),
      ),
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          unsendMessageState: UnsendMessageState.error(failure),
        );
      },
    );
  }

  Future<void> updateMessage({
    required final String chatId,
    required final String messageId,
    required final List<PeamanField> fields,
  }) async {
    state = state.copyWith(
      updateMessageState: const UpdateMessageState.loading(),
    );
    final result = await _chatRepository.updateChatMessage(
      chatId: chatId,
      messageId: _appUser.uid!,
      fields: fields,
    );
    state = result.when(
      (success) => state.copyWith(
        updateMessageState: UpdateMessageState.success(success),
      ),
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          updateMessageState: UpdateMessageState.error(failure),
        );
      },
    );
  }

  Future<void> deleteMessage({
    required final String chatId,
    required final String messageId,
  }) async {
    state = state.copyWith(
      deleteMessageState: const DeleteMessageState.loading(),
    );
    final result = await _chatRepository.deleteChatMessage(
      chatId: chatId,
      messageId: _appUser.uid!,
    );
    state = result.when(
      (success) => state.copyWith(
        deleteMessageState: DeleteMessageState.success(success),
      ),
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          deleteChatState: DeleteChatState.error(failure),
        );
      },
    );
  }

  Future<void> readChat({
    required final String chatId,
  }) async {
    final chat = getSingleChat(chatId);
    if (chat != null) {
      final unreadMessages = chat.unreadMessages
          .firstWhere(
            (element) => element.uid == _appUser.uid,
            orElse: PeamanChatUnreadMessage.new,
          )
          .unreadMessagesCount;
      final isUnread = unreadMessages > 0;
      if (!isUnread) return;

      state = state.copyWith(
        readChatState: const ReadChatState.loading(),
      );
      final result = await _chatRepository.readChatMessages(
        chatId: chatId,
        uid: _appUser.uid!,
      );
      state = result.when(
        (success) => state.copyWith(
          readChatState: ReadChatState.success(success),
        ),
        (failure) {
          _logProvider.logError(failure.message);
          return state.copyWith(
            readChatState: ReadChatState.error(failure),
          );
        },
      );
    }
  }

  Future<void> updateChat({
    required final String chatId,
    required final List<PeamanField> fields,
  }) async {
    state = state.copyWith(
      updateChatState: const UpdateChatState.loading(),
    );
    final result = await _chatRepository.updateChat(
      chatId: chatId,
      fields: fields,
    );
    state = result.when(
      (success) => state.copyWith(
        updateChatState: UpdateChatState.success(success),
      ),
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          updateChatState: UpdateChatState.error(failure),
        );
      },
    );
  }

  Future<void> deleteChat({
    required final String chatId,
    final String? successLogMessage,
  }) async {
    final chat = getSingleChat(chatId, readOnly: true);
    if (chat?.lastMessageCreatedAt.isNull == true) return;

    state = state.copyWith(
      deleteChatState: const DeleteChatState.loading(),
    );
    final result = await _chatRepository.deleteChat(
      chatId: chatId,
      uid: _appUser.uid!,
      lastMessageCreatedAt: chat!.lastMessageCreatedAt!,
    );
    state = result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        return state.copyWith(
          deleteChatState: DeleteChatState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          deleteChatState: DeleteChatState.error(failure),
        );
      },
    );
  }

  Future<void> archiveChat({
    required final String chatId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      archiveChatState: const ArchiveChatState.loading(),
    );
    final result = await _chatRepository.archiveChat(
      chatId: chatId,
      uid: _appUser.uid!,
    );
    state = result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        return state.copyWith(
          archiveChatState: ArchiveChatState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          archiveChatState: ArchiveChatState.error(failure),
        );
      },
    );
  }

  Future<void> muteChat({
    required final String chatId,
    required final int mutedAt,
    required final int mutedUntil,
    final String? uid,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      muteChatState: const MuteChatState.loading(),
    );
    final result = await _chatRepository.muteChat(
      chatId: chatId,
      uid: uid ?? _appUser.uid!,
      mutedAt: mutedAt,
      mutedUntil: mutedUntil,
    );
    state = result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        return state.copyWith(
          muteChatState: MuteChatState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          muteChatState: MuteChatState.error(failure),
        );
      },
    );
  }

  Future<void> unmuteChat({
    required final String chatId,
    final String? uid,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      unmuteChatState: const UnmuteChatState.loading(),
    );
    final result = await _chatRepository.unmuteChat(
      chatId: chatId,
      uid: uid ?? _appUser.uid!,
    );
    state = result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        return state.copyWith(
          unmuteChatState: UnmuteChatState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        return state.copyWith(
          unmuteChatState: UnmuteChatState.error(failure),
        );
      },
    );
  }

  Future<void> setTypingStatus({
    required final String chatId,
    required final String typedValue,
  }) async {
    final chat = getSingleChat(chatId);
    if (chat != null) {
      PeamanChatTypingStatus? typingStatus;

      if (typedValue != '') {
        if (!chat.typingUserIds.contains(_appUser.uid)) {
          typingStatus = PeamanChatTypingStatus.typing;
        }
      } else {
        typingStatus = PeamanChatTypingStatus.idle;
      }

      if (typingStatus.isNull) return;

      state = state.copyWith(
        setTypingStatusState: const SetTypingStatusState.loading(),
      );
      final result = await _chatRepository.setTypingStatus(
        chatId: chatId,
        uid: _appUser.uid!,
        typingStatus: typingStatus!,
      );
      if (!mounted) return;
      state = result.when(
        (success) => state.copyWith(
          setTypingStatusState: SetTypingStatusState.success(success),
        ),
        (failure) {
          _logProvider.logError(failure.message);
          return state.copyWith(
            setTypingStatusState: SetTypingStatusState.error(failure),
          );
        },
      );
    }
  }

  Future<PeamanEither<List<PeamanFileUrl>, PeamanError>> _uploadLocalFiles({
    required final String chatId,
    required final List<PeamanFileUrlExtended> localFiles,
  }) async {
    final filesEithers = await Future.wait([
      _uploadLocalImages(
        chatId: chatId,
        localFiles: localFiles,
      ),
      _uploadLocalVideos(
        chatId: chatId,
        localFiles: localFiles,
      ),
    ]);

    var files = <PeamanFileUrl>[];
    PeamanError? error;
    for (final filesEither in filesEithers) {
      error = filesEither.when(
        (success) {
          files = [...files, ...success];
          return null;
        },
        (failure) => failure,
      );
      if (error != null) {
        break;
      }
    }

    if (error != null) {
      return Failure(error);
    } else {
      return Success(files);
    }
  }

  Future<PeamanEither<List<PeamanFileUrl>, PeamanError>> _uploadLocalImages({
    required final String chatId,
    required final List<PeamanFileUrlExtended> localFiles,
  }) async {
    final files = localFiles
        .where(
          (element) => element.isLocal && element.type == PeamanFileType.image,
        )
        .toList();

    if (files.isNotEmpty) {
      final result = await _storageRepository.uploadFiles(
        path: 'users/${_appUser.uid}/chats/$chatId',
        fileName: '${_appUser.name?.split(' ').join('_').toLowerCase()}.jpg',
        files: files.map((e) => File(e.url)).toList(),
      );
      return result.when(
        (success) {
          final fileUrls = success
              .map(
                (e) => PeamanFileUrl(
                  url: e,
                  type: PeamanFileType.image,
                ),
              )
              .toList();
          return Success(fileUrls);
        },
        (failure) => Failure(failure),
      );
    }

    return const Success(<PeamanFileUrl>[]);
  }

  Future<PeamanEither<List<PeamanFileUrl>, PeamanError>> _uploadLocalVideos({
    required final String chatId,
    required final List<PeamanFileUrlExtended> localFiles,
  }) async {
    final files = localFiles
        .where(
          (element) => element.isLocal && element.type == PeamanFileType.video,
        )
        .toList();

    if (files.isNotEmpty) {
      final result = await _storageRepository.uploadFiles(
        path: 'users/${_appUser.uid}/chats/$chatId',
        fileName: '${_appUser.name?.split(' ').join('_').toLowerCase()}.jpg',
        files: files.map((e) => File(e.url)).toList(),
      );
      return result.when(
        (success) {
          final fileUrls = success
              .map(
                (e) => PeamanFileUrl(
                  url: e,
                  type: PeamanFileType.video,
                ),
              )
              .toList();
          return Success(fileUrls);
        },
        (failure) => Failure(failure),
      );
    }

    return const Success(<PeamanFileUrl>[]);
  }

  PeamanChat? getSingleChat(
    final String chatId, {
    final bool readOnly = true,
  }) {
    if (readOnly) {
      return _ref.read(providerOfSinglePeamanChatFromChatsStream(chatId));
    }
    return _ref.watch(providerOfSinglePeamanChatFromChatsStream(chatId));
  }

  Future<void> pickImage() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages.isNotEmpty) {
      for (final pickedImage in pickedImages) {
        final chatFile = PeamanFileUrlExtended(
          url: pickedImage.path,
          type: PeamanFileType.image,
          isLocal: true,
        );
        addToFiles(chatFile);
      }
    }
  }

  Future<void> pickVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      final chatFile = PeamanFileUrlExtended(
        url: pickedVideo.path,
        type: PeamanFileType.video,
        isLocal: true,
      );
      addToFiles(chatFile);
    }
  }

  void clearValues() {
    state = state.copyWith(
      messageController: state.messageController..text = '',
      files: [],
      messageToReply: null,
    );
  }

  void addToFiles(final PeamanFileUrlExtended newVal) {
    state = state.copyWith(
      files: [...state.files, newVal],
    );
  }

  void removeFromFiles(final PeamanFileUrlExtended newVal) {
    state = state.copyWith(
      files: state.files.where((e) => e.url != newVal.url).toList(),
    );
  }

  void addToTempMessages(final PeamanChatMessage newVal) {
    state = state.copyWith(
      tempMessages: [...state.tempMessages, newVal],
    );
  }

  void removeFromToTempMessages(final PeamanChatMessage newVal) {
    state = state.copyWith(
      tempMessages: state.tempMessages.where((e) => e.id != newVal.id).toList(),
    );
  }

  void setMessageToReply(final PeamanChatMessage? newVal) {
    state = state.copyWith(
      messageToReply: newVal,
    );
  }
}
