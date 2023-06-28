import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatInfoDrawerV2 extends ConsumerStatefulWidget {
  const PeamanChatInfoDrawerV2({
    super.key,
    required this.chatId,
  });

  final String chatId;

  @override
  ConsumerState<PeamanChatInfoDrawerV2> createState() =>
      _PeamanChatInfoDrawerV2State();
}

class _PeamanChatInfoDrawerV2State
    extends ConsumerState<PeamanChatInfoDrawerV2> {
  PeamanChatType get _chatType => ref.watch(
        providerOfSinglePeamanChatFromChatsStream(widget.chatId)
            .select((value) => value!.type),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    splashRadius: 20.r,
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ).pL(10).pT(10),
              PeamanChatInfoDrawerHeader(
                chatId: widget.chatId,
              ),
              if (_chatType == PeamanChatType.group)
                PeamanChatInfoDrawerGroupChatActions(
                  chatId: widget.chatId,
                ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                height: 25.h,
              ),
              PeamanChatInfoDrawerActionsPart1(
                chatId: widget.chatId,
              ),
              Divider(
                height: 25.h,
              ),
              PeamanChatInfoDrawerActionsPart2(
                chatId: widget.chatId,
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
