import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanFeedMenuBottomsheet<T>({
  required final BuildContext context,
  required final PeamanFeed feed,
}) {
  return showPeamanSelectableOptionsBottomsheet<T>(
      context: context,
      radio: false,
      optionsBuilder: (context, ref) {
        final uid = ref.watch(
          providerOfLoggedInUser.select((value) => value.uid),
        );
        final isAdmin = ref.watch(
          providerOfLoggedInUser.select((value) => value.isAdmin),
        );
        return [
          if (feed.ownerId == uid || isAdmin)
            PeamanSelectableOption(
              id: 0,
              leading: PeamanRoundIconButton(
                icon: Icon(
                  Icons.delete,
                  color: PeamanColors.white,
                  size: 12.w,
                ),
                padding: EdgeInsets.all(7.w),
                bgColor: context.theme.colorScheme.primary,
              ),
              title: 'Delete post',
            ),
          if (feed.ownerId == uid || isAdmin)
            PeamanSelectableOption(
              id: 1,
              leading: PeamanRoundIconButton(
                icon: Icon(
                  Icons.edit,
                  color: PeamanColors.white,
                  size: 12.w,
                ),
                padding: EdgeInsets.all(7.w),
                bgColor: context.theme.colorScheme.primary,
              ),
              title: 'Edit post',
            ),
          if (feed.ownerId == uid || isAdmin)
            PeamanSelectableOption(
              id: 2,
              leading: PeamanRoundIconButton(
                icon: Icon(
                  Icons.visibility_off_rounded,
                  color: PeamanColors.white,
                  size: 12.w,
                ),
                padding: EdgeInsets.all(7.w),
                bgColor: context.theme.colorScheme.primary,
              ),
              title: 'Hide post',
            ),
          PeamanSelectableOption(
            id: 3,
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.report_rounded,
                color: PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            title: 'Report post',
          ),
        ];
      },
      onSelectOption: (context, ref, option) {
        switch (option.id) {
          case 0:
            showPeamanConfirmationDialog(
              context: context,
              title: 'Are you sure you want to delete this post?',
              description: 'This action is permanent and cannot be undone.',
              onConfirm: (context, ref) {
                ref.read(providerOfPeamanFeed.notifier).deleteFeed(
                      feedId: feed.id!,
                      ownerId: feed.ownerId!,
                      successLogMessage: 'The post has been deleted',
                    );
              },
            );
            break;
          case 1:
            context.pushNamed(
              PeamanCreateFeedScreen.route,
              arguments: PeamanCreateFeedScreenArgs(
                feedToEdit: feed,
              ),
            );
            break;
          case 2:
            showPeamanConfirmationDialog(
              context: context,
              title: 'Are you sure you want to hide this post?',
              description:
                  "This post won't be visible to any user and they won't be able to interact with it.",
              onConfirm: (context, ref) {
                ref.read(providerOfPeamanFeed.notifier).hideFeed(
                      feedId: feed.id!,
                      successLogMessage: 'The post has been hidden',
                    );
              },
            );
            break;
          default:
        }
      });
}
