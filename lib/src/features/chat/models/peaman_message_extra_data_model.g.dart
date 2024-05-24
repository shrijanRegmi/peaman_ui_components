// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peaman_message_extra_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PeamanChatMessageExtraDataImpl _$$PeamanChatMessageExtraDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PeamanChatMessageExtraDataImpl(
      infoType: $enumDecodeNullable(
              _$PeamanInfoMessageTypeEnumMap, json['info_type']) ??
          PeamanInfoMessageType.unknown,
    );

Map<String, dynamic> _$$PeamanChatMessageExtraDataImplToJson(
        _$PeamanChatMessageExtraDataImpl instance) =>
    <String, dynamic>{
      'info_type': _$PeamanInfoMessageTypeEnumMap[instance.infoType]!,
    };

const _$PeamanInfoMessageTypeEnumMap = {
  PeamanInfoMessageType.unknown: 'unknown',
  PeamanInfoMessageType.createdChat: 'createdChat',
  PeamanInfoMessageType.updatedChatTitle: 'updatedChatTitle',
  PeamanInfoMessageType.addedToChat: 'addedToChat',
  PeamanInfoMessageType.removedFromChat: 'removedFromChat',
  PeamanInfoMessageType.leftChat: 'leftChat',
};
