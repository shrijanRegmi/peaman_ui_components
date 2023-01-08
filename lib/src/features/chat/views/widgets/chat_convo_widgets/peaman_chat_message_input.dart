import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageInput extends PeamanWidget<PeamanChatMessageInputVM> {
  final String chatId;
  final PeamanUser friend;
  final TextEditingController? messageController;
  final PeamanMessage? messageToReply;
  final List<PeamanPicture>? picturesToSend;
  final FocusNode? focusNode;
  final Function(String, Function())? onChanged;
  final Function(Function())? onPressedSend;
  final Function(Function())? onPressedSelectImage;
  final Function(PeamanPicture, Function())? onPressedRemoveImage;
  final Function(Function())? onPressedCancelReply;

  const PeamanChatMessageInput({
    super.key,
    required this.chatId,
    required this.friend,
    this.messageController,
    this.picturesToSend,
    this.focusNode,
    this.messageToReply,
    this.onChanged,
    this.onPressedSend,
    this.onPressedSelectImage,
    this.onPressedRemoveImage,
    this.onPressedCancelReply,
  });

  @override
  Widget build(BuildContext context, PeamanChatMessageInputVM vm) {
    vm.updateMessageToReply(messageToReply, withStateChange: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _selectedImageBuilder(vm),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: vm.context.theme.inputDecorationTheme.fillColor,
            boxShadow: [
              BoxShadow(
                color: vm.context.theme.appBarTheme.shadowColor ??
                    PeamanColors.lightGrey,
                offset: const Offset(0, -2),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (messageToReply != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PeamanText.body2(
                            'Replying to ${friend.name}',
                            style: const TextStyle(
                              color: PeamanColors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          if (messageToReply != null)
                            PeamanText.body2(
                              messageToReply!.text?.replaceAll("\n", " "),
                              limit: 45,
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => onPressedCancelReply?.call(() {}),
                        behavior: HitTestBehavior.opaque,
                        child: const Icon(
                          Icons.close_rounded,
                        ),
                      )
                    ],
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _imageSelectorBuilder(vm),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: _messageInputBuilder(vm),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  _sendBuilder(vm),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageSelectorBuilder(final PeamanChatMessageInputVM vm) {
    return GestureDetector(
      onTap: () => onPressedSelectImage?.call(vm.pickImage) ?? vm.pickImage(),
      behavior: HitTestBehavior.opaque,
      child: Icon(
        Icons.image,
        color: vm.context.theme.inputDecorationTheme.prefixIconColor,
      ),
    );
  }

  Widget _messageInputBuilder(final PeamanChatMessageInputVM vm) {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      focusNode: focusNode,
      controller: vm.messageController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (val) =>
          onChanged?.call(
            val,
            () => vm.updateTypingStatus(val),
          ) ??
          vm.updateTypingStatus(val),
      decoration: const InputDecoration(
        hintText: 'Type something awesome...',
        border: InputBorder.none,
      ),
    );
  }

  Widget _sendBuilder(final PeamanChatMessageInputVM vm) {
    return GestureDetector(
      onTap: () => onPressedSend?.call(vm.sendMessage) ?? vm.sendMessage(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: vm.context.theme.inputDecorationTheme.suffixIconColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Transform.rotate(
            angle: -pi / 2,
            child: const Icon(
              Icons.send,
              color: PeamanColors.white,
              size: 15.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedImageBuilder(final PeamanChatMessageInputVM vm) {
    return SizedBox(
      height: vm.picturesToSend.isNotEmpty ? 130.0 : 0.0,
      child: ListView.builder(
        itemCount: vm.picturesToSend.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final picture = vm.picturesToSend[index];

          return Container(
            width: 80.0,
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
            decoration: BoxDecoration(
              color: PeamanColors.extraLightGrey,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              image: DecorationImage(
                image: FileImage(File(picture.path)),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () =>
                    onPressedRemoveImage?.call(
                      picture,
                      () => vm.removeImage(picture),
                    ) ??
                    vm.removeImage(picture),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: PeamanColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: PeamanColors.red,
                    size: 15.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  PeamanChatMessageInputVM onCreateVM(BuildContext context) =>
      PeamanChatMessageInputVM(
        context: context,
        chatId: chatId,
        friend: friend,
      );

  @override
  void onDispose(BuildContext context, PeamanChatMessageInputVM vm) =>
      vm.onDispose();

  @override
  void onInit(BuildContext context, PeamanChatMessageInputVM vm) => vm.onInit(
        messageController: messageController,
        picturesToSend: picturesToSend,
      );
}
