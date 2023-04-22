import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  byFeed,
  byFeedId,
  byFeedProvider,
}

typedef _FeedProvider = AsyncValue<PeamanEither<PeamanFeed, PeamanError>>;

class PeamanFeedsListItem extends ConsumerStatefulWidget {
  const PeamanFeedsListItem.byFeed({
    super.key,
    required this.feed,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byFeed,
        feedId = '',
        feedProvider = null;

  const PeamanFeedsListItem.byFeedId({
    super.key,
    required this.feedId,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byFeedId,
        feed = const PeamanFeed(),
        feedProvider = null;

  const PeamanFeedsListItem.byFeedProvider({
    super.key,
    required this.feedProvider,
    this.padding,
    this.builder,
    this.headerBuilder,
    this.bodyBuilder,
    this.actionsBuilder,
  })  : type = _Type.byFeedId,
        feed = const PeamanFeed(),
        feedId = '',
        assert(
          feedProvider != null,
          'feedProvider cannot be null',
        );

  final _Type type;

  final PeamanFeed feed;
  final String feedId;
  final _FeedProvider Function(
    BuildContext,
    WidgetRef,
  )? feedProvider;

  final EdgeInsets? padding;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? builder;
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
      _PeamanFeedsListItemState();
}

class _PeamanFeedsListItemState extends ConsumerState<PeamanFeedsListItem> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case _Type.byFeed:
        return _byFeedTypeBuilder();
      case _Type.byFeedId:
        return _byFeedIdTypeBuilder();
      case _Type.byFeedProvider:
        return _byFeedProviderTypeBuilder();
      default:
        return const SizedBox();
    }
  }

  Widget _byFeedTypeBuilder() {
    return _feedBuilder(widget.feed);
  }

  Widget _byFeedIdTypeBuilder() {
    final feedFuture = ref.watch(
      providerOfPeamanSingleFeedByIdFuture(widget.feedId),
    );
    return feedFuture.when(
      data: (data) {
        return data.when(
          (success) => _feedBuilder(success),
          (failure) => const SizedBox(),
        );
      },
      error: (e, _) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }

  Widget _byFeedProviderTypeBuilder() {
    final feedFuture = widget.feedProvider?.call(context, ref);
    return feedFuture!.when(
      data: (data) {
        return data.when(
          (success) => _feedBuilder(success),
          (failure) => const SizedBox(),
        );
      },
      error: (e, _) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }

  Widget _feedBuilder(final PeamanFeed feed) {
    if (feed.id.isNull) return const SizedBox();

    return Padding(
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
      child: widget.builder?.call(context, ref, feed) ??
          Column(
            children: [
              if (widget.feed.type != PeamanFeedType.poll)
                PeamanFeedItemHeader(feed: feed).pB(15),
              PeamanFeedItemBody(feed: feed).pB(20),
              if (widget.feed.type != PeamanFeedType.poll)
                PeamanFeedItemActions(feed: feed).pB(10),
            ],
          ),
    );
  }
}
