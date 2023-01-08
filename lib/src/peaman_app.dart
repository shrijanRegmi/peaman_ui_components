import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanApp extends StatelessWidget {
  final String title;
  final ThemeData? theme;
  final ThemeData? darkTheme;

  const PeamanApp({
    super.key,
    required this.title,
    this.theme,
    this.darkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return PeamanWrapper(
      builder: (context, navigatorKey) {
        return MaterialApp(
          title: 'Peaman Example',
          theme: theme ?? PeamanTheme.lightThemePalette,
          darkTheme: darkTheme ?? PeamanTheme.darkThemePalette,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: const PeamanHome(),
        );
      },
    );
  }
}
