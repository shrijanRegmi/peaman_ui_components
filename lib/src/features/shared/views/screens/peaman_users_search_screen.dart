import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanUsersSearchScreenArgs {
  final bool searchUsersGlobally;

  PeamanUsersSearchScreenArgs({
    this.searchUsersGlobally = false,
  });
}

class PeamanUsersSearchScreen extends PeamanWidget<PeamanUsersSearchVM> {
  final bool searchUsersGlobally;
  const PeamanUsersSearchScreen({
    super.key,
    this.searchUsersGlobally = false,
  });

  @override
  Widget build(BuildContext context, PeamanUsersSearchVM vm) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _searchBuilder(vm),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: !vm.searchActive
            ? vm.isLoading
                ? const PeamanSpinner()
                : const SizedBox()
            : _usersSearchBuilder(vm),
      ),
    );
  }

  Widget _searchBuilder(final PeamanUsersSearchVM vm) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: PeamanInput(
          hintText: 'Search...',
          height: 40.0,
          controller: vm.searchController,
          autoFocus: true,
          trailing: _cancelBuilder(vm),
          leading: Icon(
            Icons.search_rounded,
            color: PeamanColors.grey.withOpacity(0.8),
          ),
          onChanged: (_) => vm.createDebounce(),
        ),
      ),
    );
  }

  Widget _cancelBuilder(final PeamanUsersSearchVM vm) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (vm.searchController.text.trim() == '') {
          vm.popNavigate();
        } else {
          vm.searchController.clear();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: PeamanColors.cream,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 6.0,
        ),
        child: Row(
          children: const [
            PeamanText.body2(
              'Cancel',
              style: TextStyle(
                fontSize: 10.0,
                color: PeamanColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 2.0,
            ),
            Icon(
              Icons.close,
              color: PeamanColors.grey,
              size: 12.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _usersSearchBuilder(final PeamanUsersSearchVM vm) {
    final followersIds = vm.followers.map((e) => e.uid!).toList();
    final followingIds = vm.following.map((e) => e.uid!).toList();
    final chatUserIds = vm.getChatUids();
    final companionIds = vm.getNonRepeatingStringList([
      ...followersIds,
      ...followingIds,
      ...chatUserIds,
    ]);

    return PeamanUserFetcher.multiStream(
      usersStream: PUserProvider.getUsersBySearchKeywordStream(
        searchKeyword: vm.searchController.text.trim().toUpperCase(),
      ),
      multiBuilder: (users) {
        final filteredUsers = users
            .where(
              (e) => e.uid != vm.appUser.uid && searchUsersGlobally
                  ? true
                  : companionIds.contains(e.uid),
            )
            .toList();
        if (filteredUsers.isEmpty) {
          return const PeamanEmptyBuilder(
            title: "No results found!",
            subTitle:
                'No user matches your keywords. Try changing the keywords.',
          );
        }
        return PeamanUsersList.expandedByUsers(
          users: filteredUsers,
          // onPressedUser: (user) => vm.navigate(
          //   AppRoutes.friendProfileScreen,
          //   arguments: FriendProfileScreenArgs.byFriend(
          //     friend: user,
          //   ),
          // ),
        );
      },
    );
  }

  // Widget _hashtagsSearchBuilder(final PeamanUsersSearchVM vm) {
  //   final searchKeyword =
  //       vm.searchController.text.trim().toUpperCase().replaceAll('#', '');
  //   return StreamBuilder<List<PeamanHashtag>>(
  //     stream: PFeedProvider.getHashtagsBySearchKeywordStream(
  //       searchKeyword: searchKeyword,
  //     ),
  //     builder: (context, snap) {
  //       if (snap.hasData) {
  //         final hashtags = snap.data ?? [];
  //         return HashtagsList(
  //           hashtags: hashtags,
  //         );
  //       }
  //       return Container();
  //     },
  //   );
  // }

  @override
  PeamanUsersSearchVM onCreateVM(BuildContext context) =>
      PeamanUsersSearchVM(context: context);

  @override
  void onDispose(BuildContext context, PeamanUsersSearchVM vm) =>
      vm.onDispose();

  @override
  void onInit(BuildContext context, PeamanUsersSearchVM vm) {}
}
