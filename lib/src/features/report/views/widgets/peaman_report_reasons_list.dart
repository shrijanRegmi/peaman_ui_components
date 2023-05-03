import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanReportReasonsList extends StatelessWidget {
  final Function(
    BuildContext,
    WidgetRef,
    String,
  )? onPressedReason;
  final List<String>? reportReasons;

  PeamanReportReasonsList({
    super.key,
    this.onPressedReason,
    this.reportReasons,
  });

  final _reasons = [
    "I just don't like it",
    "It's spam",
    "Nudity or sexual activity",
    "Hate speech or symbols",
    "Violence or dangerous organisations",
    "False information",
    "Bullying or harassment",
    "Scam or fraud",
    "Intellectual property violation",
    "Suicide or self injury",
    "Sale of illegal or regulated goods",
    "Eating disorders",
    "Something else",
  ];

  @override
  Widget build(BuildContext context) {
    final list = reportReasons ?? _reasons;

    return ListView.builder(
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final reason = list[index];
        return PeamanReportReasonsListItem(
          reason: reason,
          onPressed: onPressedReason,
        );
      },
    );
  }
}
