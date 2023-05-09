import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChip extends ConsumerStatefulWidget {
  final String value;
  final String groupId;
  final Color? inActiveColor;
  final Color? activeColor;
  final Color? textColor;
  final bool isActive;

  const PeamanChip({
    super.key,
    required this.value,
    required this.groupId,
    this.isActive = false,
    this.inActiveColor,
    this.activeColor,
    this.textColor,
  });

  @override
  ConsumerState<PeamanChip> createState() => _PeamanChipState();
}

class _PeamanChipState extends ConsumerState<PeamanChip> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        if (widget.isActive) {
          ref
              .read(providerOfPeamanChip.notifier)
              .selectChip(value: widget.value, groupId: widget.groupId);
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant PeamanChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isActive != widget.isActive) {
      Future.delayed(const Duration(milliseconds: 10), () {
        if (mounted) {
          if (widget.isActive) {
            ref
                .read(providerOfPeamanChip.notifier)
                .selectChip(value: widget.value, groupId: widget.groupId);
          } else {
            ref
                .read(providerOfPeamanChip.notifier)
                .deselectChip(value: widget.value, groupId: widget.groupId);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(providerOfPeamanChip);
    final notifier = ref.read(providerOfPeamanChip.notifier);
    return state[widget.groupId] == widget.value
        ? PeamanButton.filled(
            value: widget.value,
            borderRadius: 100.r,
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 18.w,
            ),
            color: widget.activeColor ?? context.theme.colorScheme.primary,
            onPressed: () => notifier.deselectChip(
              value: widget.value,
              groupId: widget.groupId,
            ),
          )
        : PeamanButton.bordered(
            value: widget.value,
            borderRadius: 100.r,
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 18.w,
            ),
            borderSide: BorderSide(
              color: widget.inActiveColor ?? context.theme.colorScheme.primary,
            ),
            valueStyle: TextStyle(
              color: widget.textColor ?? context.theme.colorScheme.primary,
            ),
            onPressed: () => notifier.selectChip(
              value: widget.value,
              groupId: widget.groupId,
            ),
          );
  }
}
