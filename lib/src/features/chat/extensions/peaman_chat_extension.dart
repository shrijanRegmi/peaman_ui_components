import 'package:peaman_ui_components/peaman_ui_components.dart';

extension PeamanChatExt on PeamanChat {
  List<String> get activeUserIds {
    final removedUids = removedBys.map((e) => e.uid).toList();
    return userIds.where((element) => !removedUids.contains(element)).toList();
  }

  PeamanListWrapper<String> get activeUserIdsWrapper =>
      PeamanListWrapper<String>(values: activeUserIds);

  PeamanListWrapper<String> get userIdsWrapper =>
      PeamanListWrapper<String>(values: userIds);

  PeamanListWrapper<PeamanChatMutedUntil> get mutedUntilsWrapper =>
      PeamanListWrapper<PeamanChatMutedUntil>(values: mutedUntils);

  PeamanListWrapper<String> get hiddenUserIdsWrapper =>
      PeamanListWrapper<String>(values: hiddenToUserIds);

  PeamanListWrapper<PeamanChatRemovedBy> get removedBysWrapper =>
      PeamanListWrapper<PeamanChatRemovedBy>(values: removedBys);
}
