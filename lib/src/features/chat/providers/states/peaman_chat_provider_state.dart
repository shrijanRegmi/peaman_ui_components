import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/models/peaman_file_url_extended.dart';

part 'peaman_chat_provider_state.freezed.dart';

@freezed
class PeamanChatProviderState with _$PeamanChatProviderState {
  const factory PeamanChatProviderState({
    required final TextEditingController messageController,
    @Default(<PeamanFileUrlExtended>[]) final List<PeamanFileUrlExtended> files,
    @Default(SendMessageState.initial())
        final SendMessageState sendMessageState,
    @Default(UpdateMessageState.initial())
        final UpdateMessageState updateMessageState,
    @Default(DeleteMessageState.initial())
        final DeleteMessageState deleteMessageState,
    @Default(UnsendMessageState.initial())
        final UnsendMessageState unsendMessageState,
    @Default(ReadChatState.initial()) final ReadChatState readChatState,
    @Default(UpdateChatState.initial()) final UpdateChatState updateChatState,
    @Default(DeleteChatState.initial()) final DeleteChatState deleteChatState,
    @Default(ArchiveChatState.initial())
        final ArchiveChatState archiveChatState,
    @Default(SetTypingStatusState.initial())
        final SetTypingStatusState setTypingStatusState,
    @Default(<PeamanChatMessage>[]) final List<PeamanChatMessage> tempMessages,
    final PeamanChatMessage? messageToReply,
  }) = _PeamanChatProviderState;
}

@freezed
class SendMessageState with _$SendMessageState {
  const factory SendMessageState.initial() = _SendMessageStateInitial;
  const factory SendMessageState.loading() = _SendMessageStateLoading;
  const factory SendMessageState.success(
    final PeamanChatMessage result,
  ) = _SendMessageStateSuccess;
  const factory SendMessageState.error(
    final PeamanError error,
  ) = _SendMessageStateFailure;
}

@freezed
class UpdateMessageState with _$UpdateMessageState {
  const factory UpdateMessageState.initial() = _UpdateMessageStateInitial;
  const factory UpdateMessageState.loading() = _UpdateMessageStateLoading;
  const factory UpdateMessageState.success(
    final bool result,
  ) = _UpdateMessageStateSuccess;
  const factory UpdateMessageState.error(
    final PeamanError error,
  ) = _UpdateMessageStateFailure;
}

@freezed
class DeleteMessageState with _$DeleteMessageState {
  const factory DeleteMessageState.initial() = _DeleteMessageStateInitial;
  const factory DeleteMessageState.loading() = _DeleteMessageStateLoading;
  const factory DeleteMessageState.success(
    final bool result,
  ) = _DeleteMessageStateSuccess;
  const factory DeleteMessageState.error(
    final PeamanError error,
  ) = _DeleteMessageStateFailure;
}

@freezed
class UnsendMessageState with _$UnsendMessageState {
  const factory UnsendMessageState.initial() = _UnsendMessageStateInitial;
  const factory UnsendMessageState.loading() = _UnsendMessageStateLoading;
  const factory UnsendMessageState.success(
    final bool result,
  ) = _UnsendMessageStateSuccess;
  const factory UnsendMessageState.error(
    final PeamanError error,
  ) = _UnsendMessageStateFailure;
}

@freezed
class ReadChatState with _$ReadChatState {
  const factory ReadChatState.initial() = _ReadChatStateInitial;
  const factory ReadChatState.loading() = _ReadChatStateLoading;
  const factory ReadChatState.success(
    final bool result,
  ) = _ReadChatStateSuccess;
  const factory ReadChatState.error(
    final PeamanError error,
  ) = _ReadChatStateFailure;
}

@freezed
class UpdateChatState with _$UpdateChatState {
  const factory UpdateChatState.initial() = _UpdateChatStateInitial;
  const factory UpdateChatState.loading() = _UpdateChatStateLoading;
  const factory UpdateChatState.success(
    final bool result,
  ) = _UpdateChatStateSuccess;
  const factory UpdateChatState.error(
    final PeamanError error,
  ) = _UpdateChatStateFailure;
}

@freezed
class DeleteChatState with _$DeleteChatState {
  const factory DeleteChatState.initial() = _DeleteChatStateInitial;
  const factory DeleteChatState.loading() = _DeleteChatStateLoading;
  const factory DeleteChatState.success(
    final bool result,
  ) = _DeleteChatStateSuccess;
  const factory DeleteChatState.error(
    final PeamanError error,
  ) = _DeleteChatStateFailure;
}

@freezed
class ArchiveChatState with _$ArchiveChatState {
  const factory ArchiveChatState.initial() = _ArchiveChatStateInitial;
  const factory ArchiveChatState.loading() = _ArchiveChatStateLoading;
  const factory ArchiveChatState.success(
    final bool result,
  ) = _ArchiveChatStateSuccess;
  const factory ArchiveChatState.error(
    final PeamanError error,
  ) = _ArchiveChatStateFailure;
}

@freezed
class SetTypingStatusState with _$SetTypingStatusState {
  const factory SetTypingStatusState.initial() = _SetTypingStatusStateInitial;
  const factory SetTypingStatusState.loading() = _SetTypingStatusStateLoading;
  const factory SetTypingStatusState.success(
    final bool result,
  ) = _SetTypingStatusStateSuccess;
  const factory SetTypingStatusState.error(
    final PeamanError error,
  ) = _SetTypingStatusStateFailure;
}
