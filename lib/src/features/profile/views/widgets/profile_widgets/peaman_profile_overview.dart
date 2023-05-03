import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileOverview extends ConsumerWidget {
  const PeamanProfileOverview({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        PeamanProfileBasicDetailsOverview(
          user: user,
        ),
        SizedBox(
          height: 35.h,
        ),
        PeamanProfileCountDetailsOverview(
          user: user,
        ),
      ],
    );
  }
}
