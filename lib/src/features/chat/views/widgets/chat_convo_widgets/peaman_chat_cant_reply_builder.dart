import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatCantReplyBuilder extends StatelessWidget {
  const PeamanChatCantReplyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.primary,
          ),
          padding: const EdgeInsets.all(5.0),
          child: const Center(
            child: PeamanText.body2(
              "You can't reply to this conversation at this moment.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PeamanColors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
