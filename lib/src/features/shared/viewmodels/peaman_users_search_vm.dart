import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanUsersSearchVM extends PeamanBaseVM {
  PeamanUsersSearchVM({required super.context});

  Timer? _debounce;
  bool _searchActive = false;
  final TextEditingController _searchController = TextEditingController();

  bool get searchActive => _searchActive;
  TextEditingController get searchController => _searchController;

  // dispose function
  void onDispose() {
    _debounce?.cancel();
  }

  // create debounce
  void createDebounce() {
    updateIsLoading(true, withUnfocus: false);
    _updateSearchActive(false);
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      _updateSearchActive(_searchController.text.trim() != '');
      updateIsLoading(false, withUnfocus: false);
    });
  }

  // goto chat conversation screen
  void gotoChatConversation(final PeamanUser user) {
    final chats = context.pread<List<PeamanChat>>();

    final chat = chats.firstWhere(
      (element) => element.userIds.contains(user.uid),
      orElse: () => PeamanChat(
        id: PeamanDatabaseHelper.getDatabaseId(),
        userIds: [user.uid!, appUserReadOnly.uid!],
      ),
    );

    navigateNamed(
      PeamanRoutes.chatsConvoScreen,
      arguments: PeamanChatConversationArgs(
        chatId: chat.id!,
        friend: user,
      ),
    );
  }

  // get non repeating string list
  List<String> getNonRepeatingStringList(final List<String> list) {
    final newList = <String>[];
    for (var element in list) {
      if (!newList.contains(element)) {
        newList.add(element);
      }
    }
    return newList;
  }

  // get chat user ids
  List<String> getChatUids() {
    final list = <String>[];
    for (var chat in (chats ?? <PeamanChat>[])) {
      for (var userId in chat.userIds) {
        list.add(userId);
      }
    }
    return list..removeWhere((element) => element == appUser.uid);
  }

  // update value of searchActive
  void _updateSearchActive(final bool newVal) {
    _searchActive = newVal;
    notifyListeners();
  }
}
