import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatHelper {
  static String getInfoMessage({
    required final String message,
    required final PeamanInfoMessageType infoType,
    required final AVPUSE Function(PeamanListWrapper<String>) usersProvider,
  }) {
    switch (infoType) {
      case PeamanInfoMessageType.addedToChat:
        final adderId = PeamanZRefHelper.getTextFromZRef(
          message,
          refText: 'adder',
        );
        final addedIds = PeamanZRefHelper.getListFromZRef(
          message,
          refText: 'added',
        );

        final listWrapper = PeamanListWrapper(
          values: [adderId, ...addedIds],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.length <= 1) return '';

              final adderIndex =
                  success.indexWhere((element) => element.uid == adderId);
              if (adderIndex == -1) return '';

              final adder = success[adderIndex];
              final firstAddedUser = success
                  .where((element) => element.uid != adderId)
                  .toList()
                  .first;
              final remaining = success.length - 2;

              return '${adder.name} added ${firstAddedUser.name}${remaining > 0 ? ' and $remaining ${remaining > 1 ? 'others' : 'other'}' : ''} to the chat';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      case PeamanInfoMessageType.removedFromChat:
        final removerId = PeamanZRefHelper.getTextFromZRef(
          message,
          refText: 'remover',
        );
        final removedIds = PeamanZRefHelper.getListFromZRef(
          message,
          refText: 'removed',
        );

        final listWrapper = PeamanListWrapper(
          values: [removerId, ...removedIds],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.length <= 1) return '';

              final removerIndex =
                  success.indexWhere((element) => element.uid == removerId);
              if (removerIndex == -1) return '';

              final remover = success[removerIndex];
              final firstRemovedUser = success
                  .where((element) => element.uid != removerId)
                  .toList()
                  .first;
              final remaining = success.length - 2;

              return '${remover.name} removed ${firstRemovedUser.name}${remaining > 0 ? ' and $remaining ${remaining > 1 ? 'others' : 'other'}' : ''} from the chat';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      case PeamanInfoMessageType.leftChat:
        final lefterId = PeamanZRefHelper.getTextFromZRef(
          message,
        );

        final listWrapper = PeamanListWrapper(
          values: [lefterId],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.isEmpty) return '';

              return '${success.first.name} left the chat';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      default:
        return '';
    }
  }
}
