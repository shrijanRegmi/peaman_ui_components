import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageInput extends ConsumerStatefulWidget {
  final String chatId;
  final PeamanChatType chatType;
  final List<String> receiverIds;
  final TextEditingController? messageController;
  final PeamanChatMessage? messageToReply;
  final List<PeamanFileUrlExtended>? files;
  final FocusNode? focusNode;
  final Function(String, Function())? onChanged;
  final Function(Function())? onPressedSend;
  final Function(Function())? onPressedSelectImage;
  final Function(PeamanFileUrlExtended, Function())? onPressedRemoveImage;
  final Function(Function())? onPressedCancelReply;

  const PeamanChatMessageInput({
    super.key,
    required this.chatId,
    required this.chatType,
    required this.receiverIds,
    this.messageController,
    this.files,
    this.focusNode,
    this.messageToReply,
    this.onChanged,
    this.onPressedSend,
    this.onPressedSelectImage,
    this.onPressedRemoveImage,
    this.onPressedCancelReply,
  });

  @override
  ConsumerState<PeamanChatMessageInput> createState() =>
      _PeamanChatMessageInputState();
}

class _PeamanChatMessageInputState
    extends ConsumerState<PeamanChatMessageInput> {
  PeamanChatProviderState get state => ref.watch(providerOfPeamanChat);
  PeamanChatProvider get notifier => ref.read(providerOfPeamanChat.notifier);
  PeamanUser get appUser => ref.watch(providerOfLoggedInUser);

  @override
  Widget build(BuildContext context) {
    final blockedByUsersStream =
        ref.watch(providerOfPeamanBlockedByUsersStream);
    final isUserBlocked = blockedByUsersStream.maybeWhen(
      data: (data) =>
          data.map((e) => e.uid).contains(
              widget.receiverIds.isEmpty ? '' : widget.receiverIds.first) &&
          widget.chatType == PeamanChatType.oneToOne,
      orElse: () => false,
    );
    if (isUserBlocked) return const PeamanChatCantReplyBuilder();

    var messageToReply = widget.messageToReply ?? state.messageToReply;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _selectedImageBuilder(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: context.theme.inputDecorationTheme.fillColor,
            boxShadow: [
              BoxShadow(
                color: context.theme.appBarTheme.shadowColor ??
                    PeamanColors.lightGrey,
                offset: const Offset(0, -2),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (messageToReply != null) _messageToReplyBuilder(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _imageSelectorBuilder(),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: _messageInputBuilder(),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  _sendBuilder(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageSelectorBuilder() {
    return GestureDetector(
      onTap: () =>
          widget.onPressedSelectImage?.call(notifier.pickImage) ??
          notifier.pickImage(),
      behavior: HitTestBehavior.opaque,
      child: Icon(
        Icons.image,
        color: context.theme.inputDecorationTheme.prefixIconColor,
      ),
    );
  }

  Widget _messageInputBuilder() {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      focusNode: widget.focusNode,
      controller: widget.messageController ?? state.messageController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (val) =>
          widget.onChanged?.call(
            val,
            () => notifier.setTypingStatus(
              chatId: widget.chatId,
              typedValue: val,
            ),
          ) ??
          notifier.setTypingStatus(
            chatId: widget.chatId,
            typedValue: val,
          ),
      decoration: const InputDecoration(
        hintText: 'Type something awesome...',
        border: InputBorder.none,
      ),
    );
  }

  Widget _sendBuilder() {
    return GestureDetector(
      onTap: () =>
          widget.onPressedSend?.call(
            () => notifier.sendMessage(
              chatId: widget.chatId,
              chatType: widget.chatType,
              receiverIds: widget.receiverIds,
            ),
          ) ??
          notifier.sendMessage(
            chatId: widget.chatId,
            chatType: widget.chatType,
            receiverIds: widget.receiverIds,
          ),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.inputDecorationTheme.suffixIconColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Transform.rotate(
            angle: -pi / 2,
            child: Icon(
              Icons.send,
              color: context.isDarkMode
                  ? PeamanColors.white70
                  : PeamanColors.white,
              size: 15.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedImageBuilder() {
    final files = widget.files ?? state.files;
    return SizedBox(
      height: files.isNotEmpty ? 130.0 : 0.0,
      child: ListView.builder(
        itemCount: files.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final picture = files[index];

          return Container(
            width: 80.0,
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              image: DecorationImage(
                image: FileImage(File(picture.url)),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () =>
                    widget.onPressedRemoveImage?.call(
                      picture,
                      () => notifier.removeFromFiles(picture),
                    ) ??
                    notifier.removeFromFiles(picture),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: PeamanColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: PeamanColors.red,
                    size: 15.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _messageToReplyBuilder() {
    PeamanChatMessage? messageToReply =
        widget.messageToReply ?? state.messageToReply;
    String? replyingToUserName;

    if (messageToReply != null) {
      final replyingToUserFuture = ref.watch(
        providerOfSingleUserByIdFuture(messageToReply.senderId!),
      );
      replyingToUserName = replyingToUserFuture.maybeWhen(
        loading: () => 'Loading...',
        data: (data) {
          return data.when(
            (success) => '${success.name}',
            (failure) => 'Unknown',
          );
        },
        orElse: () => 'Unknown',
      );
    }
    final allFiles = messageToReply?.files ?? [];
    final filesToShow =
        allFiles.sublist(0, allFiles.length > 2 ? 2 : allFiles.length);
    final remainingFilesCount = allFiles.length - filesToShow.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PeamanText.body2(
                'Replying to $replyingToUserName',
                style: TextStyle(
                  color: PeamanColors.grey,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              filesToShow.isNotEmpty
                  ? Row(
                      children: [
                        for (final file in filesToShow)
                          Container(
                            width: 25.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(3.r),
                              image: DecorationImage(
                                image:
                                    CachedNetworkImageProvider(file.url ?? ''),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).pR(3),
                        if (remainingFilesCount > 0)
                          Text(
                            '+$remainingFilesCount',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.grey,
                            ),
                          ).pL(3)
                      ],
                    )
                  : messageToReply?.text?.isNotEmpty == true
                      ? PeamanText.body2(
                          messageToReply?.text?.replaceAll("\n", " "),
                          limit: 45,
                          style: const TextStyle(),
                        )
                      : const SizedBox()
            ],
          ),
          GestureDetector(
            onTap: () =>
                widget.onPressedCancelReply?.call(
                  () => notifier.setMessageToReply(null),
                ) ??
                notifier.setMessageToReply(null),
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Icons.close_rounded,
            ),
          )
        ],
      ),
    );
  }
}
