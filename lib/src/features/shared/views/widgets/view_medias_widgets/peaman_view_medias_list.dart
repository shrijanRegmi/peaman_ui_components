import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanViewMediasList extends ConsumerStatefulWidget {
  final List<PeamanFileUrlExtended> urls;
  final int index;
  final PageController? pageController;
  final void Function(int)? onPageChanged;

  const PeamanViewMediasList({
    super.key,
    required this.urls,
    this.index = 0,
    this.pageController,
    this.onPageChanged,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewMediasListState();
}

class _PeamanViewMediasListState extends ConsumerState<PeamanViewMediasList> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.urls.length,
      controller: widget.pageController,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        final url = widget.urls[index];
        return PeamanViewMediasListItem(url: url);
      },
    );
  }
}
