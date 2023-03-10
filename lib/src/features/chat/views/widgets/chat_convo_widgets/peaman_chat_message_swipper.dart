import 'dart:math';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatMessageSwiper extends StatefulWidget {
  final PeamanMessage message;
  final Widget child;
  final bool enabled;
  final Function(PeamanMessage)? onSwipped;

  const PeamanChatMessageSwiper({
    Key? key,
    required this.message,
    required this.child,
    this.enabled = true,
    this.onSwipped,
  }) : super(key: key);

  @override
  State<PeamanChatMessageSwiper> createState() =>
      _PeamanChatMessageSwiperState();
}

class _PeamanChatMessageSwiperState extends State<PeamanChatMessageSwiper> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    final appUser = context.pwatch<PeamanUser>();

    if (!widget.enabled) return widget.child;

    return Dismissible(
      key: Key(widget.message.id!),
      onUpdate: (details) {
        if (details.progress == 0.0) {
          setState(() {
            _count++;
          });
        }

        if (_count >= 2) {
          setState(() {
            _count = 0;
          });

          widget.onSwipped?.call(widget.message);
        }
      },
      confirmDismiss: (direction) async {
        return false;
      },
      direction: widget.message.senderId == appUser.uid
          ? DismissDirection.endToStart
          : DismissDirection.startToEnd,
      background: Row(
        mainAxisAlignment: widget.message.senderId == appUser.uid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 30.0,
          ),
          Transform(
            transform: Matrix4.rotationY(
              widget.message.senderId == appUser.uid ? 0 : pi,
            ),
            child: const Icon(
              Icons.reply_rounded,
              color: PeamanColors.lightGrey,
            ),
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
