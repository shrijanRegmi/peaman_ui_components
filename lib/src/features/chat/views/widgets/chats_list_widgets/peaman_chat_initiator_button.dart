import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInitiatorButton extends ConsumerWidget {
  const PeamanChatInitiatorButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => context.pushNamed(
        PeamanUsersSearchScreen.route,
        arguments: PeamanUsersSearchArgs(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: const Icon(Icons.add_rounded),
    );
  }
}
