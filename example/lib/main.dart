import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final result = await Peaman.initializeApp();
  result.when(
    (success) => runApp(
      const PeamanApp(title: 'Peaman'),
    ),
    (failure) => log(failure.message),
  );
}
