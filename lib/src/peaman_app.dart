import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanApp extends StatelessWidget {
  final String title;
  final String? initialRoute;
  final Route Function(RouteSettings, Route Function())? onGenerateRoute;
  final ThemeData? theme;
  final ThemeData? darkTheme;

  const PeamanApp({
    super.key,
    required this.title,
    this.initialRoute,
    this.onGenerateRoute,
    this.theme,
    this.darkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return _MaterialApp(
            title: title,
            theme: theme,
            darkTheme: darkTheme,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}

class _MaterialApp extends ConsumerWidget {
  final String title;
  final String? initialRoute;
  final Route Function(RouteSettings, Route Function())? onGenerateRoute;
  final ThemeData? theme;
  final ThemeData? darkTheme;

  const _MaterialApp({
    required this.title,
    this.initialRoute,
    this.onGenerateRoute,
    this.theme,
    this.darkTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(providerOfPeamanError);

    return MaterialApp(
      title: title,
      theme: theme ?? PeamanTheme.lightThemePalette,
      darkTheme: darkTheme ?? PeamanTheme.darkThemePalette,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute ?? PeamanWrapper.route,
      onGenerateRoute: (settings) =>
          onGenerateRoute?.call(
            settings,
            () => PeamanRouter.onGenerateRoute(settings),
          ) ??
          PeamanRouter.onGenerateRoute(settings),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            if (error != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: PeamanErrorPopUp(error: error),
              ),
          ],
        );
      },
    );
  }
}
