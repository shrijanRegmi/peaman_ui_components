import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanSpinner extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final double size;

  const PeamanSpinner({
    super.key,
    this.color,
    this.strokeWidth = 1.2,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? context.theme.colorScheme.primary,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
