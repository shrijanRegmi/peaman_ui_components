import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  });

  static const route = '/peaman_profile_screen';

  final String userId;

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

  @override
  Widget build(BuildContext context) {
    final userFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.userId),
    );
    return Scaffold(
      appBar: PeamanProfileScreenHeader(
        userId: widget.userId,
      ),
      body: userFuture.when(
        data: (data) => data.when(
          _dataBuilder,
          (failure) => PeamanErrorBuilder(
            subTitle: failure.message,
          ),
        ),
        error: (e, _) => PeamanErrorBuilder(
          subTitle: e.toString(),
        ),
        loading: () => const PeamanSpinner(),
      ),
    );
  }

  Widget _dataBuilder(final PeamanUser user) {
    return DefaultTabController(
      length: 2,
      child: ScrollConfiguration(
        behavior: PeamanNoGlowScrollConfiguration(),
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverToBoxAdapter(
                child: _headerBuilder(user),
              )
            ];
          },
          body: PeamanProfileCategoryBody(
            user: user,
          ),
        ),
      ),
    );
  }

  Widget _headerBuilder(final PeamanUser user) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        PeamanProfileOverview(
          user: user,
        ),
        SizedBox(
          height: 20.h,
        ),
        PeamanProfileActions(
          user: user,
        ),
        SizedBox(
          height: 15.h,
        ),
        const PeamanProfileCategoryHeader()
      ],
    );
  }
}
