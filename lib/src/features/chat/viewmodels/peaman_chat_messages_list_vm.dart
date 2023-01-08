import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessagesListVM extends PeamanBaseVM {
  final String chatId;

  PeamanChatMessagesListVM({
    required super.context,
    required this.chatId,
  });

  late final Stream<List<PeamanMessage>> _messagesStream;

  Stream<List<PeamanMessage>> get messagesStream => _messagesStream;

  // init function
  void onInit() {
    _messagesStream = PChatProvider.getMessagesStream(chatId: chatId);
  }

  // show message long press bottomsheet
  void showMessageLongPressBottomsheet(final PeamanMessage message) {
    // if (message.type != PeamanMessageType.text) return;

    // final options = [
    //   SelectableOption(
    //     leading: const Icon(Icons.copy_rounded),
    //     title: 'Copy',
    //   ),
    //   SelectableOption(
    //     leading: const Icon(Icons.reply_rounded),
    //     title: 'Reply',
    //   ),
    // ];

    // DialogProvider(context).showSelectableOptionsBottomSheet(
    //   options: options,
    //   radio: false,
    //   onSelectOption: (option) {
    //     switch (option.title) {
    //       case 'Copy':
    //         CommonHelper.copyText(
    //           message.text!,
    //         );
    //         break;
    //       case 'Reply':
    //         updateMessageToReply(message);
    //         break;
    //       default:
    //     }
    //   },
    // );
  }

  // get friend future
  Future<PeamanUser> friendFuture({required final String uid}) {
    return PUserProvider.getUserById(uid: uid);
  }
}
