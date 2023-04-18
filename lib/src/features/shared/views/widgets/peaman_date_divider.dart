import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanDateDivider extends StatelessWidget {
  final DateTime date;
  final bool withTime;
  final double indent;
  final double endIndent;

  const PeamanDateDivider({
    Key? key,
    required this.date,
    this.withTime = false,
    this.indent = 20.0,
    this.endIndent = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: endIndent,
        right: endIndent,
        top: 15.0,
        bottom: 15.0,
      ),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          const SizedBox(
            width: 10.0,
          ),
          PeamanText.body1(
            _getDate(),
            style: const TextStyle(
              fontSize: 12.0,
              color: PeamanColors.grey,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const Expanded(child: Divider()),
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
