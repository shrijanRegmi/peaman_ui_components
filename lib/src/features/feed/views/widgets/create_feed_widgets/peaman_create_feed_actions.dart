import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedActions extends ConsumerWidget {
  const PeamanCreateFeedActions({
    super.key,
    this.imageSelectorButtonBuilder,
    this.videoSelectorButtonBuilder,
    this.youtubeSelectorButtonBuilder,
    this.pollSelectorButtonBuilder,
    this.submitButtonBuilder,
    this.onPressedImageSelectorButton,
    this.onPressedVideoSelectorButton,
    this.onPressedYoutubeSelectorButton,
    this.onPressedPollSelectorButton,
    this.onPressedSubmitButton,
    this.backgroundColor,
  });

  final Widget Function(
    BuildContext,
    WidgetRef,
  )? imageSelectorButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? videoSelectorButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? youtubeSelectorButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? pollSelectorButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? submitButtonBuilder;

  final Function(
    BuildContext,
    WidgetRef,
    Function(),
  )? onPressedImageSelectorButton;
  final Function(
    BuildContext,
    WidgetRef,
    Function(),
  )? onPressedVideoSelectorButton;
  final Function(
    BuildContext,
    WidgetRef,
    Function(),
  )? onPressedYoutubeSelectorButton;
  final Function(
    BuildContext,
    WidgetRef,
    Function(),
  )? onPressedPollSelectorButton;
  final Function(
    BuildContext,
    WidgetRef,
    Function(),
  )? onPressedSubmitButton;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: backgroundColor ??
          (context.isDarkMode
              ? PeamanColors.extraLightGrey.withOpacity(0.1)
              : PeamanColors.extraLightGrey),
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (imageSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(9.w),
                        bgColor: context.theme.colorScheme.background,
                        icon: Icon(
                          Icons.image_rounded,
                          size: 16.w,
                        ),
                      ).pR(8.0))
                  .onPressed(() {
                if (onPressedImageSelectorButton != null) {
                  onPressedImageSelectorButton?.call(
                    context,
                    ref,
                    _onPressedImageSelectorButton,
                  );
                } else {
                  _onPressedImageSelectorButton();
                }
              }),
              (videoSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(8.w),
                        bgColor: context.theme.colorScheme.background,
                        icon: Icon(
                          Icons.videocam_rounded,
                          size: 18.w,
                        ),
                        onPressed: () {},
                      ).pR(8.0))
                  .onPressed(() {
                if (onPressedVideoSelectorButton != null) {
                  onPressedVideoSelectorButton?.call(
                    context,
                    ref,
                    _onPressedVideoSelectorButton,
                  );
                } else {
                  _onPressedVideoSelectorButton();
                }
              }),
              (youtubeSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(8.w),
                        bgColor: context.theme.colorScheme.background,
                        icon: SvgPicture.asset(
                          'assets/svgs/filled_youtube.svg',
                          width: 18.w,
                          color: context.theme.iconTheme.color,
                          package: 'peaman_ui_components',
                        ),
                        onPressed: () {},
                      ).pR(8.0))
                  .onPressed(() {
                if (onPressedYoutubeSelectorButton != null) {
                  onPressedYoutubeSelectorButton?.call(
                    context,
                    ref,
                    _onPressedYoutubeSelectorButton,
                  );
                } else {
                  _onPressedYoutubeSelectorButton();
                }
              }),
              (pollSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(8.w),
                        bgColor: context.theme.colorScheme.background,
                        icon: Icon(
                          Icons.poll_rounded,
                          size: 18.w,
                        ),
                        onPressed: () {},
                      ))
                  .onPressed(() {
                if (onPressedPollSelectorButton != null) {
                  onPressedPollSelectorButton?.call(
                    context,
                    ref,
                    _onPressedPollSelectorButton,
                  );
                } else {
                  _onPressedPollSelectorButton();
                }
              }),
            ],
          ),
          (submitButtonBuilder?.call(context, ref) ??
                  PeamanRoundIconButton(
                    bgColor: context.theme.colorScheme.primary,
                    padding: EdgeInsets.all(9.w),
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 15,
                      color: PeamanColors.white,
                    ),
                  ))
              .onPressed(() {
            if (onPressedSubmitButton != null) {
              onPressedSubmitButton?.call(
                context,
                ref,
                _onPressedSubmitButton,
              );
            } else {
              _onPressedSubmitButton();
            }
          })
        ],
      ),
    );
  }

  void _onPressedImageSelectorButton() {}

  void _onPressedVideoSelectorButton() {}

  void _onPressedYoutubeSelectorButton() {}

  void _onPressedPollSelectorButton() {}

  void _onPressedSubmitButton() {}
}
