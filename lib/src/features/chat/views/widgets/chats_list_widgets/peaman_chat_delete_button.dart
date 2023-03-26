// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';
import 'package:peaman_ui_components/src/features/shared/extensions/widget_extension.dart';
import 'package:peaman_ui_components/src/utils/peaman_dialogs.dart';

class PeamanChatDeleteButton extends ConsumerWidget {
  final String chatId;
  final Function()? onPressed;
  const PeamanChatDeleteButton({
    super.key,
    required this.chatId,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: PeamanColors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.delete_rounded,
          color: context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
          size: 20.w,
        ),
      ),
    ).onPressed(() async {
      if (onPressed == null) {
        await showPeamanConfirmationDialog(
          context: context,
          title: 'Are you sure you want to delete this chat?',
          description: 'This action is permanent and cannot be undone',
          onConfirm: () {
            ref.read(providerOfPeamanChat.notifier).deleteChat(chatId: chatId);
          },
        );
        _closeSlidable(context);
      } else {
        onPressed?.call();
      }
    });
  }

  void _closeSlidable(final BuildContext context) {
    final slidableController = Slidable.of(context);
    slidableController?.close();
  }
}