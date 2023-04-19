import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
        titleText: 'Peaman',
        title: PeamanText.heading4(
          'Peaman',
          style: GoogleFonts.caveat(),
        ),
        elevation: 0.5,
        centerTitle: false,
        leadingWidth: 0.0,
        leading: const SizedBox(),
        actions: [
          Center(
            child: PeamanRoundIconButton(
              padding: EdgeInsets.all(7.w),
              onPressed: () => context.pushNamed(
                PeamanChatsListScreen.route,
              ),
              icon: SvgPicture.asset(
                'assets/svgs/outlined_send_message.svg',
                package: 'peaman_ui_components',
                width: 16.w,
              ),
            ).pR(10.0),
          ),
        ],
      ),
      body: const PeamanFeedsList(),
    );
  }
}
