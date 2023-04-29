import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInitiatorButton extends ConsumerWidget {
  const PeamanChatInitiatorButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => showPeamanChatInitiatorDialog(
        context: context,
      ),
      shape: context.theme.floatingActionButtonTheme.shape,
      child: const Icon(Icons.add_rounded),
    );
  }
}
