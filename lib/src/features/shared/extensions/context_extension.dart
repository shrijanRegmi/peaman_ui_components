import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Future<T?> pushNamed<T>(String route, {final Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(route, arguments: arguments);
  void pop() => Navigator.of(this).pop();
}
