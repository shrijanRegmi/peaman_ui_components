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
  Widget build(BuildContext context) {
    final userFuture = ref.watch(
      providerOfPeamanUserByIdFuture(widget.userId),
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
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        PeamanProfileOverview(
          user: user,
        ),
        SizedBox(
          height: 30.h,
        ),
        PeamanProfileActions(
          user: user,
        ),
      ],
    );
  }
}
