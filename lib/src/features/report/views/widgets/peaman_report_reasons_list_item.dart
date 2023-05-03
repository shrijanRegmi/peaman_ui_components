import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanReportReasonsListItem extends StatelessWidget {
  final String reason;
  final Function()? onPressed;

  const PeamanReportReasonsListItem({
    super.key,
    required this.reason,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      dense: true,
      title: PeamanText.body1(reason),
    );
  }
}
