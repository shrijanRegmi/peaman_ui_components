import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileActions extends ConsumerStatefulWidget {
  const PeamanProfileActions({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  ConsumerState<PeamanProfileActions> createState() =>
      _PeamanProfileActionsState();
}

class _PeamanProfileActionsState extends ConsumerState<PeamanProfileActions> {
  @override
  Widget build(BuildContext context) {
    final appUserUid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PeamanButton.filled(
          value: isBtnLoading ? null : btnText,
          minWidth: 130,
          borderRadius: 10.0,
          isLoading: isBtnLoading,
          loader: PeamanSpinner(
            size: 14.w,
            color: PeamanColors.white,
          ),
          onPressed: () =>
              ref.watch(providerOfPeamanUser.notifier).performFollowAction(
                    userId: widget.user.uid!,
                    followSuccessLogMessage:
                        'Follow request has been sent to ${widget.user.name}',
                    unfollowSuccessLogMessage:
                        '${widget.user.name} has been unfollowed',
                    cancelfollowRequestSuccessLogMessage:
                        'Follow request has been canceled',
                    acceptFollowRequestSuccessLogMessage:
                        'Follow request has been accepted',
                    followBackSuccessLogMessage:
                        '${widget.user.name} has been followed',
                  ),
        ),
        SizedBox(
          width: 6.w,
        ),
        PeamanButton.bordered(
          value: 'Message',
          borderRadius: 10.0,
          icon: SvgPicture.asset(
            'assets/svgs/outlined_send_message.svg',
            package: 'peaman_ui_components',
            color: context.isDarkMode
                ? PeamanColors.white70
                : context.theme.colorScheme.primary,
            width: 14.w,
          ),
          onPressed: () => context.pushNamed(
            PeamanChatConversationScreen.route,
            arguments: PeamanChatConversationArgs.byUserIds(
              userIds: [
                widget.user.uid!,
                appUserUid!,
              ]..sort(),
              chatType: PeamanChatType.oneToOne,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        PeamanButton.filled(
          minWidth: 0.0,
          borderRadius: 10.0,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          color: PeamanColors.extraLightGrey.withOpacity(0.16),
          splashColor: PeamanColors.transparent,
          icon: Icon(
            Icons.arrow_drop_down_rounded,
            color: context.isDarkMode
                ? PeamanColors.white70
                : context.theme.colorScheme.primary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  String get btnText {
    final status = ref.watch(
      providerOfPeamanUserRelationshipStatus(widget.user.uid!),
    );
    switch (status) {
      case PeamanUserRelationshipStatus.follow:
        return 'Follow';
      case PeamanUserRelationshipStatus.unfollow:
        return 'Unfollow';
      case PeamanUserRelationshipStatus.cancelFollowRequest:
        return 'Cancel Request';
      case PeamanUserRelationshipStatus.acceptFollowRequest:
        return 'Accept';
      case PeamanUserRelationshipStatus.followBack:
        return 'Follow Back';
      default:
        return '';
    }
  }

  bool get isBtnLoading {
    final userProvider = ref.watch(providerOfPeamanUser);

    final isLoadingFollowUser = userProvider.followUserState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    final isLoadingUnfollowUser = userProvider.unfollowUserState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    final isLoadingCancelFollowRequest =
        userProvider.cancelFollowState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    final isLoadingAcceptFollowRequest =
        userProvider.acceptFollowState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    final isLoadingFollowBackUser = userProvider.followBackState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return isLoadingFollowUser ||
        isLoadingUnfollowUser ||
        isLoadingCancelFollowRequest ||
        isLoadingAcceptFollowRequest ||
        isLoadingFollowBackUser;
  }
}
