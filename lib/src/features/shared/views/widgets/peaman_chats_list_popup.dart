import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatsListPopup extends ConsumerStatefulWidget {
  const PeamanChatsListPopup({
    super.key,
    this.title = '',
    this.chats,
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
  });

  final String title;
  final List<PeamanChat>? chats;
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
    final chatsStream = ref.watch(providerOfPeamanUserChatsStream);
    final userChats = chatsStream.maybeWhen(
      data: (data) => data,
      orElse: () => <PeamanChat>[],
    );
    final chats = widget.chats ?? userChats;

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
              child: PeamanChatsList(
                chats: widget.filterBuilder.isNotNull
                    ? widget.filterBuilder?.call(context, ref, chats)
                    : chats,
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
                onPressedChat: widget.onPressedChat,
                onLongPressedChat: widget.onLongPressedChat,
              ),
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
}
