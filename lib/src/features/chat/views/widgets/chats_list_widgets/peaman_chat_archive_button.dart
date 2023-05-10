// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatArchiveButton extends ConsumerWidget {
  final PeamanChat chat;
  final Function()? onPressed;
  const PeamanChatArchiveButton({
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
          (success) => success.isNotEmpty ? success.first : null,
          (failure) => null,
        );
      },
      orElse: () => null,
    );

    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: PeamanColors.secondaryDark,
      ),
      child: Center(
        child: Icon(
          Icons.archive_rounded,
          color: context.isDarkMode ? PeamanColors.white70 : PeamanColors.white,
          size: 20.w,
        ),
      ),
    ).onPressed(() async {
      if (onPressed.isNull) {
        await showPeamanConfirmationDialog(
          context: context,
          title: 'Are you sure you want to archive this chat?',
          description:
              'This chat will not be shown in your chats list until you or ${chat.type == PeamanChatType.group ? 'other members send' : '${user?.name} sends'} a new message to this chat.',
          onConfirm: (context, ref) {
            const successLogMessage = 'Successfully archived chat';
            ref.read(providerOfPeamanChat.notifier).archiveChat(
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
