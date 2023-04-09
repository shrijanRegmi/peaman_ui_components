import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanSelectableOptionsBottomsheet extends ConsumerStatefulWidget {
  final int? activeIndex;
  final List<PeamanSelectableOption> Function(BuildContext, WidgetRef)
      optionsBuilder;
  final Function(BuildContext, WidgetRef, PeamanSelectableOption)?
      onSelectOption;
  final bool radio;
  final bool popNavigationOnSelect;
  final EdgeInsets? padding;
  final EdgeInsets? itemPadding;
  const PeamanSelectableOptionsBottomsheet({
    super.key,
    this.activeIndex,
    required this.optionsBuilder,
    this.onSelectOption,
    this.radio = true,
    this.popNavigationOnSelect = true,
    this.padding,
    this.itemPadding,
  });

  @override
  ConsumerState<PeamanSelectableOptionsBottomsheet> createState() =>
      _SelectableOptionsBottomsheetContentState();
}

class _SelectableOptionsBottomsheetContentState
    extends ConsumerState<PeamanSelectableOptionsBottomsheet> {
  int? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.optionsBuilder(context, ref);
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < options.length; i++)
            !widget.radio
                ? ListTile(
                    contentPadding: widget.itemPadding,
                    title: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              if (options[i].leading != null)
                                options[i].leading!,
                              if (options[i].leading != null)
                                const SizedBox(
                                  width: 20.0,
                                ),
                              if (options[i].title != null)
                                Text(options[i].title!),
                            ],
                          ),
                        ),
                        if (options[i].trailing != null)
                          const SizedBox(
                            width: 20.0,
                          ),
                        if (options[i].trailing != null) options[i].trailing!,
                      ],
                    ),
                    onTap: () {
                      if (widget.popNavigationOnSelect) context.pop();
                      widget.onSelectOption?.call(context, ref, options[i]);
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
                              if (options[i].leading != null)
                                options[i].leading!,
                              if (options[i].leading != null)
                                const SizedBox(
                                  width: 20.0,
                                ),
                              if (options[i].title != null)
                                Text(options[i].title!),
                            ],
                          ),
                        ),
                        if (options[i].trailing != null)
                          const SizedBox(
                            width: 20.0,
                          ),
                        if (options[i].trailing != null) options[i].trailing!,
                      ],
                    ),
                    onChanged: (val) {
                      setState(() {
                        _selectedValue = val;
                      });

                      Future.delayed(
                        const Duration(milliseconds: 300),
                        () {
                          if (widget.popNavigationOnSelect) context.pop();
                          widget.onSelectOption?.call(context, ref, options[i]);
                        },
                      );
                    },
                  ),
        ],
      ),
    );
  }
}
