import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

part 'peaman_create_feed_provider_state.freezed.dart';

@freezed
class PeamanCreateFeedProviderState with _$PeamanCreateFeedProviderState {
  const factory PeamanCreateFeedProviderState({
    final PeamanUser? feedOwner,
    final PeamanFeed? feedToEdit,
    required final TextEditingController captionController,
    required final TextEditingController pollQuestionController,
    required final TextEditingController youtubeLinkController,
    @Default(<PeamanPollOption>[]) final List<PeamanPollOption> pollOptions,
    @Default(<PeamanFileUrlExtended>[]) final List<PeamanFileUrlExtended> files,
    @Default(PeamanFeedType.text) final PeamanFeedType feedType,
    @Default(true) final bool isYoutubeLinkValid,
    @Default(CreateFeedState.initial()) final CreateFeedState createFeedState,
  }) = _PeamanCreateFeedProviderState;
}
