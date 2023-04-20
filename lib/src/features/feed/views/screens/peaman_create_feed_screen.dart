import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedScreen extends ConsumerStatefulWidget {
  const PeamanCreateFeedScreen({super.key});

  static const route = '/peaman_create_feed_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanCreateFeedScreenState();
}

class _PeamanCreateFeedScreenState
    extends ConsumerState<PeamanCreateFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PeamanAppbar(
        height: kToolbarHeight,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0.0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PeamanRoundIconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 16.w,
              ),
            ),
          ],
        ).onPressed(context.pop),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const PeamanCreateFeedHeader(),
            SizedBox(
              height: 5.h,
            ),
            const PeamanCreateFeedBody(),
          ],
        ).pad(10.0),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const PeamanCreateFeedActions(),
      ),
    );
  }
}
