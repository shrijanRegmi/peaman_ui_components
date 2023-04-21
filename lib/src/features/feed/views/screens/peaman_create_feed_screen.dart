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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final appUser = ref.read(providerOfLoggedInUser);
      ref.read(providerOfPeamanCreateFeed.notifier).setFeedOwner(appUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PeamanAppbar(
        height: kToolbarHeight,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0.0,
        leadingWidth: 0.0,
        leading: const SizedBox(),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PeamanRoundIconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 16.w,
                  ),
                  onPressed: context.pop,
                ),
                PeamanRoundIconButton(
                  icon: Icon(
                    Icons.refresh_rounded,
                    size: 16.w,
                  ),
                  onPressed: _resetFields,
                ),
              ],
            ),
          ],
        ).pT(10.0),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              const PeamanCreateFeedHeader(),
              SizedBox(
                height: 10.h,
              ),
              const PeamanCreateFeedBody(),
            ],
          ).pad(10.0),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const PeamanCreateFeedActions(),
      ),
    );
  }

  void _resetFields() {
    showPeamanConfirmationDialog(
      context: context,
      title: 'Are you sure you want to clear your draft?',
      description: 'You may have to re-enter all the values again.',
      onConfirm: (context, ref) => ref.invalidate(providerOfPeamanCreateFeed),
    );
  }
}
