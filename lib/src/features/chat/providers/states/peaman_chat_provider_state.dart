import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_chat_provider_state.freezed.dart';

@freezed
class PeamanChatProviderState with _$PeamanChatProviderState {
  const factory PeamanChatProviderState({
    required final TextEditingController messageController,
    @Default(<PeamanFileUrlExtended>[]) final List<PeamanFileUrlExtended> files,
    @Default(SendMessageState.initial())
        final SendMessageState sendMessageState,
    @Default(CreateChatState.initial()) final CreateChatState createChatState,
    @Default(SendInfoMessageState.initial())
        final SendInfoMessageState sendInfoMessageState,
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
    @Default(MuteChatState.initial()) final MuteChatState muteChatState,
    @Default(UnmuteChatState.initial()) final UnmuteChatState unmuteChatState,
    @Default(LeaveChatState.initial()) final LeaveChatState leaveChatState,
    @Default(SetChatTitleState.initial())
        final SetChatTitleState setChatTitleState,
    @Default(AddChatMembersState.initial())
        final AddChatMembersState addChatMembersState,
    @Default(RemoveChatMembersState.initial())
        final RemoveChatMembersState removeChatMembersState,
    @Default(SetTypingStatusState.initial())
        final SetTypingStatusState setTypingStatusState,
    @Default(<PeamanChatMessage>[]) final List<PeamanChatMessage> tempMessages,
    final PeamanChatMessage? messageToReply,
  }) = _PeamanChatProviderState;
}

@freezed
class CreateChatState with _$CreateChatState {
  const factory CreateChatState.initial() = _CreateChatStateInitial;
  const factory CreateChatState.loading() = _CreateChatStateLoading;
  const factory CreateChatState.success(
    final PeamanChat result,
  ) = _CreateChatStateSuccess;
  const factory CreateChatState.error(
    final PeamanError error,
  ) = _CreateChatStateFailure;
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
class SendInfoMessageState with _$SendInfoMessageState {
  const factory SendInfoMessageState.initial() = _SendInfoMessageStateInitial;
  const factory SendInfoMessageState.loading() = _SendInfoMessageStateLoading;
  const factory SendInfoMessageState.success(
    final PeamanChatMessage result,
  ) = _SendInfoMessageStateSuccess;
  const factory SendInfoMessageState.error(
    final PeamanError error,
  ) = _SendInfoMessageStateFailure;
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

@freezed
class MuteChatState with _$MuteChatState {
  const factory MuteChatState.initial() = _MuteChatStateInitial;
  const factory MuteChatState.loading() = _MuteChatStateLoading;
  const factory MuteChatState.success(
    final bool result,
  ) = _MuteChatStateSuccess;
  const factory MuteChatState.error(
    final PeamanError error,
  ) = _MuteChatStateFailure;
}

@freezed
class UnmuteChatState with _$UnmuteChatState {
  const factory UnmuteChatState.initial() = _UnmuteChatStateInitial;
  const factory UnmuteChatState.loading() = _UnmuteChatStateLoading;
  const factory UnmuteChatState.success(
    final bool result,
  ) = _UnmuteChatStateSuccess;
  const factory UnmuteChatState.error(
    final PeamanError error,
  ) = _UnmuteChatStateFailure;
}

@freezed
class LeaveChatState with _$LeaveChatState {
  const factory LeaveChatState.initial() = _LeaveChatStateInitial;
  const factory LeaveChatState.loading() = _LeaveChatStateLoading;
  const factory LeaveChatState.success(
    final bool result,
  ) = _LeaveChatStateSuccess;
  const factory LeaveChatState.error(
    final PeamanError error,
  ) = _LeaveChatStateFailure;
}

@freezed
class SetChatTitleState with _$SetChatTitleState {
  const factory SetChatTitleState.initial() = _SetChatTitleStateInitial;
  const factory SetChatTitleState.loading() = _SetChatTitleStateLoading;
  const factory SetChatTitleState.success(
    final bool result,
  ) = _SetChatTitleStateSuccess;
  const factory SetChatTitleState.error(
    final PeamanError error,
  ) = _SetChatTitleStateFailure;
}

@freezed
class AddChatMembersState with _$AddChatMembersState {
  const factory AddChatMembersState.initial() = _AddChatMembersStateInitial;
  const factory AddChatMembersState.loading() = _AddChatMembersStateLoading;
  const factory AddChatMembersState.success(
    final bool result,
  ) = _AddChatMembersStateSuccess;
  const factory AddChatMembersState.error(
    final PeamanError error,
  ) = _AddChatMembersStateFailure;
}

@freezed
class RemoveChatMembersState with _$RemoveChatMembersState {
  const factory RemoveChatMembersState.initial() =
      _RemoveChatMembersStateInitial;
  const factory RemoveChatMembersState.loading() =
      _RemoveChatMembersStateLoading;
  const factory RemoveChatMembersState.success(
    final bool result,
  ) = _RemoveChatMembersStateSuccess;
  const factory RemoveChatMembersState.error(
    final PeamanError error,
  ) = _RemoveChatMembersStateFailure;
}
