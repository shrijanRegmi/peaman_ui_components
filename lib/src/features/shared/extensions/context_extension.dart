import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  // extend context for theme
  ThemeData get theme => Theme.of(this);

  // extend context for navigation
  dynamic navigateNamed(String route, {final Object? arguments}) =>
      Navigator.of(this).pushNamed(route, arguments: arguments);
  dynamic navigate(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  dynamic popNavigate(Widget widget) => Navigator.of(this).pop();
}
