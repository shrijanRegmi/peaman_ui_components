import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedInitiatorButton extends ConsumerWidget {
  const PeamanFeedInitiatorButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => context.pushNamed(
        PeamanCreateFeedScreen.route,
      ),
      shape: context.theme.floatingActionButtonTheme.shape,
      child: const Icon(Icons.add_rounded),
    );
  }
}
