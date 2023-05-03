import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageTypingIndicator extends ConsumerWidget {
  final String chatId;
  const PeamanChatMessageTypingIndicator({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(providerOfLoggedInUser);
    final chat = ref.watch(providerOfSinglePeamanChatFromChatsStream(chatId));
    final typingUserIds =
        chat?.typingUserIds.where((element) => element != appUser.uid) ?? [];
    if (typingUserIds.isEmpty) return const SizedBox();

    final firstTypingUserFuture = ref.watch(
      providerOfSingleUserByIdFuture(typingUserIds.first),
    );
    final firstTypingUser = firstTypingUserFuture.maybeWhen(
      data: (data) => data.when((success) => success, (failure) => null),
      orElse: () => null,
    );
    if (firstTypingUser.isNull) return const SizedBox();

    final remaining = typingUserIds.length - 1;
    return PeamanText.body2(
      remaining == 0
          ? '${firstTypingUser!.name} is typing...'
          : '${firstTypingUser!.name} and $remaining ${remaining > 1 ? 'others' : 'other'} are typing...',
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        color: PeamanColors.grey,
        fontSize: 12.0,
      ),
    );
  }
}
