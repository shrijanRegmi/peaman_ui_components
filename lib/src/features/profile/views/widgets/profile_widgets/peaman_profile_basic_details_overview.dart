import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileBasicDetailsOverview extends ConsumerWidget {
  const PeamanProfileBasicDetailsOverview({
    super.key,
    required this.user,
    this.avatarBuilder,
    this.nameBuilder,
    this.bioBuilder,
  });

  final PeamanUser user;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? avatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? nameBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? bioBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          avatarBuilder?.call(context, ref, user) ??
              PeamanAvatarBuilder.network(
                user.photo,
                size: 100.w,
                userId: user.uid,
              ).pB(10),
          nameBuilder?.call(context, ref, user) ??
              PeamanText.subtitle1(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ).pB(5),
          bioBuilder?.call(context, ref, user) ??
              PeamanText.body1(
                user.bio,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: PeamanColors.greyDark,
                ),
                textAlign: TextAlign.center,
              ),
        ],
      ),
    ).pX(20.0);
  }
}
