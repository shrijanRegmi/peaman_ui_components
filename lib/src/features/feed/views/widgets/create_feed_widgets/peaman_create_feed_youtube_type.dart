import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedYouTubeType extends ConsumerStatefulWidget {
  const PeamanCreateFeedYouTubeType({
    super.key,
    this.controller,
    this.inputBuilder,
  });

  final TextEditingController? controller;

  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
  )? inputBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      PeamanCreateFeedYouTubeTypeState();
}

class PeamanCreateFeedYouTubeTypeState
    extends ConsumerState<PeamanCreateFeedYouTubeType> {
  @override
  Widget build(BuildContext context) {
    final captionController = ref.watch(
      providerOfPeamanCreateFeed.select((value) => value.captionController),
    );
    final selectedCaptionController = widget.controller ?? captionController;

    return widget.inputBuilder?.call(
          context,
          ref,
          selectedCaptionController,
        ) ??
        TextFormField(
          minLines: 1,
          maxLines: 100,
          controller: selectedCaptionController,
          style: TextStyle(
            fontSize: 16.sp,
          ),
          onChanged: (val) {},
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: PeamanColors.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: PeamanColors.transparent,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: PeamanColors.transparent,
              ),
            ),
            contentPadding: const EdgeInsets.all(0.0),
            hintStyle: TextStyle(
              fontSize: 16.sp,
            ),
            filled: false,
            hintText: 'What do you want to share from YouTube?',
          ),
        );
  }
}
