import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanReportSuccessBottomsheet extends StatelessWidget {
  const PeamanReportSuccessBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        const Icon(
          Icons.check_rounded,
          size: 70.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        const PeamanText.heading5(
          'Thanks for letting us know',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const PeamanText.body2('We use these reports to:'),
        const SizedBox(
          height: 50.0,
        ),
        _bodyBuilder(
          icon: Icons.info_outline_rounded,
          text:
              'Understand problems that people are having with different types of content on the app.',
        ),
        const SizedBox(
          height: 20.0,
        ),
        _bodyBuilder(
          icon: Icons.visibility_off_outlined,
          text: 'Show you less of this kind of content in the future.',
        ),
        const SizedBox(
          height: 80.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: PeamanButton.filled(
            value: 'Done',
            padding: const EdgeInsets.all(15.0),
            borderRadius: 15.0,
            onPressed: context.pop,
          ),
        ),
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
