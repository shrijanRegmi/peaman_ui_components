import 'package:flutter/services.dart';
import 'package:peaman/peaman.dart' as core_helper;
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PeamanCommonHelper extends core_helper.PeamanCommonHelper {
  static Future<PeamanEither<bool, PeamanError>> openLink(String link) {
    return runAsyncCall(
      future: () async {
        if (!link.contains('https')) {
          link = 'https://$link';
        }
        if (await canLaunchUrlString(link)) {
          await launchUrlString(link);
        }
        return const Success(true);
      },
      onError: Failure.new,
    );
  }

  static Future<void> copyToClipboard(final String text) {
    return Clipboard.setData(ClipboardData(text: text));
  }
}
