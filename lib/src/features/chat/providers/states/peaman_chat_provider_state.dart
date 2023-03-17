import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_chat_provider_state.freezed.dart';

@freezed
class PeamanChatProviderState with _$PeamanChatProviderState {
  const factory PeamanChatProviderState({
    @Default(false) final bool isLoading,
  }) = _PeamanChatProviderState;
}
