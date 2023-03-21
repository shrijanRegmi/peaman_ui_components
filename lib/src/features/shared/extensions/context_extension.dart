import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  Future<T?> pushNamed<T>(String route, {final Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(route, arguments: arguments);
  void pop() => Navigator.of(this).pop();

  dynamic navigateNamed(String route, {final Object? arguments}) =>
      Navigator.of(this).pushNamed(route, arguments: arguments);
  dynamic navigate(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
}
