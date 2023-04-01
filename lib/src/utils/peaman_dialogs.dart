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

Future<T?> showPeamanErrorDialog<T>({
  required final BuildContext context,
  required final PeamanError error,
}) {
  return showCupertinoModalPopup<T>(
    context: context,
    barrierColor: PeamanColors.transparent,
    builder: (context) {
      return PeamanErrorPopUp(error: error);
    },
  );
}
