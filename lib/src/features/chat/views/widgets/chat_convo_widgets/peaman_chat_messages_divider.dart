import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesDivider extends StatelessWidget {
  final PeamanMessage message;
  const PeamanChatMessagesDivider({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
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
    final messageDate = DateTime.fromMillisecondsSinceEpoch(
      message.updatedAt!,
    );

    final currentDateWithoutHours = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
    );
    final messageDateWithoutHours = DateTime(
      messageDate.year,
      messageDate.month,
      messageDate.day,
    );

    final isToday =
        currentDateWithoutHours.isAtSameMomentAs(messageDateWithoutHours);
    final isYesterday =
        currentDateWithoutHours.difference(messageDateWithoutHours).inDays == 1;

    var date = PeamanDateTimeHelper.getFormattedDate(messageDate);
    if (isToday) {
      date = 'Today';
    } else if (isYesterday) {
      date = "Yesterday";
    }

    return date;
  }
}
