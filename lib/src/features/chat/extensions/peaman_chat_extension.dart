import 'package:peaman_ui_components/peaman_ui_components.dart';

extension PeamanChatExt on PeamanChat {
  PeamanListWrapper<String> get userIdsWrapper =>
      PeamanListWrapper<String>(values: userIds);
  PeamanListWrapper<PeamanChatMutedUntil> get mutedUntilsWrapper =>
      PeamanListWrapper<PeamanChatMutedUntil>(values: mutedUntils);
  PeamanListWrapper<String> get hiddenUserIdsWrapper =>
      PeamanListWrapper<String>(values: hiddenToUserIds);
}
