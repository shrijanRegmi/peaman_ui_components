import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'What do you want to share from YouTube?',
          ),
        );
  }
}
