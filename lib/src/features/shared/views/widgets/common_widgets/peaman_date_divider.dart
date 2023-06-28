import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanDateDivider extends StatelessWidget {
  final DateTime date;
  final bool withTime;
  final double indent;
  final double endIndent;
  final bool withHorizontalBars;

  const PeamanDateDivider({
    Key? key,
    required this.date,
    this.withTime = false,
    this.withHorizontalBars = true,
    this.indent = 20.0,
    this.endIndent = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: endIndent.w,
        right: endIndent.w,
        top: 15.h,
        bottom: 15.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withHorizontalBars) const Expanded(child: Divider()),
          if (withHorizontalBars)
            SizedBox(
              width: 10.w,
            ),
          PeamanText.body1(
            _getDate(),
            style: TextStyle(
              fontSize: 10.sp,
              color: PeamanColors.grey,
            ),
          ),
          if (withHorizontalBars)
            SizedBox(
              width: 10.w,
            ),
          if (withHorizontalBars) const Expanded(child: Divider()),
        ],
      ),
    );
  }

  String _getDate() {
    final currentDate = DateTime.now();

    final currentDateWithoutHours = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );
    final dateWithoutHours = DateTime(
      date.year,
      date.month,
      date.day,
    );

    final isToday = currentDateWithoutHours.isAtSameMomentAs(dateWithoutHours);
    final isYesterday =
        currentDateWithoutHours.difference(dateWithoutHours).inDays == 1;

    var dateText = PeamanDateTimeHelper.getFormattedDate(date);
    var timeText = PeamanDateTimeHelper.getFormattedTime(
      TimeOfDay(hour: date.hour, minute: date.minute),
    );
    if (isToday) {
      dateText = 'Today';
    } else if (isYesterday) {
      dateText = "Yesterday";
    }

    if (withTime) {
      return '$dateText at $timeText';
    }
    return dateText;
  }
}
