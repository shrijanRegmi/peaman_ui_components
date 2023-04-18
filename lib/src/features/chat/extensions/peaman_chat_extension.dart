import 'package:peaman_ui_components/peaman_ui_components.dart';

extension PeamanChatExt on PeamanChat {
  List<String> get activeUserIds {
    final removedUids = removedBys.map((e) => e.uid).toList();
    return userIds.where((element) => !removedUids.contains(element)).toList();
  }

  String titleExt(
    final String firstChatUserName, {
    final List<String>? activeUids,
  }) {
    var chatTitle = (title ?? '').trim();
    if (chatTitle.isEmpty) {
      final remaining = (activeUids ?? activeUserIds).length - 2;
      return remaining == 0
          ? type == PeamanChatType.group
              ? 'You and $firstChatUserName'
              : firstChatUserName
          : 'You, $firstChatUserName and $remaining ${remaining > 1 ? 'others' : 'other'}';
    }
    return chatTitle;
  }

  PeamanListWrapper<String> get activeUserIdsWrapper =>
      PeamanListWrapper<String>(values: activeUserIds);

  PeamanListWrapper<String> get userIdsWrapper =>
      PeamanListWrapper<String>(values: userIds);

  PeamanListWrapper<PeamanChatMutedUntil> get mutedUntilsWrapper =>
      PeamanListWrapper<PeamanChatMutedUntil>(values: mutedUntils);

  PeamanListWrapper<String> get hiddenUserIdsWrapper =>
      PeamanListWrapper<String>(values: hiddenToUserIds);

  PeamanListWrapper<PeamanChatAddedBy> get addedBysWrapper =>
      PeamanListWrapper<PeamanChatAddedBy>(values: addedBys);

  PeamanListWrapper<PeamanChatRemovedBy> get removedBysWrapper =>
      PeamanListWrapper<PeamanChatRemovedBy>(values: removedBys);
}
