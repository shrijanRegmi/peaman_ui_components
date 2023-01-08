import 'package:flutter/material.dart';

class PeamanDateTimeHelper {
  // format date
  static String getFormattedDate(final DateTime dateTime) {
    final result =
        '${_getMonth(dateTime.month)} ${dateTime.day}, ${dateTime.year}';
    return result;
  }

  // format time
  static String getFormattedTime(final TimeOfDay timeOfDay) {
    return '${timeOfDay.hour > 12 ? (timeOfDay.hour - 12).toString().length == 1 ? '0${timeOfDay.hour - 12}' : timeOfDay.hour - 12 : timeOfDay.hour}:${timeOfDay.minute.toString().length == 1 ? '0${timeOfDay.minute}' : timeOfDay.minute} ${timeOfDay.hour >= 12 ? 'PM' : 'AM'}';
  }

  static String _getMonth(int month) {
    switch (month) {
      case 1:
        return 'January';

      case 2:
        return 'February';

      case 3:
        return 'March';

      case 4:
        return 'April';

      case 5:
        return 'May';

      case 6:
        return 'June';

      case 7:
        return 'July';

      case 8:
        return 'August';

      case 9:
        return 'September';

      case 10:
        return 'October';

      case 11:
        return 'November';

      case 12:
        return 'December';

      default:
        return 'January';
    }
  }
}
