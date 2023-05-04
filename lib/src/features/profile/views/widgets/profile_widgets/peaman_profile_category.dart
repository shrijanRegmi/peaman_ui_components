import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategory extends StatefulHookConsumerWidget {
  const PeamanProfileCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryState();
}

class _PeamanProfileCategoryState extends ConsumerState<PeamanProfileCategory> {
  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    return Column(
      children: [
        PeamanProfileCategoryHeader(
          controller: tabController,
        ),
        Expanded(
          child: PeamanProfileCategoryBody(
            controller: tabController,
          ),
        ),
      ],
    );
  }
}
