import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileActions extends ConsumerStatefulWidget {
  const PeamanProfileActions({
    super.key,
    required this.user,
    this.followButtonBuilder,
    this.messageButtonBuilder,
    this.otherActionsButtonBuilder,
    this.actionWidgetsBuilder,
    this.onPressedFollowButton,
    this.onPressedMessageButton,
    this.onPressedOtherActionsButton,
  });

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? followButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? messageButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? otherActionsButtonBuilder;

  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Widget followButtonBuilder,
    Widget messageButtonBuilder,
    Widget otherActionsButtonBuilder,
  )? actionWidgetsBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedFollowButton;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedMessageButton;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
    Function(),
  )? onPressedOtherActionsButton;

  @override
  ConsumerState<PeamanProfileActions> createState() =>
      _PeamanProfileActionsState();
}

class _PeamanProfileActionsState extends ConsumerState<PeamanProfileActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.actionWidgetsBuilder?.call(
            context,
            ref,
            widget.user,
            _followButtonBuilder(),
            _messageButtonBuilder(),
            _otherActionsBuilder(),
          ) ??
          [
            _followButtonBuilder().pR(6.0),
            _messageButtonBuilder().pR(5.0),
            _otherActionsBuilder(),
          ],
    );
  }

  Widget _followButtonBuilder() {
    return widget.followButtonBuilder?.call(
          context,
          ref,
          widget.user,
          _onPressedFollow,
        ) ??
        PeamanButton.filled(
          value: isBtnLoading ? null : btnText,
          minWidth: 130,
          borderRadius: 10.0,
          isLoading: isBtnLoading,
          loader: PeamanSpinner(
            size: 14.w,
            color: PeamanColors.white,
          ),
          onPressed: () => widget.onPressedFollowButton == null
              ? _onPressedFollow()
              : widget.onPressedFollowButton?.call(
                  context,
                  ref,
                  widget.user,
                  _onPressedFollow,
                ),
        );
  }

  Widget _messageButtonBuilder() {
    return widget.messageButtonBuilder?.call(
          context,
          ref,
          widget.user,
          _onPressedMessage,
        ) ??
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
          onPressed: () => widget.onPressedMessageButton == null
              ? _onPressedMessage()
              : widget.onPressedMessageButton?.call(
                  context,
                  ref,
                  widget.user,
                  _onPressedMessage,
                ),
        );
  }

  Widget _otherActionsBuilder() {
    return widget.otherActionsButtonBuilder?.call(
          context,
          ref,
          widget.user,
          _onPressedMessage,
        ) ??
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
          onPressed: () => widget.onPressedOtherActionsButton == null
              ? _onPressedOtherActions()
              : widget.onPressedOtherActionsButton?.call(
                  context,
                  ref,
                  widget.user,
                  _onPressedOtherActions,
                ),
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

  void _onPressedFollow() {
    ref.watch(providerOfPeamanUser.notifier).performFollowAction(
          userId: widget.user.uid!,
          followSuccessLogMessage:
              'Follow request has been sent to ${widget.user.name}',
          unfollowSuccessLogMessage: '${widget.user.name} has been unfollowed',
          cancelfollowRequestSuccessLogMessage:
              'Follow request has been canceled',
          acceptFollowRequestSuccessLogMessage:
              'Follow request has been accepted',
          followBackSuccessLogMessage: '${widget.user.name} has been followed',
        );
  }

  void _onPressedMessage() {
    final uid = ref.read(
      providerOfLoggedInUser.select((value) => value.uid),
    );
    context.pushNamed(
      PeamanChatConversationScreen.route,
      arguments: PeamanChatConversationArgs.byUserIds(
        userIds: [
          widget.user.uid!,
          uid!,
        ]..sort(),
        chatType: PeamanChatType.oneToOne,
      ),
    );
  }

  void _onPressedOtherActions() {}
}
