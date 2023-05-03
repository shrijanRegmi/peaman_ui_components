import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanFeedItemHeader extends ConsumerStatefulWidget {
  const PeamanFeedItemHeader({
    super.key,
    required this.feed,
    this.avatarBuilder,
    this.nameBuilder,
    this.userNameBuilder,
    this.dateBuilder,
    this.menuBuilder,
    this.onPressedMenu,
  });

  final PeamanFeed feed;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? avatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? nameBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? userNameBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? dateBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
  )? menuBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    PeamanFeed,
    Function(),
  )? onPressedMenu;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemHeaderState();
}

class _PeamanFeedItemHeaderState extends ConsumerState<PeamanFeedItemHeader> {
  @override
  Widget build(BuildContext context) {
    final feedOwnerFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.feed.ownerId!),
    );
    return feedOwnerFuture.maybeWhen(
      data: (data) => data.when(
        (success) => _dataBuilder(success),
        (failure) => _dataBuilder(
          const PeamanUser(
            photo: '',
            name: '',
            userName: '',
          ),
        ),
      ),
      orElse: () => _dataBuilder(
        const PeamanUser(
          photo: '',
          name: '',
          userName: '',
        ),
      ),
    );
  }

  Widget _dataBuilder(final PeamanUser user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              widget.avatarBuilder?.call(context, ref, user) ??
                  PeamanAvatarBuilder.network(
                    user.photo,
                    onPressed: () => context.pushNamed(
                      PeamanProfileScreen.route,
                      arguments: PeamanProfileScreenArgs(
                        userId: user.uid!,
                      ),
                    ),
                  ).pR(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: widget.nameBuilder?.call(context, ref, user) ??
                              PeamanText.body1(
                                '${user.name} ',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                onPressed: () => context.pushNamed(
                                  PeamanProfileScreen.route,
                                  arguments: PeamanProfileScreenArgs(
                                    userId: user.uid!,
                                  ),
                                ),
                              ),
                        ),
                        Flexible(
                          child: Container(
                            child: widget.userNameBuilder
                                    ?.call(context, ref, user) ??
                                PeamanText.body1(
                                  '@${user.userName}',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: PeamanColors.grey,
                                  ),
                                  onPressed: () => context.pushNamed(
                                    PeamanProfileScreen.route,
                                    arguments: PeamanProfileScreenArgs(
                                      userId: user.uid!,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                    widget.dateBuilder?.call(context, ref, widget.feed) ??
                        PeamanText.body2(
                          timeago.format(
                            DateTime.fromMillisecondsSinceEpoch(
                              widget.feed.createdAt!,
                            ),
                          ),
                          style: const TextStyle(
                            color: PeamanColors.midLightGrey,
                            fontSize: 12.0,
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
        widget.menuBuilder?.call(context, ref, widget.feed) ??
            IconButton(
              onPressed: () {
                if (widget.onPressedMenu != null) {
                  widget.onPressedMenu?.call(
                    context,
                    ref,
                    widget.feed,
                    () => showPeamanFeedMenuBottomsheet(
                      context: context,
                      feed: widget.feed,
                    ),
                  );
                } else {
                  showPeamanFeedMenuBottomsheet(
                    context: context,
                    feed: widget.feed,
                  );
                }
              },
              splashRadius: 22.r,
              icon: const Icon(
                Icons.more_horiz_rounded,
              ),
            ),
      ],
    );
  }
}
