import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanProfileCategoryBody extends ConsumerStatefulWidget {
  const PeamanProfileCategoryBody({
    super.key,
    required this.user,
  });

  final PeamanUser user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanProfileCategoryBodyState();
}

class _PeamanProfileCategoryBodyState
    extends ConsumerState<PeamanProfileCategoryBody> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        PeamanProfileFeeds.all(
          user: widget.user,
        ),
        PeamanProfileFeeds.image(
          user: widget.user,
        ),
        PeamanProfileFeeds.video(
          user: widget.user,
        ),
        PeamanProfileFeeds.youtube(
          user: widget.user,
        ),
        PeamanProfileFeeds.poll(
          user: widget.user,
        ),
        PeamanProfileAbout(
          user: widget.user,
        ),
      ],
    );
  }
}
