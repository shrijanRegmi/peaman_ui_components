import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedActions extends ConsumerStatefulWidget {
  const PeamanCreateFeedActions({
    super.key,
    this.feedType,
    this.maxMediasLimit = 10,
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

  final PeamanFeedType? feedType;
  final int maxMediasLimit;

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
  ConsumerState<PeamanCreateFeedActions> createState() =>
      _PeamanCreateFeedActionsState();
}

class _PeamanCreateFeedActionsState
    extends ConsumerState<PeamanCreateFeedActions> {
  PeamanCreateFeedProvider get _createFeedProvider =>
      ref.read(providerOfPeamanCreateFeed.notifier);

  @override
  Widget build(BuildContext context) {
    final selectedFeedType = widget.feedType ??
        ref.watch(
          providerOfPeamanCreateFeed.select((value) => value.feedType),
        );
    return Container(
      color: widget.backgroundColor ??
          (context.isDarkMode
              ? PeamanColors.extraLightGrey.withOpacity(0.1)
              : PeamanColors.extraLightGrey),
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (widget.imageSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(9.w),
                        bgColor: context.theme.colorScheme.background,
                        icon: Icon(
                          Icons.image_rounded,
                          size: 16.w,
                        ),
                      ).pR(8.0))
                  .onPressed(() {
                if (widget.onPressedImageSelectorButton != null) {
                  widget.onPressedImageSelectorButton?.call(
                    context,
                    ref,
                    _onPressedImageSelectorButton,
                  );
                } else {
                  _onPressedImageSelectorButton();
                }
              }),
              (widget.videoSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(8.w),
                        bgColor: context.theme.colorScheme.background,
                        icon: Icon(
                          Icons.videocam_rounded,
                          size: 18.w,
                        ),
                      ).pR(8.0))
                  .onPressed(() {
                if (widget.onPressedVideoSelectorButton != null) {
                  widget.onPressedVideoSelectorButton?.call(
                    context,
                    ref,
                    _onPressedVideoSelectorButton,
                  );
                } else {
                  _onPressedVideoSelectorButton();
                }
              }),
              (widget.youtubeSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(8.w),
                        bgColor: _getActiveIconContainerColor(
                          selectedFeedType == PeamanFeedType.youTube,
                        ),
                        icon: SvgPicture.asset(
                          'assets/svgs/filled_youtube.svg',
                          width: 18.w,
                          color: _getActiveIconColor(
                            selectedFeedType == PeamanFeedType.youTube,
                          ),
                          package: 'peaman_ui_components',
                        ),
                      ).pR(8.0))
                  .onPressed(() {
                if (widget.onPressedYoutubeSelectorButton != null) {
                  widget.onPressedYoutubeSelectorButton?.call(
                    context,
                    ref,
                    _onPressedYoutubeSelectorButton,
                  );
                } else {
                  _onPressedYoutubeSelectorButton();
                }
              }),
              (widget.pollSelectorButtonBuilder?.call(context, ref) ??
                      PeamanRoundIconButton(
                        padding: EdgeInsets.all(8.w),
                        bgColor: _getActiveIconContainerColor(
                          selectedFeedType == PeamanFeedType.poll,
                        ),
                        icon: Icon(
                          Icons.poll_rounded,
                          size: 18.w,
                          color: _getActiveIconColor(
                            selectedFeedType == PeamanFeedType.poll,
                          ),
                        ),
                      ))
                  .onPressed(() {
                if (widget.onPressedPollSelectorButton != null) {
                  widget.onPressedPollSelectorButton?.call(
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
          (widget.submitButtonBuilder?.call(context, ref) ??
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
            if (widget.onPressedSubmitButton != null) {
              widget.onPressedSubmitButton?.call(
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

  void _onPressedImageSelectorButton() {
    final selectedFiles = ref.read(
      providerOfPeamanCreateFeed.select((value) => value.files),
    );

    if (selectedFiles.length >= widget.maxMediasLimit) {
      ref.read(providerOfPeamanInfo.notifier).logError(
            'Maximum of ${widget.maxMediasLimit} medias are only allowed',
          );
      return;
    }

    _createFeedProvider.onPressedImageSelector();
  }

  void _onPressedVideoSelectorButton() {
    final selectedFiles = ref.read(
      providerOfPeamanCreateFeed.select((value) => value.files),
    );

    if (selectedFiles.length >= widget.maxMediasLimit) {
      ref.read(providerOfPeamanInfo.notifier).logError(
            'Maximum of ${widget.maxMediasLimit} medias are only allowed',
          );
      return;
    }

    _createFeedProvider.onPressedVideoSelector();
  }

  void _onPressedYoutubeSelectorButton() {
    _createFeedProvider.onPressedYouTubeSelector();
  }

  void _onPressedPollSelectorButton() {
    _createFeedProvider.onPressedPollsSelector();
  }

  void _onPressedSubmitButton() {
    _createFeedProvider.createFeed();
  }

  Color _getActiveIconColor(final bool isActive) {
    if (context.isDarkMode) {
      if (isActive) {
        return PeamanColors.containerBgDark;
      }
      return PeamanColors.containerBg;
    } else {
      if (isActive) {
        return PeamanColors.containerBg;
      }
      return PeamanColors.containerBgDark;
    }
  }

  Color _getActiveIconContainerColor(final bool isActive) {
    if (context.isDarkMode) {
      if (isActive) {
        return PeamanColors.containerBg;
      }
      return PeamanColors.containerBgDark;
    } else {
      if (isActive) {
        return PeamanColors.containerBgDark;
      }
      return PeamanColors.containerBg;
    }
  }
}
