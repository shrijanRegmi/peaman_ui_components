// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatDeleteButton extends ConsumerWidget {
  final PeamanChat chat;
  final Function()? onPressed;
  const PeamanChatDeleteButton({
    super.key,
    required this.chat,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (chat.id.isNull) return const SizedBox();

    final usersFuture = ref.watch(
      providerOfPeamanChatUsersFuture(chat.userIdsWrapper),
    );

    final user = usersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success.first,
          (failure) => null,
        );
      },
      orElse: () => null,
    );

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
      if (onPressed.isNull) {
        await showPeamanConfirmationDialog(
          context: context,
          title: 'Are you sure you want to delete this chat?',
          description:
              'This will result in deleting the chat from your end only and losing all the messages corresponding to this chat. However, ${chat.type == PeamanChatType.group ? 'other members' : user?.name} can still see the messages.',
          onConfirm: (context, ref) {
            const successLogMessage = 'Successfully deleted chat';
            ref.read(providerOfPeamanChat.notifier).deleteChat(
                  chatId: chat.id!,
                  successLogMessage: successLogMessage,
                );
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
