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
    this.listWidgetBuilder,
    this.listBuilder,
  }) : type = _Type.all;

  const PeamanProfileFeeds.image({
    super.key,
    required this.user,
    this.listWidgetBuilder,
    this.listBuilder,
  }) : type = _Type.image;

  const PeamanProfileFeeds.video({
    super.key,
    required this.user,
    this.listWidgetBuilder,
    this.listBuilder,
  }) : type = _Type.video;

  const PeamanProfileFeeds.youtube({
    super.key,
    required this.user,
    this.listWidgetBuilder,
    this.listBuilder,
  }) : type = _Type.youtube;

  const PeamanProfileFeeds.poll({
    super.key,
    required this.user,
    this.listWidgetBuilder,
    this.listBuilder,
  }) : type = _Type.poll;

  final _Type type;

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? listWidgetBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    List<PeamanFeed>,
  )? listBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileFeedsState();
}

class _PeamanProfileFeedsState extends ConsumerState<PeamanProfileFeeds> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: PeamanNoGlowScrollConfiguration(),
      child: widget.listWidgetBuilder?.call(context, ref, widget.user) ??
          PeamanFeedsList.byFeedProivder(
            physics: const AlwaysScrollableScrollPhysics(),
            feedsProvider: (context, ref) => ref
                .watch(providerOfPeamanFeedsByOwnerId(widget.user.uid!))
                .when(
                  data: (data) {
                    final profileFeeds = ref
                        .watch(
                          providerOfPeamanFeed.select(
                            (value) => value.profileFeeds,
                          ),
                        )
                        .where(_hasTypeMatched)
                        .toList();
                    return AsyncData(Success(profileFeeds));
                  },
                  error: AsyncError.new,
                  loading: AsyncLoading.new,
                ),
            listBuilderByFeeds: widget.listBuilder == null
                ? null
                : (context, ref, feeds) => widget.listBuilder!.call(
                      context,
                      ref,
                      widget.user,
                      feeds,
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
