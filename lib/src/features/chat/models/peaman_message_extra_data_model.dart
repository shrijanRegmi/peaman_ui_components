import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_message_extra_data_model.freezed.dart';
part 'peaman_message_extra_data_model.g.dart';

extension PeamanChatMessageExt on PeamanChatMessage {
  PeamanChatMessageExtraData get extraDataModel =>
      PeamanChatMessageExtraData.fromJson(extraData);

  PeamanInfoMessageType get infoType => extraDataModel.infoType;
}

@freezed
class PeamanChatMessageExtraData with _$PeamanChatMessageExtraData {
  const factory PeamanChatMessageExtraData({
    @Default(PeamanInfoMessageType.unknown)
        final PeamanInfoMessageType infoType,
  }) = _PeamanChatMessageExtraData;

  factory PeamanChatMessageExtraData.fromJson(Map<String, dynamic> json) =>
      _$PeamanChatMessageExtraDataFromJson(json);
}
