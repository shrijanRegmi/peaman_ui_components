import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageSeenIndicator extends StatelessWidget {
  const PeamanChatMessageSeenIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 5.0),
      child: PeamanText.body2(
        'Seen',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: PeamanColors.grey,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
