import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategory extends StatefulHookConsumerWidget {
  const PeamanProfileCategory({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryState();
}

class _PeamanProfileCategoryState extends ConsumerState<PeamanProfileCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PeamanProfileCategoryHeader(),
        PeamanProfileCategoryBody(
          user: widget.user,
        ),
      ],
    );
  }
}
