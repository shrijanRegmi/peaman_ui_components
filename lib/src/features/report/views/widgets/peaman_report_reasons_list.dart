import 'package:flutter/material.dart';

import 'peaman_report_reasons_list_item.dart';

class PeamanReportReasonsList extends StatelessWidget {
  final Function(String)? onPressedReason;

  PeamanReportReasonsList({
    super.key,
    this.onPressedReason,
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
    return ListView.builder(
      itemCount: _reasons.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final reason = _reasons[index];
        return PeamanReportReasonsListItem(
          reason: reason,
          onPressed: () => onPressedReason?.call(reason),
        );
      },
    );
  }
}
