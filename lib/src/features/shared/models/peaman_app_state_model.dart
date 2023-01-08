import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanAppState {
  final List<PeamanFeed> feeds;

  PeamanAppState({
    this.feeds = const [],
  });

  PeamanAppState copyWith({
    final List<PeamanFeed>? feeds,
  }) {
    return PeamanAppState(
      feeds: feeds ?? this.feeds,
    );
  }
}
