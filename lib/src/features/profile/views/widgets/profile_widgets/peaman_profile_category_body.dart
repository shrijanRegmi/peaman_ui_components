import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryBody extends ConsumerStatefulWidget {
  const PeamanProfileCategoryBody({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryBodyState();
}

class _PeamanProfileCategoryBodyState
    extends ConsumerState<PeamanProfileCategoryBody> {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        PeamanProfileFeeds(),
        PeamanProfileAbout(),
      ],
    );
  }
}
