import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInfoDrawerHeader extends ConsumerStatefulWidget {
  const PeamanChatInfoDrawerHeader({
    super.key,
    required this.chatId,
  });

  final String chatId;

  @override
  ConsumerState<PeamanChatInfoDrawerHeader> createState() =>
      _PeamanChatInfoDrawerHeaderState();
}

class _PeamanChatInfoDrawerHeaderState
    extends ConsumerState<PeamanChatInfoDrawerHeader> {
  Provider<PeamanChat?> get _chatProvider =>
      providerOfSinglePeamanChatFromChatsStream(widget.chatId);

  PeamanListWrapper<String> get _chatUserIdsWrapper => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.activeUserIdsWrapper),
      );
  AsyncValue<PeamanEither<List<PeamanUser>, PeamanError>>
      get _chatUsersFuture =>
          ref.watch(providerOfPeamanChatUsersFuture(_chatUserIdsWrapper));
  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );
  PeamanChatType get _chatType => ref.watch(
        _chatProvider.select((value) => value!.type),
      );
  String _chatTitleExt(final String firstChatUserName) => ref.watch(
        _chatProvider.select((value) => value!.titleExt(firstChatUserName)),
      );

  @override
  Widget build(BuildContext context) {
    final appUserPhoto = ref.watch(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    final avatars = [
      ..._getHeaderAvatars(),
      if (_chatType == PeamanChatType.group) appUserPhoto,
    ];

    return Container(
      constraints: BoxConstraints(
        minHeight: 170.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !_chatUserIdsWrapper.values.contains(_uid)
              ? PeamanAvatarBuilder.asset(
                  const PeamanUser().genderStringImage,
                  package: 'peaman_ui_components',
                  size: _chatType == PeamanChatType.group ? 80.0 : 100.0,
                )
              : PeamanAvatarBuilder.multiNetwork(
                  avatars,
                  userId: _chatType == PeamanChatType.group
                      ? null
                      : _getFirstChatUser()?.uid,
                  size: _chatType == PeamanChatType.group ? 80.0 : 100.0,
                  spreadFactor: 2.5,
                ),
          SizedBox(
            height: _chatType == PeamanChatType.group ? 35.h : 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PeamanText.subtitle2(
                _getHeaderTitle(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              if (_chatType == PeamanChatType.oneToOne &&
                  (_getFirstChatUser()?.isVerified == true))
                const PeamanVerifiedBadge().pL(2.0)
            ],
          ),
          if (_getHeaderBody() != null)
            PeamanText.body2(
              _getHeaderBody(),
              style: TextStyle(
                fontSize: 12.sp,
                color: PeamanColors.greyDark,
              ),
              textAlign: TextAlign.center,
            ).pT(3),
        ],
      ).pX(20),
    );
  }

  String _getHeaderTitle() {
    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) =>
              success.isEmpty || !_chatUserIdsWrapper.values.contains(_uid)
                  ? 'Unknown Conversation'
                  : _chatTitleExt(success.first.name ?? ''),
          (failure) => PeamanCommonStrings.unknown,
        );
      },
      loading: () => PeamanCommonStrings.loading,
      orElse: () => PeamanCommonStrings.unknown,
    );
  }

  String? _getHeaderBody() {
    if (_chatType == PeamanChatType.group) return null;

    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success.isEmpty ? null : success.first.bio,
          (failure) => null,
        );
      },
      orElse: () => null,
    );
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

  List<String> _getHeaderAvatars() {
    return _chatUsersFuture.maybeWhen(
      data: (data) {
        return data.when(
          (success) => success
              .where((element) => element.photo != null)
              .map((e) => e.photo!)
              .toList(),
          (failure) => [],
        );
      },
      loading: () => [],
      orElse: () => [],
    );
  }
}
