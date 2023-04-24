// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peaman_feed_extra_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PeamanFeedExtraData _$$_PeamanFeedExtraDataFromJson(
        Map<String, dynamic> json) =>
    _$_PeamanFeedExtraData(
      appUserSelectedPollOptionId:
          json['app_user_selected_poll_option_id'] as String?,
      isReacted: json['is_reacted'] as bool? ?? false,
      isSaved: json['is_saved'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PeamanFeedExtraDataToJson(
    _$_PeamanFeedExtraData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'app_user_selected_poll_option_id', instance.appUserSelectedPollOptionId);
  val['is_reacted'] = instance.isReacted;
  val['is_saved'] = instance.isSaved;
  return val;
}
