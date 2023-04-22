import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  normal,
  byFeeds,
  byFeedIds,
  byFeedProvider,
}

typedef _FeedsProvider
    = AsyncValue<PeamanEither<List<PeamanFeed>, PeamanError>>;

class PeamanFeedsList extends ConsumerStatefulWidget {
  const PeamanFeedsList({
    super.key,
    this.listBuilderByFeeds,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.normal,
        feeds = const [],
        feedIds = const [],
        feedsProvider = null,
        listBuilderByFeedIds = null;

  const PeamanFeedsList.byFeeds({
    super.key,
    required this.feeds,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.listBuilderByFeeds,
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byFeeds,
        feedIds = const [],
        feedsProvider = null,
        listBuilderByFeedIds = null;

  const PeamanFeedsList.byFeedIds({
    super.key,
    required this.feedIds,
    this.listBuilderByFeedIds,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byFeedIds,
        feeds = const [],
        feedsProvider = null,
        listBuilderByFeeds = null;

  const PeamanFeedsList.byFeedProivder({
    super.key,
    required this.feedsProvider,
    this.listBuilderByFeeds,
    this.firstItemPadding,
    this.itemPadding,
    this.lastItemPadding,
    this.itemBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byFeedProvider,
        feeds = const [],
        feedIds = const [],
        listBuilderByFeedIds = null,
        assert(
          feedsProvider != null,
          'feedsProvider cannot be null',
        );

  final _Type type;

  final List<PeamanFeed> feeds;
  final List<String> feedIds;
  final _FeedsProvider Function(
    BuildContext,
    WidgetRef,
  )? feedsProvider;

  final EdgeInsets? firstItemPadding;
  final EdgeInsets? itemPadding;
  final EdgeInsets? lastItemPadding;

  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanFeed>,
  )? listBuilderByFeeds;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<String>,
  )? listBuilderByFeedIds;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? itemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? emptyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? loadingBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanError,
  )? errorBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? bodyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? actionsBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedsListState();
}

class _PeamanFeedsListState extends ConsumerState<PeamanFeedsList> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case _Type.normal:
        return _normalTypeListBuilder();
      case _Type.byFeeds:
        return _byFeedsTypeListBuilder();
      case _Type.byFeedIds:
        return _byFeedIdsTypeListBuilder();
      case _Type.byFeedProvider:
        return _byFeedProviderTypeListBuilder();
      default:
        return const SizedBox();
    }
  }

  Widget _normalTypeListBuilder() {
    final feedsFuture = ref.watch(providerOfPeamanTimelineFeedsFuture);
    return feedsFuture.when(
      data: (data) {
        return data.when(
          (success) {
            final timelineFeeds = ref.watch(
              providerOfPeamanFeed.select((value) => value.timelineFeeds),
            );
            if (timelineFeeds.isEmpty) return _emptyBuilder();
            return _feedsListBuilder(timelineFeeds);
          },
          _errorBuilder,
        );
      },
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      loading: _loadingBuilder,
    );
  }

  Widget _byFeedsTypeListBuilder() {
    return _feedsListBuilder(widget.feeds);
  }

  Widget _byFeedIdsTypeListBuilder() {
    return _feedIdsListBuilder(widget.feedIds);
  }

  Widget _byFeedProviderTypeListBuilder() {
    final feedsFuture = widget.feedsProvider?.call(context, ref);
    return feedsFuture!.when(
      data: (data) {
        return data.when(
          (success) {
            if (success.isEmpty) return _emptyBuilder();
            return _feedsListBuilder(success);
          },
          _errorBuilder,
        );
      },
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      loading: _loadingBuilder,
    );
  }

  Widget _feedsListBuilder(final List<PeamanFeed> feeds) {
    return widget.listBuilderByFeeds?.call(context, ref, feeds) ??
        ListView.separated(
          itemCount: feeds.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final feed = feeds[index];
            return PeamanFeedsListItem.byFeed(
              feed: feed,
              padding: index == 0
                  ? widget.firstItemPadding
                  : index == (feeds.length - 1)
                      ? widget.lastItemPadding
                      : widget.itemPadding,
              builder: widget.itemBuilder,
              headerBuilder: widget.headerBuilder,
              bodyBuilder: widget.bodyBuilder,
              actionsBuilder: widget.actionsBuilder,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.0,
            );
          },
        );
  }

  Widget _feedIdsListBuilder(final List<String> feedIds) {
    return widget.listBuilderByFeedIds?.call(context, ref, feedIds) ??
        ListView.separated(
          itemCount: feedIds.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final feedId = feedIds[index];
            return PeamanFeedsListItem.byFeedId(
              feedId: feedId,
              padding: index == 0
                  ? widget.firstItemPadding
                  : index == (feedIds.length - 1)
                      ? widget.lastItemPadding
                      : widget.itemPadding,
              builder: widget.itemBuilder,
              headerBuilder: widget.headerBuilder,
              bodyBuilder: widget.bodyBuilder,
              actionsBuilder: widget.actionsBuilder,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0.0,
            );
          },
        );
  }

  Widget _emptyBuilder() {
    return widget.emptyBuilder?.call(context, ref) ??
        const PeamanEmptyBuilder(
          title: 'No feeds found',
        );
  }

  Widget _loadingBuilder() {
    return widget.loadingBuilder?.call(context, ref) ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final PeamanError error) {
    return widget.errorBuilder?.call(context, ref, error) ??
        PeamanErrorBuilder(subTitle: error.message);
  }
}
