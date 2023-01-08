import 'package:example/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanApp extends StatelessWidget {
  const PeamanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PeamanWrapper(
      builder: (context, navigatorKey) {
        return MaterialApp(
          title: 'Peaman Example',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const Wrapper(),
        );
      },
    );
  }
}
