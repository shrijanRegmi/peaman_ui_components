import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  all,
  image,
  video,
  youtube,
  poll,
}

class PeamanProfileFeeds extends ConsumerStatefulWidget {
  const PeamanProfileFeeds.all({
    super.key,
    required this.user,
  }) : type = _Type.all;

  const PeamanProfileFeeds.image({
    super.key,
    required this.user,
  }) : type = _Type.image;

  const PeamanProfileFeeds.video({
    super.key,
    required this.user,
  }) : type = _Type.video;

  const PeamanProfileFeeds.youtube({
    super.key,
    required this.user,
  }) : type = _Type.youtube;

  const PeamanProfileFeeds.poll({
    super.key,
    required this.user,
  }) : type = _Type.poll;

  final PeamanUser user;
  final _Type type;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileFeedsState();
}

class _PeamanProfileFeedsState extends ConsumerState<PeamanProfileFeeds> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: PeamanNoGlowScrollConfiguration(),
      child: PeamanFeedsList.byFeedProivder(
        physics: const AlwaysScrollableScrollPhysics(),
        feedsProvider: (context, ref) => ref.watch(
          providerOfPeamanFeedsByOwnerId(widget.user.uid!).select((value) {
            return value.when(
              data: (data) {
                return data.when(
                  (success) => AsyncData(
                    Success(
                      success.where(_hasTypeMatched).toList(),
                    ),
                  ),
                  (failure) => AsyncError(failure, StackTrace.current),
                );
              },
              error: AsyncError.new,
              loading: AsyncLoading.new,
            );
          }),
        ),
      ),
    );
  }

  bool _hasTypeMatched(final PeamanFeed feed) {
    switch (widget.type) {
      case _Type.all:
        return true;
      case _Type.image:
        return feed.type == PeamanFeedType.file &&
            feed.files
                .where((element) => element.type == PeamanFileType.image)
                .toList()
                .isNotEmpty;
      case _Type.video:
        return feed.type == PeamanFeedType.file &&
            feed.files
                .where((element) => element.type == PeamanFileType.video)
                .toList()
                .isNotEmpty;
      case _Type.youtube:
        return feed.type == PeamanFeedType.youTube;
      case _Type.poll:
        return feed.type == PeamanFeedType.poll;
      default:
        return true;
    }
  }
}
