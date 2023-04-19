import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanTimelineFeedsScreen extends ConsumerStatefulWidget {
  const PeamanTimelineFeedsScreen({super.key});

  static const route = '/peaman_timeline_feeds_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanTimelineFeedsScreenState();
}

class _PeamanTimelineFeedsScreenState
    extends ConsumerState<PeamanTimelineFeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PeamanAppbar(
        title: 'Timeline',
        leading: const SizedBox(),
        actions: [
          Center(
            child: PeamanRoundIconButton(
              padding: EdgeInsets.all(7.w),
              onPressed: () => context.pushNamed(
                PeamanTimelineFeedsScreen.route,
              ),
              icon: Icon(
                Icons.chat_rounded,
                size: 16.w,
              ),
            ).pT(4.0).pR(5.0),
          ),
        ],
      ),
      body: const PeamanFeedsList(),
    );
  }
}
