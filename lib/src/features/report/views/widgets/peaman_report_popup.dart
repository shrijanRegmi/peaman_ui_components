import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanReportPopup extends ConsumerStatefulWidget {
  const PeamanReportPopup.user({
    super.key,
    required this.userId,
    this.reportReasons,
  })  : reportType = PeamanReportType.user,
        feedId = null,
        commentId = null,
        chatId = null,
        messageId = null,
        assert(
          userId != null,
          'userId cannot be null',
        );

  const PeamanReportPopup.feed({
    super.key,
    required this.feedId,
    this.reportReasons,
  })  : reportType = PeamanReportType.feed,
        userId = null,
        commentId = null,
        chatId = null,
        messageId = null,
        assert(
          feedId != null,
          'feedId cannot be null',
        );

  const PeamanReportPopup.comment({
    super.key,
    required this.commentId,
    this.reportReasons,
  })  : reportType = PeamanReportType.comment,
        userId = null,
        feedId = null,
        chatId = null,
        messageId = null,
        assert(
          commentId != null,
          'commentId cannot be null',
        );

  const PeamanReportPopup.chat({
    super.key,
    required this.chatId,
    this.reportReasons,
  })  : reportType = PeamanReportType.comment,
        userId = null,
        feedId = null,
        commentId = null,
        messageId = null,
        assert(
          chatId != null,
          'chatId cannot be null',
        );

  const PeamanReportPopup.message({
    super.key,
    required this.messageId,
    this.reportReasons,
  })  : reportType = PeamanReportType.comment,
        userId = null,
        feedId = null,
        commentId = null,
        chatId = null,
        assert(
          messageId != null,
          'messageId cannot be null',
        );

  final PeamanReportType reportType;

  final String? feedId;
  final String? userId;
  final String? commentId;
  final String? chatId;
  final String? messageId;
  final List<String>? reportReasons;

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
        PeamanPopupHeader(
          title: 'Report',
          isLoading: isLoading,
        ),
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
            reportReasons: widget.reportReasons,
            onPressedReason: (context, ref, reason) {
              if (isLoading) return;

              late String id;

              switch (widget.reportType) {
                case PeamanReportType.user:
                  id = widget.userId!;
                  break;
                case PeamanReportType.chat:
                  id = widget.chatId!;
                  break;
                case PeamanReportType.message:
                  id = widget.messageId!;
                  break;
                case PeamanReportType.feed:
                  id = widget.feedId!;
                  break;
                case PeamanReportType.comment:
                  id = widget.commentId!;
                  break;
                default:
              }

              ref.read(providerOfPeamanReport.notifier).submitReport(
                    id: id,
                    reportType: widget.reportType,
                    reason: reason,
                  );
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
