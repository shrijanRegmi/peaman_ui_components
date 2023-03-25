import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/peaman_chat_provider.dart';

class PeamanChatMessageSeenIndicator extends ConsumerWidget {
  final String chatId;
  const PeamanChatMessageSeenIndicator({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(providerOfLoggedInUser);
    final chat = ref.watch(providerOfSinglePeamanChatFromChatsStream(chatId));
    final unreadMessages = chat?.unreadMessages
            .where((element) => element.uid != appUser.uid)
            .toList() ??
        [];

    final seenUserIds = <String>[];
    for (var element in unreadMessages) {
      if (element.unreadMessagesCount == 0) {
        seenUserIds.add(element.uid!);
      }
    }
    if (seenUserIds.isEmpty) return const SizedBox();

    final firstSeenUserFuture = ref.watch(
      providerOfSingleUserByIdFuture(seenUserIds.first),
    );
    final firstSeenUser = firstSeenUserFuture.maybeWhen(
      data: (data) => data.when((success) => success, (failure) => null),
      orElse: () => null,
    );
    if (firstSeenUser == null) return const SizedBox();

    final remaining = seenUserIds.length - 1;

    return PeamanText.body2(
      remaining == 0
          ? 'Seen by ${firstSeenUser.name}'
          : 'Seen by ${firstSeenUser.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        color: PeamanColors.grey,
        fontSize: 12.0,
      ),
    );
  }
}
