import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanVerifiedBadge extends ConsumerWidget {
  const PeamanVerifiedBadge({
    super.key,
    this.size = 16.0,
  });

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      Icons.verified_rounded,
      color: context.isDarkMode
          ? PeamanColors.white70
          : context.theme.colorScheme.primary,
      size: size.w,
    );
  }
}
