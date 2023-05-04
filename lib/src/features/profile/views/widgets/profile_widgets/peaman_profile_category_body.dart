import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryBody extends ConsumerStatefulWidget {
  const PeamanProfileCategoryBody({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryBodyState();
}

class _PeamanProfileCategoryBodyState
    extends ConsumerState<PeamanProfileCategoryBody> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.controller,
      children: const [
        PeamanProfileFeeds(),
        PeamanProfileAbout(),
      ],
    );
  }
}
