import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageInputVM extends PeamanBaseVM {
  final String chatId;

  PeamanChatMessageInputVM({
    required super.context,
    required this.chatId,
  });

  TextEditingController _messageController = TextEditingController();
  List<PeamanPicture> _picturesToSend = [];
  PeamanMessage? _messageToReply;

  TextEditingController get messageController => _messageController;
  List<PeamanPicture> get picturesToSend => _picturesToSend;
  PeamanMessage? get messageToReply => _messageToReply;
  PeamanChat get chatReadOnly => _getCurrentChat(globalContext, readOnly: true);

  // init function
  void onInit({
    required final TextEditingController? messageController,
    required final List<PeamanPicture>? picturesToSend,
  }) {
    _initializeValues(
      messageController: messageController,
      picturesToSend: picturesToSend,
    );
  }

  // dispose function
  void onDispose() {
    if (chatReadOnly.typingUserIds.contains(appUserReadOnly.uid)) {
      PChatProvider.setTypingStatus(
        chatId: chatId,
        uid: appUserReadOnly.uid!,
        typingStatus: PeamanTypingStatus.idle,
      );
    }
  }

  // initialize values
  void _initializeValues({
    required final TextEditingController? messageController,
    required final List<PeamanPicture>? picturesToSend,
  }) {
    if (messageController != null) {
      _messageController = messageController;
    }
    _picturesToSend = List<PeamanPicture>.from(picturesToSend ?? []);

    notifyListeners();
  }

  // pick image
  void pickImage() async {
    final pickedImgs = await ImagePicker().pickMultiImage();
    if (pickedImgs.isNotEmpty) {
      for (final pickedImg in pickedImgs) {
        final picture = PeamanPicture(
          path: pickedImg.path,
          type: PeamanPictureType.file,
        );
        _picturesToSend.add(picture);
        notifyListeners();
      }
    }
  }

  // remove image
  void removeImage(final PeamanPicture picture) async {
    _picturesToSend.remove(picture);
    notifyListeners();
  }

  // send message to users
  void sendMessage() async {
    final text = _messageController.text.trim();
    final picturesToUpload = _picturesToSend;

    _messageController.text = '';
    _picturesToSend = [];
    notifyListeners();
    await sendImageMessage(picturesToUpload, text);
    await sendTextMessage(text);
  }

  // send image message
  Future sendImageMessage(
    final List<PeamanPicture> picturesToUpload,
    final String text,
  ) async {
    if (picturesToUpload.isEmpty) return;

    // create temporary image message while the original image is uploading
    final tempMessageDate = DateTime.now();

    final tempFiles = picturesToUpload
        .map((e) => PeamanFileUrl(url: e.path, type: PeamanFileType.image))
        .toList();
    final tempImageMessage = PeamanMessage(
      id: picturesToUpload[0].path,
      chatId: chatReadOnly.id,
      senderId: appUserReadOnly.uid,
      files: tempFiles,
      receiverIds: chatReadOnly.userIds
        ..where((element) => element != appUserReadOnly.uid),
      createdAt: tempMessageDate.millisecondsSinceEpoch,
      updatedAt: tempMessageDate.millisecondsSinceEpoch,
      type: PeamanMessageType.file,
      extraData: {
        'is_temp': true,
      },
    );

    appVmReadOnly.updateTempMessages(
      appVmReadOnly.tempMessages..insert(0, tempImageMessage),
    );
    //

    if (text.trim() != '') {
      final tempTextMessage = PeamanMessage(
        id: picturesToUpload[0].path,
        chatId: chatReadOnly.id,
        senderId: appUserReadOnly.uid,
        text: text.trim(),
        receiverIds: chatReadOnly.userIds
          ..where((element) => element != appUserReadOnly.uid),
        createdAt: tempMessageDate.millisecondsSinceEpoch,
        updatedAt: tempMessageDate.millisecondsSinceEpoch,
        type: PeamanMessageType.text,
        extraData: {
          'is_temp': true,
        },
      );

      appVmReadOnly.updateTempMessages(
        appVmReadOnly.tempMessages..insert(0, tempTextMessage),
      );
    }

    // start uploading selected images
    final uploadDate = DateTime.now();
    final uploadPath =
        'users/${appUserReadOnly.uid}/chats/$chatId/${uploadDate.millisecondsSinceEpoch}.jpg';
    final pictureUrls = await PStorageProvider.uploadFiles(
      path: uploadPath,
      files: picturesToUpload.map((e) => File(e.path)).toList(),
    );

    if (pictureUrls == null) {
      notifyListeners();
      return logError(
        message: 'Could not upload image!',
      );
    }
    //

    // start sending the upload images as a message
    final files = pictureUrls
        .map((e) => PeamanFileUrl(url: e, type: PeamanFileType.image))
        .toList();
    final message = PeamanMessage(
      chatId: chatReadOnly.id,
      senderId: appUserReadOnly.uid,
      receiverIds: chatReadOnly.userIds
        ..removeWhere((element) => element == appUserReadOnly.uid),
      files: files,
      createdAt: uploadDate.millisecondsSinceEpoch,
      updatedAt: uploadDate.millisecondsSinceEpoch,
      type: PeamanMessageType.file,
    );

    await PChatProvider.sendMessage(
      message: message,
    );
    //

    // remove the temporary messages when the images are uploaded
    final pictureToUploadIds = picturesToUpload.map((e) => e.path).toList();

    appVmReadOnly.updateTempMessages(
      appVmReadOnly.tempMessages
        ..removeWhere(
          (element) =>
              pictureToUploadIds.contains(element.id) || element.text == text,
        ),
    );
    //
  }

  // send text message
  Future sendTextMessage(final String text) async {
    if (text.trim() == '') return;

    final futures = <Future>[];

    final extraData = <String, dynamic>{};
    if (_messageToReply != null) {
      extraData['parent_id'] = _messageToReply!.id;
      extraData['parent_text'] = _messageToReply!.text;
    }

    final textMessageDate = DateTime.now();
    final textMessage = PeamanMessage(
      chatId: chatReadOnly.id,
      senderId: appUserReadOnly.uid,
      receiverIds: chatReadOnly.userIds
        ..removeWhere((element) => element == appUserReadOnly.uid),
      text: text.trim(),
      createdAt: textMessageDate.millisecondsSinceEpoch,
      updatedAt: textMessageDate.millisecondsSinceEpoch,
      type: PeamanMessageType.text,
      extraData: extraData,
    );

    if (chatReadOnly.typingUserIds.contains(appUserReadOnly.uid)) {
      final setTypingFuture = PChatProvider.setTypingStatus(
        chatId: chatId,
        uid: appUserReadOnly.uid!,
        typingStatus: PeamanTypingStatus.idle,
      );
      futures.add(setTypingFuture);
    }

    final textMessageFuture = PChatProvider.sendMessage(
      message: textMessage,
    );
    futures.add(textMessageFuture);

    updateMessageToReply(null);
    return Future.wait(futures);
  }

  // update typign status of user
  void updateTypingStatus(String val) {
    if (chatReadOnly.totalSentMessages == 0) return;

    PeamanTypingStatus? typingStatus;

    if (val != '') {
      if (!chatReadOnly.typingUserIds.contains(appUserReadOnly.uid)) {
        typingStatus = PeamanTypingStatus.typing;
      }
    } else {
      typingStatus = PeamanTypingStatus.idle;
    }

    if (typingStatus == null) return;

    PChatProvider.setTypingStatus(
      chatId: chatReadOnly.id!,
      uid: appUserReadOnly.uid!,
      typingStatus: typingStatus,
    );
  }

  // get current chat
  PeamanChat _getCurrentChat(
    final BuildContext c, {
    final bool readOnly = false,
  }) {
    if (readOnly) {
      return c.pread<List<PeamanChat>>().firstWhere(
            (element) => element.id == chatId,
            orElse: () => PeamanChat(
              id: chatId,
              userIds: [appUserReadOnly.uid!],
            ),
          );
    }
    return c.pwatch<List<PeamanChat>>().firstWhere(
          (element) => element.id == chatId,
          orElse: () => PeamanChat(
            id: chatId,
            userIds: [appUserReadOnly.uid!],
          ),
        );
  }

  // update messsageToReply
  void updateMessageToReply(
    final PeamanMessage? newVal, {
    final bool withStateChange = true,
  }) {
    if (_messageToReply != newVal) {
      _messageToReply = newVal;

      if (withStateChange) {
        notifyListeners();
      }
    }
  }

  // update picturesToSend
  void updatePicturesToSend(
    final List<PeamanPicture> newVal, {
    final bool withStateChange = true,
  }) {
    if (_picturesToSend != newVal) {
      _picturesToSend = newVal;

      if (withStateChange) {
        notifyListeners();
      }
    }
  }
}
