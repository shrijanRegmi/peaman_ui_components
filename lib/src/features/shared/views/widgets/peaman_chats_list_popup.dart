import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  normal,
  byChats,
  byChatsProvider,
}

class PeamanChatsListPopup extends ConsumerStatefulWidget {
  const PeamanChatsListPopup({
    super.key,
    this.title = '',
    this.expandOnKeyboard = true,
    this.firstItemPadding = const EdgeInsets.all(0.0),
    this.lastItemPadding = const EdgeInsets.all(0.0),
    this.itemBuilder,
    this.avatarBuilder,
    this.titleBuilder,
    this.bodyBuilder,
    this.dateBuilder,
    this.counterBuilder,
    this.actionWidgetsBuilder,
    this.listBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.filterBuilder,
    this.onPressedChat,
    this.onLongPressedChat,
  })  : type = _Type.normal,
        chats = null,
        chatsProvider = null;

  const PeamanChatsListPopup.byChats({
    super.key,
    required this.chats,
    this.title = '',
    this.expandOnKeyboard = true,
    this.firstItemPadding = const EdgeInsets.all(0.0),
    this.lastItemPadding = const EdgeInsets.all(0.0),
    this.itemBuilder,
    this.avatarBuilder,
    this.titleBuilder,
    this.bodyBuilder,
    this.dateBuilder,
    this.counterBuilder,
    this.actionWidgetsBuilder,
    this.listBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.filterBuilder,
    this.onPressedChat,
    this.onLongPressedChat,
  })  : type = _Type.byChats,
        chatsProvider = null,
        assert(chats != null);

  const PeamanChatsListPopup.byChatsProvider({
    super.key,
    required this.chatsProvider,
    this.title = '',
    this.expandOnKeyboard = true,
    this.firstItemPadding = const EdgeInsets.all(0.0),
    this.lastItemPadding = const EdgeInsets.all(0.0),
    this.itemBuilder,
    this.avatarBuilder,
    this.titleBuilder,
    this.bodyBuilder,
    this.dateBuilder,
    this.counterBuilder,
    this.actionWidgetsBuilder,
    this.listBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
    this.filterBuilder,
    this.onPressedChat,
    this.onLongPressedChat,
  })  : type = _Type.byChatsProvider,
        chats = null,
        assert(chatsProvider != null);

  final _Type type;

  final List<PeamanChat>? chats;
  final AVPCS Function(BuildContext, WidgetRef)? chatsProvider;

  final String title;
  final bool expandOnKeyboard;
  final EdgeInsets firstItemPadding;
  final EdgeInsets lastItemPadding;

  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? itemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? avatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? titleBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? bodyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? dateBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? counterBuilder;
  final List<Widget> Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
  )? actionWidgetsBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanChat>,
  )? listBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? loadingBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? emptyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanError,
  )? errorBuilder;
  final List<PeamanChat> Function(
    BuildContext,
    WidgetRef,
    List<PeamanChat>,
  )? filterBuilder;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    Function(),
  )? onPressedChat;
  final Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    Function(),
  )? onLongPressedChat;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatsListPopupState();
}

class _PeamanChatsListPopupState extends ConsumerState<PeamanChatsListPopup> {
  bool _isKeyboardVisible = false;
  late KeyboardVisibilityController _keyboardVisibilityController;

  @override
  void initState() {
    super.initState();
    _keyboardVisibilityController = KeyboardVisibilityController();
    _keyboardVisibilityController.onChange.listen((event) {
      if (!_isKeyboardVisible) {
        if (mounted) {
          setState(() {
            _isKeyboardVisible = event;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _isKeyboardVisible && widget.expandOnKeyboard
          ? ScreenUtil().screenHeight
          : 450.h,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: _isKeyboardVisible && widget.expandOnKeyboard
                  ? ScreenUtil().statusBarHeight
                  : 0.0,
            ),
            _headerBuilder().pX(20).pT(20).pB(15),
            Expanded(
              child: _listBuilder(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PeamanText.heading6(
          widget.title,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        PeamanRoundIconButton(
          icon: Icon(
            Icons.close_rounded,
            size: 16.w,
          ),
          padding: EdgeInsets.all(9.w),
          onPressed: () => context.pop(),
        )
      ],
    );
  }

  Widget _listBuilder() {
    switch (widget.type) {
      case _Type.normal:
        return _normalChatBuilder();
      case _Type.byChats:
        return _byChatsBuilder();
      case _Type.byChatsProvider:
        return _byChatsProviderBuilder();
    }
  }

  Widget _normalChatBuilder() {
    return PeamanChatsList(
      firstItemPadding: widget.firstItemPadding,
      lastItemPadding: widget.lastItemPadding,
      itemBuilder: widget.itemBuilder,
      avatarBuilder: widget.avatarBuilder,
      titleBuilder: widget.titleBuilder,
      bodyBuilder: widget.bodyBuilder,
      dateBuilder: widget.dateBuilder,
      counterBuilder: widget.counterBuilder,
      actionWidgetsBuilder: widget.actionWidgetsBuilder,
      listBuilder: widget.listBuilder,
      loadingBuilder: widget.loadingBuilder,
      emptyBuilder: widget.emptyBuilder,
      errorBuilder: widget.errorBuilder,
      filterBuilder: widget.filterBuilder,
      onPressedChat: widget.onPressedChat,
      onLongPressedChat: widget.onLongPressedChat,
    );
  }

  Widget _byChatsBuilder() {
    return PeamanChatsList.byChats(
      chats: widget.chats,
      firstItemPadding: widget.firstItemPadding,
      lastItemPadding: widget.lastItemPadding,
      itemBuilder: widget.itemBuilder,
      avatarBuilder: widget.avatarBuilder,
      titleBuilder: widget.titleBuilder,
      bodyBuilder: widget.bodyBuilder,
      dateBuilder: widget.dateBuilder,
      counterBuilder: widget.counterBuilder,
      actionWidgetsBuilder: widget.actionWidgetsBuilder,
      listBuilder: widget.listBuilder,
      loadingBuilder: widget.loadingBuilder,
      emptyBuilder: widget.emptyBuilder,
      errorBuilder: widget.errorBuilder,
      filterBuilder: widget.filterBuilder,
      onPressedChat: widget.onPressedChat,
      onLongPressedChat: widget.onLongPressedChat,
    );
  }

  Widget _byChatsProviderBuilder() {
    return PeamanChatsList.byChatsProvider(
      chatsProvider: widget.chatsProvider,
      firstItemPadding: widget.firstItemPadding,
      lastItemPadding: widget.lastItemPadding,
      itemBuilder: widget.itemBuilder,
      avatarBuilder: widget.avatarBuilder,
      titleBuilder: widget.titleBuilder,
      bodyBuilder: widget.bodyBuilder,
      dateBuilder: widget.dateBuilder,
      counterBuilder: widget.counterBuilder,
      actionWidgetsBuilder: widget.actionWidgetsBuilder,
      listBuilder: widget.listBuilder,
      loadingBuilder: widget.loadingBuilder,
      emptyBuilder: widget.emptyBuilder,
      errorBuilder: widget.errorBuilder,
      filterBuilder: widget.filterBuilder,
      onPressedChat: widget.onPressedChat,
      onLongPressedChat: widget.onLongPressedChat,
    );
  }
}
