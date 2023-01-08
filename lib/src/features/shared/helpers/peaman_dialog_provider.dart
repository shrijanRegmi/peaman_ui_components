import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanDialogProvider {
  final BuildContext context;
  PeamanDialogProvider(this.context);

  // show normal dialog
  Future showNormalDialog({
    required final Widget widget,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(10.0),
        child: widget,
      ),
    );
  }

  // show alert dialog
  Future<void> showAlertDialog({
    required final String title,
    final String? description,
    final String? positiveText,
    final String? negativeText,
    final Function()? onPressedPositiveBtn,
    final Function()? onPressedNegativeBtn,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          insetPadding: const EdgeInsets.all(15.0),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
            bottom: 20.0,
            left: 24.0,
            right: 24.0,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (description != null)
                Text(
                  description,
                  style: const TextStyle(
                    color: PeamanColors.grey,
                    fontSize: 14.0,
                  ),
                ),
              SizedBox(
                height: description != null ? 15.0 : 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PeamanButton.filled(
                      value: positiveText ?? 'Yes',
                      color: PeamanColors.red,
                      onPressed: () {
                        onPressedPositiveBtn?.call();
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      valueStyle: const TextStyle(
                        color: PeamanColors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      borderRadius: 10.0,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: PeamanButton.filled(
                      value: negativeText ?? 'No',
                      color: PeamanColors.green,
                      onPressed: () {
                        onPressedNegativeBtn?.call();
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      valueStyle: const TextStyle(
                        color: PeamanColors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      borderRadius: 10.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // show bottomsheet
  Future showBottomSheet({
    required final Widget widget,
    final double borderRadius = 0.0,
    final bool scrollable = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: scrollable,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      builder: (context) => widget,
    );
  }
}
