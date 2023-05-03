import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanReportPopup extends ConsumerStatefulWidget {
  final PeamanFeed? feed;
  final PeamanUser? user;
  final PeamanComment? comment;
  final PeamanReportType reportType;

  const PeamanReportPopup.user({
    super.key,
    required this.user,
  })  : reportType = PeamanReportType.user,
        feed = null,
        comment = null;

  const PeamanReportPopup.feed({
    super.key,
    required this.feed,
  })  : reportType = PeamanReportType.feed,
        user = null,
        comment = null;

  const PeamanReportPopup.comment({
    super.key,
    required this.comment,
  })  : reportType = PeamanReportType.comment,
        user = null,
        feed = null;

  @override
  ConsumerState<PeamanReportPopup> createState() => _PeamanReportPopupState();
}

class _PeamanReportPopupState extends ConsumerState<PeamanReportPopup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight / 1.5,
      child: ref.watch(providerOfPeamanReport).submitReportState.when(
            initial: () => _initialBuilder(),
            loading: () => _initialBuilder(isLoading: true),
            success: (success) => _successBuilder(),
            error: (error) => _initialBuilder(),
          ),
    );
  }

  Widget _initialBuilder({
    final bool isLoading = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _headerBuilder().pX(20).pT(20).pB(15),
        SizedBox(
          height: 5.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PeamanText.subtitle1(
              'Why are you reporting this ${widget.reportType == PeamanReportType.feed ? 'post' : widget.reportType == PeamanReportType.comment ? 'comment' : 'user'}?',
            ),
            SizedBox(
              height: 5.h,
            ),
            const PeamanText.body2(
              "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait",
              style: TextStyle(
                color: PeamanColors.grey,
              ),
            ),
          ],
        ).pX(20),
        SizedBox(
          height: 5.h,
        ),
        Expanded(
          child: PeamanReportReasonsList(
            onPressedReason: (reason) {
              if (isLoading) return;

              ref
                  .read(providerOfPeamanReport.notifier)
                  .submitReport(reason: reason);
            },
          ),
        ),
      ],
    );
  }

  Widget _successBuilder() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_rounded,
            size: 70.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          const PeamanText.heading6(
            'Thanks for letting us know',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const PeamanText.body2('We use these reports to:'),
          SizedBox(
            height: 50.h,
          ),
          _bodyBuilder(
            icon: Icons.info_outline_rounded,
            text:
                'Understand problems that people are having with different types of content on the app.',
          ),
          SizedBox(
            height: 20.h,
          ),
          _bodyBuilder(
            icon: Icons.visibility_off_outlined,
            text: 'Show you less of this kind of content in the future.',
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PeamanButton.filled(
              value: 'Done',
              padding: const EdgeInsets.all(15.0),
              onPressed: context.pop,
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PeamanText.heading6(
          'Report',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        PeamanRoundIconButton(
          icon: Icon(
            Icons.close_rounded,
            size: 16.w,
          ),
          padding: EdgeInsets.all(9.w),
          onPressed: context.pop,
        )
      ],
    );
  }

  Widget _bodyBuilder({
    required final IconData icon,
    required final String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: PeamanText.body2(text),
          ),
        ],
      ),
    );
  }
}
