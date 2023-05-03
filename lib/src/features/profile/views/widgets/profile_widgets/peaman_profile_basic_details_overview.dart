import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileBasicDetailsOverview extends ConsumerWidget {
  const PeamanProfileBasicDetailsOverview({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          PeamanAvatarBuilder.network(
            user.photo,
            size: 100.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          PeamanText.subtitle1(
            user.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.h,
          ),
          PeamanText.body1(
            user.bio,
            style: TextStyle(
              fontSize: 12.sp,
              color: PeamanColors.greyDark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).pX(20.0);
  }
}
