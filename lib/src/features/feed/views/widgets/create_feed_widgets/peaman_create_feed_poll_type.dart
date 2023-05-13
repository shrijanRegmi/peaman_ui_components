import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanCreateFeedPollType extends ConsumerStatefulWidget {
  const PeamanCreateFeedPollType({
    super.key,
    this.questionController,
    this.options,
    this.questionInputBuilder,
    this.optionsInputListBuilder,
    this.optionsInputItemBuilder,
  });

  final TextEditingController? questionController;
  final List<PeamanPollOption>? options;

  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
  )? questionInputBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanPollOption>,
  )? optionsInputListBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    Function(),
  )? optionsInputItemBuilder;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanCreateFeedPollTypeState();
}

class _PeamanCreateFeedPollTypeState
    extends ConsumerState<PeamanCreateFeedPollType> {
  PeamanCreateFeedProvider get _createFeedProvider =>
      ref.read(providerOfPeamanCreateFeed.notifier);
  TextEditingController get pollQuestionController => ref.watch(
        providerOfPeamanCreateFeed
            .select((value) => value.pollQuestionController),
      );
  List<PeamanPollOption> get pollOptions => ref.watch(
        providerOfPeamanCreateFeed.select((value) => value.pollOptions),
      );

  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPollQuestionController =
        widget.questionController ?? pollQuestionController;
    final selectedOptions = widget.options ?? pollOptions;

    print('Shrijan : ${selectedOptions.map((e) => e.option)}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.questionInputBuilder?.call(
              context,
              ref,
              selectedPollQuestionController,
            ) ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PeamanText.subtitle1(
                  'Ask your question',
                ),
                SizedBox(
                  height: 15.h,
                ),
                PeamanInput(
                  hintText: 'Not more than 100 words',
                  limit: 100,
                  controller: selectedPollQuestionController,
                  textCapitalization: TextCapitalization.sentences,
                ),
              ],
            ).pB(30.0),
        widget.optionsInputListBuilder?.call(
              context,
              ref,
              selectedOptions,
            ) ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PeamanText.subtitle1(
                  'Choose your options',
                ),
                SizedBox(
                  height: 15.h,
                ),
                for (var i = 0; i < selectedOptions.length; i++)
                  PeamanPollOptionInput(
                    option: selectedOptions[i],
                    index: i,
                    length: selectedOptions.length,
                    onPressed: (context, ref) => _createNewPollOptionNode(i),
                    onSubmit: (context, ref, controller, def) =>
                        _savePollOption(i, controller.text.trim()),
                    onPressedClear: (context, ref, controller, def) {
                      if (controller.text.trim().isNotEmpty) {
                        def();
                      } else {
                        _removeAPollOptionNode(i);
                      }
                    },
                  ),
              ],
            ),
      ],
    );
  }

  void _createNewPollOptionNode(final int index) {
    final selectedOptions = widget.options ?? pollOptions;

    if (index == (selectedOptions.length - 1) && selectedOptions.length < 10) {
      _createFeedProvider.addToPollOptions(
        PeamanPollOption(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
        ),
      );
    }
  }

  void _removeAPollOptionNode(final int index) {
    final selectedOptions = widget.options ?? pollOptions;
    _createFeedProvider.removeFromPollOptions(
      selectedOptions[index],
    );
  }

  void _savePollOption(
    final int index,
    final String value,
  ) {
    _createFeedProvider.addValueToPollOption(index, value);
  }
}
