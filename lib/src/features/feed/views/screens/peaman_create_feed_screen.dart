import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedScreenArgs {
  final PeamanFeed? feedToEdit;

  const PeamanCreateFeedScreenArgs({
    this.feedToEdit,
  });
}

class PeamanCreateFeedScreen extends ConsumerStatefulWidget {
  const PeamanCreateFeedScreen({
    super.key,
    this.feedToEdit,
  });

  final PeamanFeed? feedToEdit;

  static const route = '/peaman_create_feed_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanCreateFeedScreenState();
}

class _PeamanCreateFeedScreenState
    extends ConsumerState<PeamanCreateFeedScreen> {
  var _isClearDraftRequired = false;
  var _isShowingPopup = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final appUser = ref.read(providerOfLoggedInUser);
      ref.read(providerOfPeamanCreateFeed.notifier)
        ..setFeedOwner(appUser)
        ..initializeValues(feed: widget.feedToEdit);

      final hasStartedCreatingFeed = ref.read(
        providerOfPeamanCreateFeed.select(
          (value) => value.hasStartedCreatingFeed,
        ),
      );
      if (hasStartedCreatingFeed) {
        setState(() {
          _isShowingPopup = true;
        });
        showPeamanLoadingDialog(
          context: context,
          loadingText: 'Creating post...',
        );
      }

      _checkIfClearDraftOptionIsRequired();
    });
  }

  void _checkIfClearDraftOptionIsRequired() {
    final captionController = ref.read(
      providerOfPeamanCreateFeed.select((value) => value.captionController),
    );
    final youTubeLinkController = ref.read(
      providerOfPeamanCreateFeed.select((value) => value.youtubeLinkController),
    );
    final selectedFiles = ref.read(
      providerOfPeamanCreateFeed.select((value) => value.files),
    );
    final feedType = ref.read(
      providerOfPeamanCreateFeed.select((value) => value.feedType),
    );
    setState(() {
      _isClearDraftRequired = captionController.text.trim().isNotEmpty ||
          youTubeLinkController.text.trim().isNotEmpty ||
          selectedFiles.isNotEmpty ||
          feedType != PeamanFeedType.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(providerOfPeamanCreateFeed, (previous, next) {
      if (previous?.hasStartedCreatingFeed != next.hasStartedCreatingFeed) {
        if (next.hasStartedCreatingFeed) {
          context.pop();
        } else if (_isShowingPopup) {
          context.pop();
        }
      }
    });

    return Scaffold(
      appBar: PeamanAppbar(
        height: kToolbarHeight,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0.0,
        leadingWidth: 0.0,
        leading: const SizedBox(),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PeamanRoundIconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 16.w,
                  ),
                  onPressed: context.pop,
                ),
                if (_isClearDraftRequired)
                  PeamanRoundIconButton(
                    icon: Icon(
                      Icons.refresh_rounded,
                      size: 16.w,
                    ),
                    onPressed: _clearDraft,
                  ),
              ],
            ),
          ],
        ).pT(10.0),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              const PeamanCreateFeedHeader(),
              SizedBox(
                height: 10.h,
              ),
              const PeamanCreateFeedBody(),
              SizedBox(
                height: 50.h,
              ),
            ],
          ).pad(10.0),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const PeamanCreateFeedActions(),
      ),
    );
  }

  void _clearDraft() {
    showPeamanConfirmationDialog(
      context: context,
      title: 'Are you sure you want to clear your draft?',
      description: 'You may have to re-enter all the values again.',
      onConfirm: (context, ref) {
        ref.invalidate(providerOfPeamanCreateFeed);
        setState(() {
          _isClearDraftRequired = false;
        });
      },
    );
  }
}
