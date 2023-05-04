import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileAbout extends ConsumerStatefulWidget {
  const PeamanProfileAbout({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileAboutState();
}

class _PeamanProfileAboutState extends ConsumerState<PeamanProfileAbout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        _itemBuilder(
          icon: PeamanRoundIconButton(
            icon: Icon(
              Icons.person_rounded,
              color: PeamanColors.primary,
              size: 18.w,
            ),
            padding: EdgeInsets.all(10.w),
          ),
          title: 'Gender',
          subtitle: 'Male',
        ),
        _itemBuilder(
          icon: PeamanRoundIconButton(
            icon: Icon(
              Icons.calendar_today_rounded,
              color: PeamanColors.primary,
              size: 14.w,
            ),
            padding: EdgeInsets.all(12.5.w),
          ),
          title: 'Date of Birth',
          subtitle: '14 November 2002',
        ),
        _itemBuilder(
          icon: PeamanRoundIconButton(
            icon: Icon(
              Icons.flag_rounded,
              color: PeamanColors.primary,
              size: 18.w,
            ),
            padding: EdgeInsets.all(10.w),
          ),
          title: 'Country',
          subtitle: 'Nepal',
        ),
        _itemBuilder(
          icon: PeamanRoundIconButton(
            icon: Icon(
              Icons.language_rounded,
              color: PeamanColors.primary,
              size: 18.w,
            ),
            padding: EdgeInsets.all(10.w),
          ),
          title: 'Languages',
          subtitle: 'Nepali, English, German, French',
        ),
      ],
    );
  }

  Widget _itemBuilder({
    required final Widget icon,
    required final String title,
    required final String subtitle,
    final Function()? onPressed,
  }) {
    return ListTile(
      leading: icon,
      minLeadingWidth: 10.w,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PeamanText.body2(
            title,
            style: TextStyle(
              fontSize: 10.sp,
              color: PeamanColors.greyDark,
            ),
          ),
          PeamanText.body1(
            subtitle,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: onPressed,
    ).pY(3);
  }
}
