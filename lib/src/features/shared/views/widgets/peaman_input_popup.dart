import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanInputPopup extends ConsumerStatefulWidget {
  const PeamanInputPopup({
    super.key,
    this.title = '',
    this.expandOnKeyboard = true,
    this.controller,
    this.autoFocus = false,
    this.hintText = '',
    this.onPressed,
    this.onFormSubmitted,
    this.onChanged,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.requiredPadding = true,
    this.height,
    this.password = false,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.limit = 5000,
    this.inputFormatters = const [],
    this.onPressedSubmit,
  });

  final String title;
  final bool expandOnKeyboard;

  final TextEditingController? controller;
  final bool autoFocus;
  final String hintText;
  final Function()? onPressed;
  final Function(String)? onFormSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final bool requiredPadding;
  final double? height;
  final bool password;
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final TextInputType textInputType;
  final int limit;
  final List<TextInputFormatter> inputFormatters;
  final Function(BuildContext, WidgetRef, String)? onPressedSubmit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanInputPopupState();
}

class _PeamanInputPopupState extends ConsumerState<PeamanInputPopup> {
  bool _isKeyboardVisible = false;
  late KeyboardVisibilityController _keyboardVisibilityController;
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardVisibilityController.onChange.listen((event) {
      if (!_isKeyboardVisible) {
        if (mounted) {
          setState(() {
            _isKeyboardVisible = event;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _headerBuilder().pX(20).pT(20).pB(15),
              _inputBuilder().pX(20),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          _actionWidgetsBuilder().pX(20).pB(
              _isKeyboardVisible && widget.expandOnKeyboard
                  ? MediaQuery.of(context).viewInsets.bottom + 10.0
                  : 20.0),
        ],
      ),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PeamanText.heading6(
          widget.title,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        PeamanRoundIconButton(
          icon: Icon(
            Icons.close_rounded,
            size: 16.w,
          ),
          padding: EdgeInsets.all(9.w),
          onPressed: () => context.pop(),
        )
      ],
    );
  }

  Widget _inputBuilder() {
    return PeamanInput(
      controller: widget.controller ?? _inputController,
      autoFocus: widget.autoFocus,
      hintText: widget.hintText,
      onPressed: widget.onPressed,
      onFormSubmitted: widget.onFormSubmitted,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      leading: widget.leading,
      trailing: widget.trailing,
      requiredPadding: widget.requiredPadding,
      height: widget.height,
      password: widget.password,
      textCapitalization: widget.textCapitalization,
      initialValue: widget.initialValue,
      textInputType: widget.textInputType,
      limit: widget.limit,
      inputFormatters: widget.inputFormatters,
    );
  }

  Widget _actionWidgetsBuilder() {
    return Row(
      children: [
        Expanded(
          child: PeamanButton.bordered(
            value: 'Cancel',
            borderSide: BorderSide(
              color: context.isDarkMode
                  ? PeamanColors.lightGrey
                  : PeamanColors.primary,
            ),
            onPressed: () => context.pop(),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: PeamanButton.filled(
            value: 'Submit',
            onPressed: () {
              context.pop();
              widget.onPressedSubmit?.call(
                context,
                ref,
                _inputController.text.trim(),
              );
            },
          ),
        ),
      ],
    );
  }
}
