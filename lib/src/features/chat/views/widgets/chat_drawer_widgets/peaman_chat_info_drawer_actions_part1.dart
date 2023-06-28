import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInfoDrawerActionsPart1 extends ConsumerStatefulWidget {
  const PeamanChatInfoDrawerActionsPart1({
    super.key,
    required this.chatId,
  });

  final String chatId;

  @override
  ConsumerState<PeamanChatInfoDrawerActionsPart1> createState() =>
      _PeamanChatInfoDrawerActionsPart1State();
}

class _PeamanChatInfoDrawerActionsPart1State
    extends ConsumerState<PeamanChatInfoDrawerActionsPart1> {
  Provider<PeamanChat?> get _chatProvider =>
      providerOfSinglePeamanChatFromChatsStream(widget.chatId);

  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );

  String? get _chatId => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value?.id),
      );

  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.activeUserIdsWrapper),
      );
  PeamanChatType get _chatType => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.type),
      );
  PeamanListWrapper<PeamanChatAddedBy> get _chatAddedBysWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.addedBysWrapper),
      );
  AsyncValue<PeamanEither<List<PeamanUser>, PeamanError>>
      get _chatUsersFuture => ref.watch(
            providerOfPeamanChatUsersFuture(_chatUserIdsWrapper),
          );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_chatType == PeamanChatType.group)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.edit_rounded,
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Group title',
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            onTap: _setChatTitle,
          ),
        if (_chatType == PeamanChatType.group)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.groups_rounded,
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Group members',
              style: TextStyle(fontSize: 12.sp),
            ),
            onTap: _showChatMembers,
          ),
        ListTile(
          leading: PeamanRoundIconButton(
            icon: Icon(
              Icons.image_rounded,
              color: context.isDarkMode
                  ? PeamanColors.white70
                  : PeamanColors.white,
              size: 12.w,
            ),
            padding: EdgeInsets.all(7.w),
            bgColor: context.theme.colorScheme.primary,
          ),
          minLeadingWidth: 10.w,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 0.0,
          ),
          title: PeamanText.subtitle1(
            'Media, links and files',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          onTap: () => context.pushNamed(
            PeamanViewChatMediasFilesLinksScreen.route,
            arguments: PeamanViewChatMediasFilesLinksScreenArgs(
              chatId: widget.chatId,
            ),
          ),
        ),
        if (_chatType == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group_add_rounded,
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Add to group',
              style: TextStyle(fontSize: 12.sp),
            ),
            onTap: _addToAnotherChat,
          ),
        if (_chatType == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.group,
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: PeamanText.subtitle1(
              'Groups in common',
              style: TextStyle(fontSize: 12.sp),
            ),
            onTap: _showCommonChats,
          ),
        if (_chatType == PeamanChatType.oneToOne)
          ListTile(
            leading: PeamanRoundIconButton(
              icon: Icon(
                Icons.email_rounded,
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.white,
                size: 12.w,
              ),
              padding: EdgeInsets.all(7.w),
              bgColor: context.theme.colorScheme.primary,
            ),
            minLeadingWidth: 10.w,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 0.0,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PeamanText.subtitle1(
                  'External contact',
                  style: TextStyle(fontSize: 12.sp),
                ),
                PeamanText.body2(
                  _getExternalContact(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: PeamanColors.greyDark,
                  ),
                ),
              ],
            ),
            onTap: _lauchExternalContact,
          ),
      ],
    );
  }

  void _setChatTitle() {
    final chatTitle = ref.watch(
      _chatProvider.select((value) => value!.title ?? ''),
    );
    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanInputPopup(
        title: 'Group title',
        hintText: 'Type something...',
        expandOnKeyboard: true,
        initialValue: chatTitle,
        autoFocus: true,
        limit: 30,
        onPressedSubmit: (context, _, value) {
          if (value.trim().isNotEmpty) {
            ref.read(providerOfPeamanChat.notifier).setChatTitle(
                  chatId: widget.chatId,
                  title: value,
                  successLogMessage:
                      PeamanCommonStrings.successLogUpdatedChatTitle(),
                );
          }
        },
      ),
    );
  }

  void _showChatMembers() {
    final adminId = ref.read(
      _chatProvider.select((value) => value!.adminId),
    );

    showPeamanNormalBottomsheet(
      context: context,
      borderRadius: 15.0,
      widget: PeamanUsersListPopup.byUserIds(
        userIds: _chatUserIdsWrapper.values,
        title: 'Group Members',
        filterBuilder: (context, ref, users) => users
            .where(
              (element) => _chatUserIdsWrapper.values.contains(element.uid),
            )
            .toList(),
        nameBuilder: (context, ref, user) => Row(
          children: [
            PeamanText.subtitle2(
              user.uid == _uid ? 'You' : user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (user.isVerified) const PeamanVerifiedBadge().pL(2.0)
          ],
        ),
        captionBuilder: (context, ref, user) {
          final addedBy = _chatAddedBysWrapper.values.firstWhere(
            (element) => element.uid == user.uid,
            orElse: PeamanChatAddedBy.new,
          );
          var addedByName = 'Unknown';
          if (addedBy.addedBy != null) {
            final addedByFuture = ref.watch(
              providerOfSingleUserByIdFuture(addedBy.addedBy!),
            );
            addedByName = addedByFuture.maybeWhen(
              data: (data) => data.when(
                (success) => success.uid == _uid ? 'You' : success.name!,
                (failure) => 'Unknown',
              ),
              loading: () => 'Loading...',
              orElse: () => 'Unknown',
            );
          }
          return PeamanText.caption(
            user.uid == adminId ? 'Admin' : 'Added by $addedByName',
            limit: 60,
          );
        },
        onPressedUser: (context, ref, user, def) {
          if (user.uid == _uid) return;

          showPeamanChatUserInfoDialog(
            context: context,
            chatId: _chatId!,
            user: user,
          );
        },
      ),
    );
  }

  void _addToAnotherChat() {
    final firstChatUser = _getFirstChatUser();
    if (firstChatUser == null) return;

    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanChatsListPopup(
        title: 'Add to group',
        filterBuilder: (context, ref, chats) => chats
            .where((element) =>
                element.type == PeamanChatType.group &&
                element.activeUserIds.contains(_uid) &&
                !element.activeUserIds.contains(firstChatUser.uid!))
            .toList(),
        onPressedChat: (context, ref, chat, users, def) {
          showPeamanConfirmationDialog(
            context: context,
            title: PeamanCommonStrings.confirmationTitleAddToChat(
              users: [firstChatUser],
            ),
            description: PeamanCommonStrings.confirmationDescAddToChat(
              users: [firstChatUser],
            ),
            onConfirm: (context, ref) {
              final savedRef = ref;
              final successLogMessage =
                  PeamanCommonStrings.successLogAddedToChat(
                users: [firstChatUser],
              );
              savedRef.read(providerOfPeamanChat.notifier).addChatMembers(
                    chatId: chat.id!,
                    friendIds: [firstChatUser.uid!],
                    successLogMessage: successLogMessage,
                  );
            },
          );
        },
      ),
    );
  }

  void _showCommonChats() {
    final firstChatUser = _getFirstChatUser();
    if (firstChatUser == null) return;

    showPeamanNormalBottomsheet(
      context: context,
      widget: PeamanChatsListPopup(
        title: 'Groups in common',
        filterBuilder: (context, ref, chats) => chats
            .where((element) =>
                element.activeUserIds.contains(_uid) &&
                element.activeUserIds.contains(firstChatUser.uid) &&
                element.type == PeamanChatType.group)
            .toList(),
        onPressedChat: (context, ref, chat, users, def) {
          context
            ..pop()
            ..pop()
            ..pop();
          def();
        },
      ),
    );
  }

  String _getExternalContact() {
    if (_chatType == PeamanChatType.group) return '';

    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success.isEmpty ? '' : success.first.email!,
          (failure) => '',
        );
      },
      orElse: () => PeamanCommonStrings.loading,
    );
  }

  void _lauchExternalContact() async {
    var link = '';
    final regexEmail = RegExp(PeamanCommonStrings.regexEmail);
    if (regexEmail.hasMatch(_getExternalContact())) {
      link = 'mailto:${_getExternalContact()}';
    }

    await PeamanCommonHelper.openLink(link);
  }

  PeamanUser? _getFirstChatUser() {
    final chatUsers = _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success,
          (failure) => <PeamanUser>[],
        );
      },
      orElse: () => <PeamanUser>[],
    );
    return chatUsers.isEmpty ? null : chatUsers.first;
  }
}
