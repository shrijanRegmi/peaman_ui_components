import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_single_peaman_chat_message_stream_args.freezed.dart';

@freezed
class PeamanSingleChatMessageArgs with _$PeamanSingleChatMessageArgs {
  const factory PeamanSingleChatMessageArgs({
    required final String chatId,
    required final String messageId,
  }) = _PeamanSingleChatMessageArgs;
}
