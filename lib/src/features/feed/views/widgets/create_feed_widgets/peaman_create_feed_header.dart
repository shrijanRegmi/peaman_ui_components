import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedHeader extends ConsumerWidget {
  const PeamanCreateFeedHeader({
    super.key,
    this.avatarBuilder,
    this.nameBuilder,
    this.userNameBuilder,
    this.countryBuilder,
  });

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
  )? userNameBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? countryBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.read(providerOfLoggedInUser);
    return Row(
      children: [
        avatarBuilder?.call(context, ref, appUser) ??
            PeamanAvatarBuilder.network(appUser.photo),
        SizedBox(width: 5.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  nameBuilder?.call(context, ref, appUser) ??
                      Row(
                        children: [
                          PeamanText.body1(
                            '${appUser.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const PeamanVerifiedBadge().pL(2.0)
                        ],
                      ),
                  userNameBuilder?.call(context, ref, appUser) ??
                      PeamanText.body1(
                        ' @${appUser.userName}',
                        style: const TextStyle(
                          color: PeamanColors.grey,
                        ),
                      ),
                ],
              ),
              countryBuilder?.call(context, ref, appUser) ??
                  PeamanText.body2(
                    appUser.country,
                    style: const TextStyle(
                      color: PeamanColors.midLightGrey,
                      fontSize: 12.0,
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
