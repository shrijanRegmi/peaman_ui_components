import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Peaman.initializeApp();

  runApp(
    const PeamanApp(title: 'Peaman'),
  );
}
