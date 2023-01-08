import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class HomeScreenArgs {
  final String something;

  HomeScreenArgs(this.something);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PeamanButton.filled(
          value: 'Home Screen',
          onPressed: () {},
        ),
      ),
    );
  }
}
