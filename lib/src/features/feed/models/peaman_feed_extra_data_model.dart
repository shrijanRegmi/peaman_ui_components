import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_feed_extra_data_model.freezed.dart';
part 'peaman_feed_extra_data_model.g.dart';

extension PeamanFeedExt on PeamanFeed {
  PeamanFeedExtraData get extraDataModel =>
      PeamanFeedExtraData.fromJson(extraData);

  String? get appUserSelectedPollOptionId =>
      extraDataModel.appUserSelectedPollOptionId;
  bool get isReacted => extraDataModel.isReacted;
  bool get isSaved => extraDataModel.isSaved;
}

@freezed
class PeamanFeedExtraData with _$PeamanFeedExtraData {
  const factory PeamanFeedExtraData({
    final String? appUserSelectedPollOptionId,
    @Default(false) final bool isReacted,
    @Default(false) final bool isSaved,
  }) = _PeamanFeedExtraData;

  factory PeamanFeedExtraData.fromJson(Map<String, dynamic> json) =>
      _$PeamanFeedExtraDataFromJson(json);
}
