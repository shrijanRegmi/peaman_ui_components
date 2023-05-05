import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileOverview extends ConsumerWidget {
  const PeamanProfileOverview({
    super.key,
    required this.user,
    this.basicDetailsOverviewBuilder,
    this.countDetailsOverviewBuilder,
  });

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? basicDetailsOverviewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? countDetailsOverviewBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        basicDetailsOverviewBuilder?.call(context, ref, user) ??
            PeamanProfileBasicDetailsOverview(
              user: user,
            ).pB(20),
        countDetailsOverviewBuilder?.call(context, ref, user) ??
            PeamanProfileCountDetailsOverview(
              user: user,
            ),
      ],
    );
  }
}
