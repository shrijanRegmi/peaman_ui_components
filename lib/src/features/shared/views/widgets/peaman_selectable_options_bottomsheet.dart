import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanSelectableOptionsBottomsheet extends StatefulWidget {
  final int? activeIndex;
  final List<PeamanSelectableOption> options;
  final Function(PeamanSelectableOption)? onSelectOption;
  final bool radio;
  final EdgeInsets? padding;
  final EdgeInsets? itemPadding;
  const PeamanSelectableOptionsBottomsheet({
    super.key,
    this.activeIndex,
    required this.options,
    this.onSelectOption,
    this.radio = true,
    this.padding,
    this.itemPadding,
  });

  @override
  State<PeamanSelectableOptionsBottomsheet> createState() =>
      _SelectableOptionsBottomsheetContentState();
}

class _SelectableOptionsBottomsheetContentState
    extends State<PeamanSelectableOptionsBottomsheet> {
  int? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < widget.options.length; i++)
            !widget.radio
                ? ListTile(
                    contentPadding: widget.itemPadding,
                    title: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              if (widget.options[i].leading != null)
                                widget.options[i].leading!,
                              if (widget.options[i].leading != null)
                                const SizedBox(
                                  width: 20.0,
                                ),
                              if (widget.options[i].title != null)
                                Text(widget.options[i].title!),
                            ],
                          ),
                        ),
                        if (widget.options[i].trailing != null)
                          const SizedBox(
                            width: 20.0,
                          ),
                        if (widget.options[i].trailing != null)
                          widget.options[i].trailing!,
                      ],
                    ),
                    onTap: () {
                      context.pop();
                      widget.onSelectOption?.call(widget.options[i]);
                    },
                  )
                : RadioListTile<int?>(
                    value: i,
                    groupValue: _selectedValue,
                    contentPadding: widget.itemPadding,
                    title: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              if (widget.options[i].leading != null)
                                widget.options[i].leading!,
                              if (widget.options[i].leading != null)
                                const SizedBox(
                                  width: 20.0,
                                ),
                              if (widget.options[i].title != null)
                                Text(widget.options[i].title!),
                            ],
                          ),
                        ),
                        if (widget.options[i].trailing != null)
                          const SizedBox(
                            width: 20.0,
                          ),
                        if (widget.options[i].trailing != null)
                          widget.options[i].trailing!,
                      ],
                    ),
                    onChanged: (val) {
                      setState(() {
                        _selectedValue = val;
                      });

                      Future.delayed(
                        const Duration(milliseconds: 300),
                        () {
                          context.pop();
                          widget.onSelectOption?.call(widget.options[val ?? 0]);
                        },
                      );
                    },
                  ),
        ],
      ),
    );
  }
}
