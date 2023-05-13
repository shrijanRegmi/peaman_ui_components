import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanInput extends StatefulWidget {
  const PeamanInput({
    Key? key,
    this.controller,
    this.autoFocus = false,
    this.contentPadding,
    this.hintText = '',
    this.onPressed,
    this.onFormSubmitted,
    this.onChanged,
    this.enabled = true,
    this.leading,
    this.trailing,
    this.height,
    this.password = false,
    this.textCapitalization = TextCapitalization.none,
    this.title,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.limit = 5000,
    this.inputFormatters = const [],
  }) : super(key: key);

  final TextEditingController? controller;
  final bool autoFocus;
  final String hintText;
  final EdgeInsets? contentPadding;
  final Function()? onPressed;
  final Function(String)? onFormSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final bool password;
  final TextCapitalization textCapitalization;
  final String? title;
  final String? initialValue;
  final TextInputType textInputType;
  final int limit;
  final List<TextInputFormatter> inputFormatters;

  @override
  State<PeamanInput> createState() => _PInputState();
}

class _PInputState extends State<PeamanInput> {
  bool _passwordVisible = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = !widget.password;

    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void didUpdateWidget(covariant PeamanInput oldWidget) {
    if (widget.controller != null &&
        oldWidget.controller != widget.controller) {
      _controller = widget.controller!;
    }
    if (widget.initialValue != null &&
        oldWidget.initialValue != widget.initialValue) {
      _controller.text = widget.initialValue!;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(
          offset: _controller.text.length,
        ),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: PeamanText.subtitle1(widget.title!),
          ),
        if (widget.title != null)
          SizedBox(
            height: 10.h,
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: TextFormField(
            controller: _controller,
            autofocus: widget.autoFocus,
            onTap: widget.onPressed,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            obscureText: !_passwordVisible,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            maxLength: widget.limit,
            keyboardType: widget.textInputType,
            minLines:
                widget.textInputType == TextInputType.multiline ? 1 : null,
            maxLines: widget.textInputType == TextInputType.multiline ? 8 : 1,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: widget.onFormSubmitted,
            textCapitalization: widget.textCapitalization,
            onChanged: (val) {
              widget.onChanged?.call(val);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              counterText: '',
              contentPadding: widget.contentPadding ??
                  context.theme.inputDecorationTheme.contentPadding,
              prefixIcon: widget.leading,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.trailing ??
                      (widget.password
                          ? IconButton(
                              icon: Icon(
                                !_passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              iconSize: 22.0,
                              splashColor: PeamanColors.transparent,
                              splashRadius: 1.0,
                              color: context
                                  .theme.inputDecorationTheme.suffixIconColor,
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            )
                          : const SizedBox()),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        if (widget.limit != 5000)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: PeamanText.body1(
                  '${widget.limit - _controller.text.length}',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
