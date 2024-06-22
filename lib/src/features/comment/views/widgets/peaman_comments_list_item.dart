import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/providers/peaman_comments_list_item_provider.dart';
import 'package:peaman_ui_components/src/features/comment/views/widgets/peaman_comments_list.dart';
import 'package:timeago/timeago.dart';

class PeamanCommentsListItem extends ConsumerStatefulWidget {
  /// The list item for the comments.
  const PeamanCommentsListItem({
    super.key,
    required this.comment,
  });

  /// The comment to display.
  final PeamanComment comment;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanCommentsListItemState();
}

class _PeamanCommentsListItemState
    extends ConsumerState<PeamanCommentsListItem> {
  final _borderRadius = 15.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (widget.comment.parent == PeamanCommentParent.comment)
              Transform.flip(
                flipX: true,
                child: const Icon(
                  Icons.reply,
                ),
              ).pL(20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius.spMin),
                  color: PeamanColors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileImageBuilder(),
                        SizedBox(
                          width: 10.spMin,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _headerBuilder(),
                              _bodyBuilder(),
                              SizedBox(
                                height: 5.spMin,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).pad(10.0),
                    _footerBuilder(),
                  ],
                ),
              ).pX(20.0),
            ),
          ],
        ),
        if (widget.comment.parent == PeamanCommentParent.feed)
          Consumer(
            builder: (context, ref, child) {
              final isRepliesVisible = ref.watch(
                providerOfPeamanCommentsListItemProvider(widget.comment.id!)
                    .select((value) => value.isRepliesVisible),
              );
              if (!isRepliesVisible) return const SizedBox();

              return PeamanCommentsList.reply(
                feedId: widget.comment.feedId!,
                comment: widget.comment,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            },
          ),
      ],
    ).pB(widget.comment.parent == PeamanCommentParent.feed ? 20.0 : 10.0);
  }

  Widget _profileImageBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final commentOwnerFuture = ref.watch(
          providerOfSingleUserByIdFuture(widget.comment.ownerId!),
        );

        return commentOwnerFuture.maybeWhen(
          data: (data) => data.when(
            (success) => PeamanAvatarBuilder.network(
              success.photo,
              userId: success.uid,
              onPressed: () => context.pushNamed(
                PeamanProfileScreen.route,
                arguments: PeamanProfileScreenArgs(
                  userId: success.uid!,
                ),
              ),
              size: 40.0,
            ),
            (failure) => const PeamanAvatarBuilder.network(
              '',
              size: 40.0,
            ),
          ),
          orElse: () => const PeamanAvatarBuilder.network(
            '',
            size: 40.0,
          ),
        );
      },
    );
  }

  Widget _headerBuilder() {
    return Row(
      children: [
        Flexible(
          child: Consumer(
            builder: (context, ref, child) {
              final commentOwnerFuture = ref.watch(
                providerOfSingleUserByIdFuture(widget.comment.ownerId!),
              );

              return commentOwnerFuture.maybeWhen(
                data: (data) => data.when(
                  (success) => PeamanText.body2(
                    success.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  (failure) => const PeamanText.body2(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                orElse: () => const PeamanText.body2(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        if (widget.comment.createdAt != null)
          Container(
            width: 3.spMin,
            height: 3.spMin,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: PeamanColors.grey,
            ),
          ).pX(5.0),
        if (widget.comment.createdAt != null)
          PeamanText.body2(
            format(
              DateTime.fromMillisecondsSinceEpoch(
                widget.comment.createdAt!,
              ),
              locale: 'en_short',
            ),
            style: const TextStyle(
              color: PeamanColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }

  Widget _bodyBuilder() {
    return PeamanText.body1(
      widget.comment.comment,
      withReadMore: true,
      limit: 100,
      readMoreTextSpace: 4.0,
      readMoreTextStyle: TextStyle(
        color: context.theme.colorScheme.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 12.spMin,
      ),
    );
  }

  Widget _footerBuilder() {
    const isActive = false;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius.spMin),
          bottomRight: Radius.circular(_borderRadius.spMin),
        ),
        color: PeamanColors.extraLightGrey2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/outlined_love.svg',
                package: 'peaman_ui_components',
                width: 18.spMin,
                color: isActive ? PeamanColors.midLightGrey : PeamanColors.grey,
              ).pY(15.0).pL(10.0).pR(5.0),
              PeamanText.body2(
                '${widget.comment.reactionsCount} likes',
                style: TextStyle(
                  fontSize: 12.spMin,
                ),
              ),
            ],
          ),
          if (widget.comment.parent == PeamanCommentParent.feed)
            Consumer(
              builder: (context, ref, child) {
                final isRepliesVisible = ref.watch(
                  providerOfPeamanCommentsListItemProvider(widget.comment.id!)
                      .select((value) => value.isRepliesVisible),
                );

                return Row(
                  children: [
                    PeamanText.body2(
                      '${widget.comment.repliesCount}',
                      style: TextStyle(
                        fontSize: 12.spMin,
                        color: isRepliesVisible ? PeamanColors.secondary : null,
                      ),
                    ),
                    SizedBox(
                      width: 5.spMin,
                    ),
                    SvgPicture.asset(
                      'assets/svgs/outlined_comment.svg',
                      package: 'peaman_ui_components',
                      width: 18.spMin,
                      color: isRepliesVisible
                          ? PeamanColors.secondary
                          : PeamanColors.grey,
                    ),
                  ],
                ).pXY(10.0, 15.0).onPressed(_handleRepliesButtonPressed);
              },
            ),
        ],
      ),
    );
  }

  /// Toggle the visibility of the replies.
  void _handleRepliesButtonPressed() {
    ref
        .read(
          providerOfPeamanCommentsListItemProvider(widget.comment.id!).notifier,
        )
        .toggleRepliesVisibility();
  }
}
