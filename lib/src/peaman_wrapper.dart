import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class GlobalContextService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class PeamanWrapper extends StatelessWidget {
  final Widget Function(BuildContext, GlobalKey<NavigatorState>) builder;
  final List<SingleChildWidget> globalProviders;
  final List<SingleChildWidget> providers;
  final PeamanLazyLoadConfig? lazyLoadConfig;

  const PeamanWrapper({
    Key? key,
    required this.builder,
    this.globalProviders = const [],
    this.providers = const [],
    this.lazyLoadConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PStateProvider.multi(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PeamanAppVM(context),
        ),
        ...globalProviders,
      ],
      child: _providersBuilder(),
    );
  }

  Widget _providersBuilder() {
    return PStateProvider.stream<PeamanUser?>(
      create: (context) => PAuthProvider.user,
      initialData: null,
      builder: (context, child) {
        final appUser = context.pwatch<PeamanUser?>();

        final uid = appUser?.uid;

        final thisProviders = [
          if (uid != null) ..._getFirebaseProviders(uid: uid),
          ...providers,
        ];
        if (thisProviders.isNotEmpty) {
          return PStateProvider.multi(
            providers: thisProviders,
            builder: (context, child) {
              return builder(context, GlobalContextService.navigatorKey);
            },
          );
        }
        return builder(context, GlobalContextService.navigatorKey);
      },
    );
  }

  List<SingleChildWidget> _getFirebaseProviders({
    required final String uid,
  }) {
    final thisLazyLoadConfig = lazyLoadConfig ?? PeamanLazyLoadConfig();

    return <SingleChildWidget>[
      PStateProvider.stream<PeamanUser>(
        create: (context) => PUserProvider.getUserByIdStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUser,
        initialData: PeamanUser(),
      ),
      PStateProvider.stream<List<PeamanChat>?>(
        create: (context) => PChatProvider.getUserChatsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserChats,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFollower>?>(
        create: (_) => PUserProvider.getUserFollowersStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserFollowers,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFollowing>?>(
        create: (_) => PUserProvider.getUserFollowingsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserFollowings,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanReceivedFollowRequest>?>(
        create: (_) => PUserProvider.getUserReceivedFollowRequestsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserReceivedFollowRequests,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanSentFollowRequest>?>(
        create: (_) => PUserProvider.getUserSentFollowRequestsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserSentFollowRequests,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanBlockedUser>?>(
        create: (_) => PUserProvider.getUserBlockedUsersStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserBlockedUsers,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanBlockedByUser>?>(
        create: (_) => PUserProvider.getUserBlockedByUsersStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserBlockedByUsers,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanNotification>?>(
        create: (_) => PNotificationProvider.getUserNotificationsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserNotifications,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFeed>?>(
        create: (_) => PFeedProvider.getFeedsStream(),
        lazy: thisLazyLoadConfig.lazyLoadFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanMyFeed>?>(
        create: (_) => PFeedProvider.getUserMyFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserMyFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanReactedFeed>?>(
        create: (_) => PFeedProvider.getUserReactedFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserReactedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanCommentedFeed>?>(
        create: (_) => PFeedProvider.getUserCommentedFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserCommentedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanRepliedFeed>?>(
        create: (_) => PFeedProvider.getUserRepliedFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserRepliedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanSavedFeed>?>(
        create: (_) => PFeedProvider.getUserSavedFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserSavedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanViewedFeed>?>(
        create: (_) => PFeedProvider.getUserViewedFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserViewedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanFollowedFeed>?>(
        create: (_) => PFeedProvider.getUserFollowedFeedsStream(
          uid: uid,
        ),
        lazy: thisLazyLoadConfig.lazyLoadUserFollowedFeeds,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanMoment>?>(
        create: (_) => PFeedProvider.getMomentsStream(),
        lazy: thisLazyLoadConfig.lazyLoadMoments,
        initialData: null,
      ),
      PStateProvider.stream<List<PeamanHashtag>?>(
        create: (_) => PFeedProvider.getHashtagsStream(),
        lazy: thisLazyLoadConfig.lazyLoadHashtags,
        initialData: null,
      ),
    ];
  }
}
