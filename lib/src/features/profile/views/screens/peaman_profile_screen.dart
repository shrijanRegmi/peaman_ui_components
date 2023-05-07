import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileScreenArgs {
  const PeamanProfileScreenArgs({
    required this.userId,
  });

  final String userId;
}

class PeamanProfileScreen extends ConsumerStatefulWidget {
  const PeamanProfileScreen({
    super.key,
    required this.userId,
    this.headerBuilder,
    this.overviewBuilder,
    this.actionsBuilder,
    this.categoryHeaderBuilder,
    this.categoryBodyBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.tabsLength = 6,
  });

  static const route = '/peaman_profile_screen';

  final String userId;

  final PreferredSizeWidget Function(
    BuildContext,
    WidgetRef,
    String,
  )? headerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? overviewBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? actionsBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? categoryHeaderBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanUser,
  )? categoryBodyBuilder;

  final Widget Function(
    BuildContext,
    WidgetRef,
  )? loadingBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanError,
  )? errorBuilder;

  final int tabsLength;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileScreenState();
}

class _PeamanProfileScreenState extends ConsumerState<PeamanProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref
          ..invalidate(providerOfSingleUserByIdFuture(widget.userId))
          ..invalidate(providerOfPeamanFeedsByOwnerId(widget.userId));
      }
    });
    super.initState();
  }

  String get _uid => ref.watch(
        providerOfLoggedInUser.select((value) => value.uid!),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _headerBuilder(),
      body: _bodyBuilder(),
    );
  }

  PreferredSizeWidget _headerBuilder() {
    if (widget.headerBuilder != null) {
      return widget.headerBuilder!.call(context, ref, widget.userId);
    }

    if (widget.userId == _uid) {
      return PeamanProfileScreenHeader(
        user: ref.watch(providerOfLoggedInUser),
      );
    }

    final userFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.userId),
    );
    return userFuture.when(
      data: (data) => data.when(
        (success) => PeamanProfileScreenHeader(
          user: success,
        ),
        (failure) => const PeamanProfileScreenHeader(
          user: PeamanUser(),
        ),
      ),
      error: (e, _) => const PeamanProfileScreenHeader(
        user: PeamanUser(),
      ),
      loading: () => const PeamanProfileScreenHeader(
        user: PeamanUser(),
      ),
    );
  }

  Widget _bodyBuilder() {
    if (widget.userId == _uid) {
      final appUser = ref.watch(providerOfLoggedInUser);
      return _dataBuilder(appUser);
    }

    final userFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.userId),
    );
    return userFuture.when(
      data: (data) => data.when(
        _dataBuilder,
        _errorBuilder,
      ),
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      loading: _loadingBuilder,
    );
  }

  Widget _dataBuilder(final PeamanUser user) {
    return DefaultTabController(
      length: widget.tabsLength,
      child: ScrollConfiguration(
        behavior: PeamanNoGlowScrollConfiguration(),
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverToBoxAdapter(
                child: _topDetailsBuilder(user),
              )
            ];
          },
          body: widget.categoryBodyBuilder?.call(context, ref, user) ??
              PeamanProfileCategoryBody(
                user: user,
              ),
        ),
      ),
    );
  }

  Widget _topDetailsBuilder(final PeamanUser user) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        widget.overviewBuilder?.call(context, ref, user) ??
            PeamanProfileOverview(
              user: user,
            ).pB(20),
        widget.categoryBodyBuilder?.call(context, ref, user) ??
            (widget.userId != _uid
                ? PeamanProfileActions(
                    user: user,
                  ).pB(15)
                : const SizedBox()),
        widget.categoryHeaderBuilder?.call(context, ref, user) ??
            PeamanProfileCategoryHeader(
              user: user,
            )
      ],
    );
  }

  Widget _loadingBuilder() {
    return widget.loadingBuilder?.call(context, ref) ?? const PeamanSpinner();
  }

  Widget _errorBuilder(final PeamanError error) {
    return widget.errorBuilder?.call(context, ref, error) ??
        PeamanErrorBuilder(
          subTitle: error.message,
        );
  }
}
