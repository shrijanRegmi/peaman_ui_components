import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanSplashScreen extends ConsumerWidget {
  const PeamanSplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            PeamanText.heading2('Peaman'),
            PeamanText.body2(
              'A service for building social media\napps with ease!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
