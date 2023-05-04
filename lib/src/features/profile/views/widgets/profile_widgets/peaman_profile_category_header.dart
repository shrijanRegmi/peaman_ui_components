import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryHeader extends ConsumerStatefulWidget {
  const PeamanProfileCategoryHeader({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryHeaderState();
}

class _PeamanProfileCategoryHeaderState
    extends ConsumerState<PeamanProfileCategoryHeader> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: context.theme.colorScheme.primary,
      labelColor: PeamanColors.primary,
      unselectedLabelColor: PeamanColors.extraLightGrey,
      tabs: const [
        Tab(
          icon: Icon(
            Icons.category_rounded,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.person_pin_rounded,
          ),
        ),
      ],
    ).pX(20);
  }
}
