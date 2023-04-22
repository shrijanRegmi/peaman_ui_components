// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peaman_feed_extra_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFeedExtraData _$$_PeamanFeedExtraDataFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanFeedExtraData(
      selectedPollOptionId: json['selected_poll_option_id'] as String?,
    );

Map<String, dynamic> _$$_PeamanFeedExtraDataToJson(
    _$_PeamanFeedExtraData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('selected_poll_option_id', instance.selectedPollOptionId);
  return val;
}
