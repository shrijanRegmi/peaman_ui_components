import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCountDetailsOverview extends ConsumerWidget {
  const PeamanProfileCountDetailsOverview({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _itemBuilder(
          title: 'Posts',
          count: user.feedsCount,
        ),
        _dividerBuilder(),
        _itemBuilder(
          title: 'Followers',
          count: user.followersCount,
        ),
        _dividerBuilder(),
        _itemBuilder(
          title: 'Followings',
          count: user.followingCount,
        ),
        _dividerBuilder(),
        _itemBuilder(
          title: 'Reactions',
          count: user.reactionsReceivedFromFeedsCount,
        ),
      ],
    );
  }

  Widget _itemBuilder({
    required final String title,
    required final int count,
    final Function()? onPressed,
  }) {
    return Column(
      children: [
        PeamanText.subtitle1(
          count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        PeamanText.body1(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            color: PeamanColors.grey,
          ),
        ),
      ],
    ).onPressed(onPressed);
  }

  Widget _dividerBuilder() {
    return Container(
      width: 1.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey.withOpacity(0.2),
      ),
    );
  }
}
