import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/profile/providers/peaman_user_provider.dart';
import 'package:peaman_ui_components/src/features/shared/providers/peaman_debounce_provider.dart';
import 'package:peaman_ui_components/src/features/shared/providers/states/peaman_debounce_provider_state.dart';
import 'package:peaman_ui_components/src/features/shared/views/widgets/peaman_error_builder.dart';

class PeamanUsersSearchArgs {
  final bool searchUsersGlobally;
  final Function(PeamanUser)? onPressedUser;

  PeamanUsersSearchArgs({
    this.searchUsersGlobally = false,
    this.onPressedUser,
  });
}

class PeamanUsersSearchScreen extends StatefulHookConsumerWidget {
  final bool searchUsersGlobally;
  final Function(PeamanUser)? onPressedUser;

  const PeamanUsersSearchScreen({
    super.key,
    this.searchUsersGlobally = false,
    this.onPressedUser,
  });

  static const route = '/peaman_users_search_screen';

  @override
  ConsumerState<PeamanUsersSearchScreen> createState() =>
      _PeamanUsersSearchScreenState();
}

class _PeamanUsersSearchScreenState
    extends ConsumerState<PeamanUsersSearchScreen> {
  PeamanDebounceProviderState get debounceState =>
      ref.watch(providerOfPeamanDebounce);
  PeamanDebounceProvider get debounceNotifier =>
      ref.read(providerOfPeamanDebounce.notifier);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: _searchBuilder(searchController),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: debounceState.maybeWhen(
          loading: () => const PeamanSpinner(),
          success: () => _usersSearchBuilder(searchController),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }

  Widget _searchBuilder(
    final TextEditingController searchController,
  ) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: PeamanInput(
          hintText: 'Search...',
          height: 40.0,
          autoFocus: true,
          controller: searchController,
          trailing: _cancelBuilder(searchController),
          leading: Icon(
            Icons.search_rounded,
            color: PeamanColors.grey.withOpacity(0.8),
          ),
          onChanged: (_) => debounceNotifier.startDebounce(),
        ),
      ),
    );
  }

  Widget _cancelBuilder(
    final TextEditingController searchController,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (searchController.text.trim() == '') {
          context.pop();
        } else {
          searchController.clear();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: context.theme.brightness == Brightness.light
              ? PeamanColors.cream
              : PeamanColors.black,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 6.0,
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 2.0,
            ),
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

  Widget _usersSearchBuilder(
    final TextEditingController searchController,
  ) {
    final usersFuture = ref.watch(
      providerOfPeamanUsersBySearchKeys(
        searchController.text.trim().toUpperCase(),
      ),
    );
    final appUser = ref.watch(providerOfLoggedInUser);
    return usersFuture.when(
      data: (data) {
        return data.when(
          (success) {
            final filteredUsers =
                success.where((e) => e.uid != appUser.uid).toList();
            if (filteredUsers.isEmpty) {
              return const PeamanEmptyBuilder(
                title: "No results found!",
                subTitle:
                    'No user matches your keywords. Try changing the keywords.',
              );
            }
            return PeamanUsersList.expandedByUsers(
              users: filteredUsers,
              onPressedUser: (user) => widget.onPressedUser?.call(user),
            );
          },
          (failure) => PeamanErrorBuilder(
            title: 'Error Loading Users',
            subTitle: failure.message,
          ),
        );
      },
      error: (e, _) => PeamanErrorBuilder(
        title: 'Error Loading Users',
        subTitle: e.toString(),
      ),
      loading: () => const PeamanSpinner(),
    );

    // TODO(shrijanRegmi)
    //   final followersIds = vm.followers.map((e) => e.uid!).toList();
    //   final followingIds = vm.following.map((e) => e.uid!).toList();
    //   final chatUserIds = vm.getChatUids();
    //   final companionIds = vm.getNonRepeatingStringList([
    //     ...followersIds,
    //     ...followingIds,
    //     ...chatUserIds,
    //   ]);

    //   return PeamanUserFetcher.multiStream(
    //     usersStream: PUserProvider.getUsersBySearchKeywordStream(
    //       searchKeyword: vm.searchController.text.trim().toUpperCase(),
    //     ),
    //     multiBuilder: (users) {
    //       final filteredUsers = users
    //           .where(
    //             (e) => e.uid != vm.appUser.uid && widget.searchUsersGlobally
    //                 ? true
    //                 : companionIds.contains(e.uid),
    //           )
    //           .toList();
    //       if (filteredUsers.isEmpty) {
    //         return const PeamanEmptyBuilder(
    //           title: "No results found!",
    //           subTitle:
    //               'No user matches your keywords. Try changing the keywords.',
    //         );
    //       }
    //       return PeamanUsersList.expandedByUsers(
    //         users: filteredUsers,
    //         onPressedUser: (user) => vm.gotoChatConversation(user),
    //       );
    //     },
    //   );
  }
}
