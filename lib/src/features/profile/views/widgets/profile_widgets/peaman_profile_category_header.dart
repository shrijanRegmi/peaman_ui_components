import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryHeader extends ConsumerStatefulWidget {
  const PeamanProfileCategoryHeader({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryHeaderState();
}

class _PeamanProfileCategoryHeaderState
    extends ConsumerState<PeamanProfileCategoryHeader> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: context.isDarkMode
          ? PeamanColors.white70
          : context.theme.colorScheme.primary,
      labelColor: context.isDarkMode
          ? PeamanColors.white70
          : context.theme.colorScheme.primary,
      unselectedLabelColor: PeamanColors.extraLightGrey,
      indicatorWeight: 1.2,
      tabs: [
        Tab(
          icon: Icon(
            Icons.category_rounded,
            size: 20.w,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.image_rounded,
            size: 19.w,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.play_arrow_rounded,
            size: 26.w,
          ),
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/svgs/filled_youtube.svg',
            width: 20.w,
            color: _selectedIndex == 3
                ? context.isDarkMode
                    ? PeamanColors.white70
                    : context.theme.colorScheme.primary
                : PeamanColors.extraLightGrey,
            package: 'peaman_ui_components',
          ),
        ),
        Tab(
          icon: Icon(
            Icons.poll_rounded,
            size: 20.w,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.person_pin_rounded,
            size: 20.w,
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
