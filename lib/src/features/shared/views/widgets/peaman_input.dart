import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanInput extends StatefulWidget {
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
  final String? title;
  final String? initialValue;
  final TextInputType textInputType;
  final int limit;
  final List<TextInputFormatter> inputFormatters;

  const PeamanInput({
    Key? key,
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
    this.title,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.limit = 5000,
    this.inputFormatters = const [],
  }) : super(key: key);

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.requiredPadding ? 15.0 : 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: PeamanText.subtitle1(widget.title!),
            ),
          if (widget.title != null)
            const SizedBox(
              height: 10.0,
            ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onPressed,
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              child: Row(
                children: [
                  if (widget.leading != null) widget.leading!,
                  if (widget.leading != null)
                    const SizedBox(
                      width: 10.0,
                    ),
                  Expanded(
                    child: SizedBox(
                      height: widget.height,
                      child: Center(
                        child: TextFormField(
                          controller: _controller,
                          autofocus: widget.autoFocus,
                          onTap: widget.onPressed,
                          inputFormatters: widget.inputFormatters,
                          enabled: widget.enabled,
                          obscureText: !_passwordVisible,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          maxLength: widget.limit,
                          keyboardType: widget.textInputType,
                          minLines:
                              widget.textInputType == TextInputType.multiline
                                  ? 1
                                  : null,
                          maxLines:
                              widget.textInputType == TextInputType.multiline
                                  ? 8
                                  : 1,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: widget.onFormSubmitted,
                          textCapitalization: widget.textCapitalization,
                          onChanged: (val) {
                            widget.onChanged?.call(val);
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.hintText,
                            counterText: '',
                            hintStyle:
                                context.theme.inputDecorationTheme.hintStyle ??
                                    const TextStyle(
                                      color: Color(0xff888888),
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.password)
                    IconButton(
                      icon: Icon(
                        !_passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      iconSize: 22.0,
                      splashColor: PeamanColors.transparent,
                      splashRadius: 1.0,
                      color: context.theme.colorScheme.secondary,
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  if (widget.trailing != null)
                    const SizedBox(
                      width: 10.0,
                    ),
                  if (widget.trailing != null) widget.trailing!,
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          if (widget.limit != 5000)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: PeamanText.body1(
                    '${widget.limit - _controller.text.length}',
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
