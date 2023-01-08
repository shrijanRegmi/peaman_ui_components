import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanVMProvider<T extends PeamanBaseVM> extends StatefulWidget {
  final T vm;
  final Widget Function(BuildContext, T) builder;
  final bool loading;
  final Widget? loadingWidget;
  final Function(T)? onInit;
  final Function(T)? onDispose;
  final Function(PeamanVMProvider<T>, T)? onDidUpdateWidget;
  final Function(T)? onLoadingCompleted;
  const PeamanVMProvider({
    Key? key,
    required this.vm,
    required this.builder,
    this.loading = false,
    this.loadingWidget,
    this.onInit,
    this.onDispose,
    this.onDidUpdateWidget,
    this.onLoadingCompleted,
  }) : super(key: key);

  @override
  State<PeamanVMProvider<T>> createState() => _VMProviderState<T>();
}

class _VMProviderState<T extends PeamanBaseVM>
    extends State<PeamanVMProvider<T>> {
  @override
  void initState() {
    super.initState();
    widget.onInit?.call(widget.vm);

    if (!widget.loading) {
      widget.onLoadingCompleted?.call(widget.vm);
    }
  }

  @override
  void didUpdateWidget(PeamanVMProvider<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.onDidUpdateWidget?.call(oldWidget, widget.vm);

    final oldLoading = oldWidget.loading;
    final newLoading = widget.loading;

    if (oldLoading != newLoading && !newLoading) {
      widget.onLoadingCompleted?.call(widget.vm);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading) return widget.loadingWidget ?? Container();

    return PStateProvider.changeNotifier<T>(
      create: (_) => widget.vm,
      builder: (context, child) {
        return PStateProvider.consumer<T>(
          builder: (context, value, child) {
            return WillPopScope(
              onWillPop: () async {
                widget.onDispose?.call(value);
                return true;
              },
              child: widget.builder(context, value),
            );
          },
        );
      },
    );
  }
}
