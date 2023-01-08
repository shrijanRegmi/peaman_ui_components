import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

abstract class PeamanWidget<T> extends Widget {
  const PeamanWidget({super.key});

  @override
  _PeamanWidgetElement createElement() => _PeamanWidgetElement(this);

  @protected
  Widget build(BuildContext context, T vm);

  @protected
  T onCreateVM(BuildContext context);

  @protected
  void onInit(BuildContext context, T vm);

  @protected
  void onDispose(BuildContext context, T vm);
}

class _PeamanWidgetElement<T extends PeamanBaseVM> extends ComponentElement {
  _PeamanWidgetElement(PeamanWidget super.widget);

  @override
  Widget build() {
    final thisWidget = widget as PeamanWidget;
    return PeamanVMProvider<T>(
      vm: thisWidget.onCreateVM(this),
      onInit: (vm) => thisWidget.onInit(this, vm),
      onDispose: (vm) => thisWidget.onDispose(this, vm),
      builder: (context, vm) {
        return thisWidget.build(context, vm);
      },
    );
  }

  @override
  void update(PeamanWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild();
  }
}
