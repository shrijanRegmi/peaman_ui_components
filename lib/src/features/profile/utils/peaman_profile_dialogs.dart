import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanProfileMenuBottomsheet<T>({
  required final BuildContext context,
  required final String userId,
}) {
  return showPeamanSelectableOptionsBottomsheet<T>(
    context: context,
    radio: false,
    optionsBuilder: (context, ref) {
      final userFuture = ref.watch(
        providerOfSingleUserByIdFuture(userId),
      );
      final name = userFuture.maybeWhen(
        data: (data) => data.when(
          (success) => success.name?.split(' ').first,
          (failure) => '',
        ),
        orElse: () => '',
      );

      final blockedUsersStream = ref.read(providerOfPeamanBlockedUsersStream);
      final isUserBlocked = blockedUsersStream.maybeWhen(
        data: (data) => data.map((e) => e.uid).toList().contains(userId),
        orElse: () => false,
      );
      return [
        PeamanSelectableOption(
          id: 0,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.app_blocking_rounded,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: '${isUserBlocked ? 'Unblock' : 'Block'} $name',
        ),
        PeamanSelectableOption(
          id: 1,
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.report_rounded,
              color: PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          title: 'Report $name',
        ),
      ];
    },
    onSelectOption: (context, ref, option) {
      final userFuture = ref.read(
        providerOfSingleUserByIdFuture(userId),
      );
      final user = userFuture.maybeWhen(
        data: (data) => data.when(
          (success) => success,
          (failure) => null,
        ),
        orElse: () => null,
      );
      final blockedUsersStream = ref.read(providerOfPeamanBlockedUsersStream);
      final isUserBlocked = blockedUsersStream.maybeWhen(
        data: (data) => data.map((e) => e.uid).toList().contains(userId),
        orElse: () => false,
      );

      switch (option.id) {
        case 0:
          showPeamanConfirmationDialog(
            context: context,
            title:
                'Are you sure you want to ${isUserBlocked ? 'unblock' : 'block'} ${user?.name}?',
            description:
                'This action is not permanent and you can decide to undo this action at any time.',
            onConfirm: (context, ref) {
              final successLogMessage =
                  '${user?.name} has been ${isUserBlocked ? 'unblocked' : 'blocked'}';
              ref.read(providerOfPeamanUser.notifier).toggleBlockUnblock(
                    friendId: userId,
                    successLogMessage: successLogMessage,
                  );
            },
          );
          break;
        case 1:
          showPeamanNormalBottomsheet(
            context: context,
            widget: PeamanReportPopup.user(
              userId: userId,
            ),
          );
          break;
        default:
      }
    },
  );
}
