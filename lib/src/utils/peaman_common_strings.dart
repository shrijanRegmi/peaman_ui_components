import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCommonStrings {
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const loading = 'Loading...';
  static const unknown = 'Unknown';

///////////////////////////////////////////////

  static confirmationTitleRemoveFromChat({
    required final PeamanUser user,
  }) {
    return 'Are you sure you want to remove ${user.name} from this chat?';
  }

  static confirmationDescRemoveFromChat({
    required final PeamanUser user,
  }) {
    return "${user.name} will neither be able to view new messages nor be able to send new messages to this chat until ${user.genderStringSubject} is added back to the chat.";
  }

  static successLogRemoveFromChat({
    required final PeamanUser user,
  }) {
    return '${user.name} has been removed from the chat';
  }

  static infoRemovedFromChat({
    required final String uid,
    required final List<String> userIds,
  }) {
    final zRefRemover = PeamanZRefHelper.getZRefFromText(
      uid,
      refText: 'remover',
    );
    final zRefRemoved = PeamanZRefHelper.getZRefFromList(
      userIds,
      refText: 'removed',
    );

    return '$zRefRemover $zRefRemoved';
  }
///////////////////////////////////////////////

  static confirmationTitleAddBackToChat({
    required final PeamanUser user,
  }) {
    return 'Are you sure you want to add back ${user.name} to this chat?';
  }

  static confirmationDescAddBackToChat({
    required final PeamanUser user,
  }) {
    return '${user.name} will be able to view all the old messages and send new messages to this chat.';
  }

  static successLogAddedBackToChat({
    required final PeamanUser user,
  }) {
    return '${user.name} has been added back to the chat';
  }

///////////////////////////////////////////////

  static confirmationTitleAddToChat({
    required final List<PeamanUser> users,
  }) {
    final firstUser = users.isEmpty ? null : users.first;
    final remaining = users.length - 1;
    return 'Are you sure you want to add ${users.length > 1 ? '${firstUser?.name} and $remaining ${remaining > 1 ? 'others' : 'other'}' : firstUser?.name} to this chat?';
  }

  static confirmationDescAddToChat({
    required final List<PeamanUser> users,
  }) {
    final firstUser = users.isEmpty ? null : users.first;
    final remaining = users.length - 1;
    return '${users.length > 1 ? '${firstUser?.name} and $remaining ${remaining > 1 ? 'others' : 'other'}' : firstUser?.name} will be able to view all the old messages and send new messages to this chat.';
  }

  static successLogAddedToChat({
    required final List<PeamanUser> users,
  }) {
    final firstUser = users.isEmpty ? null : users.first;
    final remaining = users.length - 1;
    return '${users.length > 1 ? '${firstUser?.name} and $remaining ${remaining > 1 ? 'others' : 'other'}' : firstUser?.name} has been added to the chat';
  }

  static infoAddedToChat({
    required final String uid,
    required final List<String> userIds,
  }) {
    final zRefAdder = PeamanZRefHelper.getZRefFromText(
      uid,
      refText: 'adder',
    );
    final zRefAdded = PeamanZRefHelper.getZRefFromList(
      userIds,
      refText: 'added',
    );

    return '$zRefAdder $zRefAdded';
  }

///////////////////////////////////////////////

  static infoLeaveChat({
    required final String uid,
  }) {
    final zRef = PeamanZRefHelper.getZRefFromText(uid);
    return zRef;
  }

///////////////////////////////////////////////

}
