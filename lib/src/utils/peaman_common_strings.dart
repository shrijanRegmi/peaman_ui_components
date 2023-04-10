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
    required final PeamanUser user,
  }) {
    return 'Are you sure you want to add ${user.name} to this chat?';
  }

  static confirmationDescAddToChat({
    required final PeamanUser user,
  }) {
    return '${user.name} will be able to view all the old messages and send new messages to this chat.';
  }

  static successLogAddedToChat({
    required final PeamanUser user,
  }) {
    return '${user.name} has been added to the chat';
  }

///////////////////////////////////////////////

}
