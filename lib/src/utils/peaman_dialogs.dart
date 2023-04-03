import 'package:flutter/cupertino.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

Future<T?> showPeamanConfirmationDialog<T>({
  required final BuildContext context,
  required final String title,
  required final Function() onConfirm,
  final String? description,
}) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) {
      return PeamanConfirmationDialog(
        title: title,
        description: description,
        onConfirm: onConfirm,
      );
    },
  );
}
