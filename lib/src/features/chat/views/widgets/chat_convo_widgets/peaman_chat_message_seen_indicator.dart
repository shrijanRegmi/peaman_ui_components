import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageSeenIndicator extends ConsumerWidget {
  final String chatId;
  const PeamanChatMessageSeenIndicator({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(providerOfLoggedInUser.select((value) => value.uid));
    final chat = ref.watch(providerOfSinglePeamanChatFromChatsStream(chatId));
    final receiverIds =
        chat?.userIds.where((element) => element != uid).toList() ?? [];
    final unreadMessages =
        chat?.unreadMessages.where((element) => element.uid != uid).toList() ??
            [];

    final seenUserIds = List<String>.from(receiverIds);
    for (var element in unreadMessages) {
      if (element.unreadMessagesCount > 0) {
        seenUserIds.remove(element.uid!);
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
    if (firstSeenUser.isNull) return const SizedBox();

    final remaining = seenUserIds.length - 1;

    return PeamanText.body2(
      remaining == 0
          ? 'Seen by ${firstSeenUser!.name}'
          : 'Seen by ${firstSeenUser!.name} and $remaining ${remaining > 1 ? 'others' : 'other'}',
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        color: PeamanColors.grey,
        fontSize: 12.0,
      ),
      onPressed: () {
        showPeamanNormalBottomsheet(
          context: context,
          borderRadius: 15.0,
          widget: PeamanUsersListPopup.byUserIds(
            title: 'Seen By',
            userIds: seenUserIds,
          ),
        );
      },
    );
  }
}
