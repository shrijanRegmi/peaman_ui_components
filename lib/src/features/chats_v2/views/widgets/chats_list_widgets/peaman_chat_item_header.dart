import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanChatItemHeader extends ConsumerStatefulWidget {
  const PeamanChatItemHeader({
    super.key,
    required this.chat,
    required this.users,
    this.avatarBuilder,
    this.titleBuilder,
    this.dateBuilder,
  });

  final PeamanChat chat;
  final List<PeamanUser> users;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? avatarBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? titleBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChat,
    List<PeamanUser>,
  )? dateBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanChatItemHeaderState();
}

class _PeamanChatItemHeaderState extends ConsumerState<PeamanChatItemHeader> {
  @override
  Widget build(BuildContext context) {
    final appUserPhoto = ref.watch(
      providerOfLoggedInUser.select((value) => value.photo),
    );
    final uid = ref.watch(
      providerOfLoggedInUser.select((value) => value.uid!),
    );

    final avatars = [
      ...widget.users.map((e) => e.photo).toList(),
      if (widget.chat.type == PeamanChatType.group) appUserPhoto,
    ]..shuffle();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            widget.avatarBuilder?.call(
                  context,
                  ref,
                  widget.chat,
                  widget.users,
                ) ??
                (widget.users.isEmpty ||
                        !widget.chat.activeUserIds.contains(uid)
                    ? PeamanAvatarBuilder.asset(
                        const PeamanUser().genderStringImage,
                        package: 'peaman_ui_components',
                        size: 45.0,
                        onPressed: () {},
                      )
                    : PeamanAvatarBuilder.multiNetwork(
                        avatars,
                        size: 45.0,
                        userId: widget.chat.type == PeamanChatType.group
                            ? null
                            : widget.users.isEmpty
                                ? null
                                : widget.users.first.uid,
                        onPressed: () {
                          if (widget.chat.type == PeamanChatType.group) return;
                          if (widget.users.isEmpty) return;

                          context.pushNamed(
                            PeamanProfileScreen.route,
                            arguments: PeamanProfileScreenArgs(
                              userId: widget.users.first.uid!,
                            ),
                          );
                        },
                      )),
            SizedBox(
              width: avatars.length >= 3 ? 10.w : 5.w,
            ),
            widget.titleBuilder
                    ?.call(context, ref, widget.chat, widget.users) ??
                Row(
                  children: [
                    PeamanText.body2(
                      widget.users.isEmpty ||
                              !widget.chat.activeUserIds.contains(uid)
                          ? 'Unknown Conversation'
                          : widget.chat.titleExt(widget.users.first.name ?? ''),
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: PeamanColors.grey,
                      ),
                    ),
                    if (widget.chat.type == PeamanChatType.oneToOne &&
                        widget.users.isNotEmpty &&
                        widget.users.first.isVerified)
                      const PeamanVerifiedBadge().pL(2.0)
                  ],
                ),
          ],
        ),
        widget.dateBuilder?.call(context, ref, widget.chat, widget.users) ??
            PeamanText.body2(
              timeago.format(
                DateTime.fromMillisecondsSinceEpoch(
                  widget.chat.updatedAt!,
                ),
              ),
              style: TextStyle(
                fontSize: 10.sp,
                color: PeamanColors.grey,
              ),
            ),
      ],
    );
  }
}
