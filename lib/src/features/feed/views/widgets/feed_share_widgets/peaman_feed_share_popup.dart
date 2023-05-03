import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedSharePopup extends ConsumerStatefulWidget {
  const PeamanFeedSharePopup({
    super.key,
    required this.feed,
  });

  final PeamanFeed feed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedSharePopupState();
}

class _PeamanFeedSharePopupState extends ConsumerState<PeamanFeedSharePopup> {
  final _selectedUsers = <PeamanUser>[];

  @override
  Widget build(BuildContext context) {
    final suggestedUsers = ref.watch(providerOfPeamanSuggestedUsersFuture);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PeamanPopupHeader(
          title: 'Share',
        ),
        SizedBox(
          height: 100.h,
          child: suggestedUsers.when(
            data: (data) {
              return data.when(
                _dataBuilder,
                (failure) => PeamanErrorBuilder(
                  subTitle: failure.message,
                ),
              );
            },
            error: (e, _) => PeamanErrorBuilder(
              subTitle: e.toString(),
            ),
            loading: () => const PeamanSpinner(),
          ),
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }

  Widget _dataBuilder(final List<PeamanUser> users) {
    return PeamanUsersList.roundedByUsers(
      users: users,
      scrollDirection: Axis.horizontal,
      nameBuilder: (context, ref, user) => PeamanText.body2(
        user.name?.split(' ').first,
      ),
      onPressedUser: (context, ref, user) => _shareFeed(user),
      avatarBuilder: (context, ref, user) => PeamanAvatarBuilder.network(
        user.photo,
        size: 50,
        isSelected: _selectedUsers.map((e) => e.uid).contains(user.uid),
        overlayWidget: Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PeamanColors.secondary.withOpacity(0.5),
            ),
            child: Center(
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 20.w,
              ),
            ),
          ).pad(2.0),
        ),
      ),
      firstItemPadding: EdgeInsets.only(
        left: 20.h,
        right: 10.w,
        top: 10.h,
        bottom: 10.h,
      ),
    );
  }

  void _shareFeed(final PeamanUser user) {
    if (!_selectedUsers.map((e) => e.uid).contains(user.uid)) {
      setState(() {
        _selectedUsers.add(user);
      });
      ref.read(providerOfPeamanChat.notifier).sendFeedShareMessageByUserId(
            userId: user.uid!,
            feedId: widget.feed.id!,
          );
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (mounted) {
          setState(() {
            _selectedUsers.removeWhere((element) => element.uid == user.uid);
          });
        }
      });
    }
  }
}
