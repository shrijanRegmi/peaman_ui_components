import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  void unfocus() => FocusScope.of(this).unfocus();

  Future<T?> pushNamed<T>(final String route, {final dynamic arguments}) =>
      Navigator.of(this).pushNamed<T>(route, arguments: arguments);
  Future<T?> pushNamedAndRemoveUntil<T>(
    final String route, {
    final dynamic arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil<T>(
        route,
        (r) => route == r.settings.name,
        arguments: arguments,
      );

  void pop<T>({final T? argument}) => Navigator.of(this).pop(argument);
}
