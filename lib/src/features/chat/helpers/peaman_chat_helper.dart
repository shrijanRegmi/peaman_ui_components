import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatHelper {
  static String getInfoMessage({
    required final String message,
    required final PeamanInfoMessageType infoType,
    required final AVPUSE Function(PeamanListWrapper<String>) usersProvider,
    final String? uid,
  }) {
    switch (infoType) {
      case PeamanInfoMessageType.addedToChat:
        final actorId = PeamanZRefHelper.getTextFromZRef(
          message,
          refText: 'adder',
        );
        final actedIds = PeamanZRefHelper.getListFromZRef(
          message,
          refText: 'added',
        );

        final listWrapper = PeamanListWrapper(
          values: [actorId, ...actedIds],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.length <= 1) return '';

              final actorIndex =
                  success.indexWhere((element) => element.uid == actorId);
              if (actorIndex == -1) return '';

              final actor = success[actorIndex];
              final firstActedUser = success
                  .where((element) => element.uid != actorId)
                  .toList()
                  .first;
              final remaining = success.length - 2;

              return '${actor.uid == uid ? 'You' : actor.name} added ${firstActedUser.uid == uid ? 'you' : firstActedUser.name}${remaining > 0 ? ' and $remaining ${remaining > 1 ? 'others' : 'other'}' : ''} to the chat';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      case PeamanInfoMessageType.removedFromChat:
        final actorId = PeamanZRefHelper.getTextFromZRef(
          message,
          refText: 'remover',
        );
        final actedIds = PeamanZRefHelper.getListFromZRef(
          message,
          refText: 'removed',
        );

        final listWrapper = PeamanListWrapper(
          values: [actorId, ...actedIds],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.length <= 1) return '';

              final actorIndex =
                  success.indexWhere((element) => element.uid == actorId);
              if (actorIndex == -1) return '';

              final actor = success[actorIndex];
              final firstActedUser = success
                  .where((element) => element.uid != actorId)
                  .toList()
                  .first;
              final remaining = success.length - 2;

              return '${actor.uid == uid ? 'You' : actor.name} removed ${firstActedUser.uid == uid ? 'you' : firstActedUser.name}${remaining > 0 ? ' and $remaining ${remaining > 1 ? 'others' : 'other'}' : ''} from the chat';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      case PeamanInfoMessageType.createdChat:
        final actorId = PeamanZRefHelper.getTextFromZRef(
          message,
          refText: 'creator',
        );
        final actedIds = PeamanZRefHelper.getListFromZRef(
          message,
          refText: 'created',
        );

        final listWrapper = PeamanListWrapper(
          values: [actorId, ...actedIds],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.length <= 1) return '';

              final actorIndex =
                  success.indexWhere((element) => element.uid == actorId);
              if (actorIndex == -1) return '';

              final actor = success[actorIndex];
              final firstActedUser = success
                  .where((element) => element.uid != actorId)
                  .toList()
                  .first;
              final remaining = success.length - 2;

              return '${actor.uid == uid ? 'You' : actor.name} created chat with ${firstActedUser.uid == uid ? 'you' : firstActedUser.name}${remaining > 0 ? ' and $remaining ${remaining > 1 ? 'others' : 'other'}' : ''}';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      case PeamanInfoMessageType.leftChat:
        final actorId = PeamanZRefHelper.getTextFromZRef(
          message,
        );

        final listWrapper = PeamanListWrapper(
          values: [actorId],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.isEmpty) return '';

              return '${success.first.uid == uid ? 'You' : success.first.name} left the chat';
            },
            (failure) => '',
          ),
          orElse: () => '',
        );
      case PeamanInfoMessageType.updatedChatTitle:
        final actorId = PeamanZRefHelper.getTextFromZRef(
          message,
        );

        final listWrapper = PeamanListWrapper(
          values: [actorId],
        );

        return usersProvider(listWrapper).maybeWhen(
          data: (data) => data.when(
            (success) {
              if (success.isEmpty) return '';

              return '${success.first.uid == uid ? 'You' : success.first.name} updated chat title';
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
