import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                  requiredPadding: false,
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
                  _optionItemBuilder(
                    index: i,
                    option: selectedOptions[i],
                  ),
              ],
            ),
      ],
    );
  }

  Widget _optionItemBuilder({
    required final PeamanPollOption option,
    required final int index,
  }) {
    final selectedOptions = widget.options ?? pollOptions;

    return PeamanInput(
      hintText: 'Option${index + 1}',
      requiredPadding: false,
      initialValue: option.option,
      limit: 50,
      textCapitalization: TextCapitalization.sentences,
      trailing:
          selectedOptions.length > 2 || (option.option?.isNotEmpty ?? false)
              ? IconButton(
                  splashRadius: 20.r,
                  onPressed: () => _removeValueFromPollOption(
                    index: index,
                    option: option,
                  ),
                  icon: const Icon(Icons.close),
                )
              : null,
      onPressed: () => _createNewPollOptionNode(index),
      onChanged: (val) => _addValueToPollOption(
        index: index,
        value: val,
        option: option,
      ),
    ).pB(10);
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

  void _addValueToPollOption({
    required final int index,
    required final String value,
    required final PeamanPollOption option,
  }) {
    if (option.option?.isEmpty ?? true) {
      _createFeedProvider.addValueToPollOption(index, value);
    } else {
      if (!(_debounceTimer?.isActive ?? false)) {
        _debounceTimer = Timer(const Duration(milliseconds: 800), () {
          _createFeedProvider.addValueToPollOption(index, value);
        });
      } else {
        _debounceTimer?.cancel();
      }
    }
  }

  void _removeValueFromPollOption({
    required final int index,
    required final PeamanPollOption option,
  }) {
    _debounceTimer?.cancel();
    final selectedOptions = widget.options ?? pollOptions;

    if (selectedOptions.length > 2 && (option.option?.isEmpty ?? true)) {
      _createFeedProvider.removeFromPollOptions(option);
    } else if (option.option?.isNotEmpty ?? false) {
      _createFeedProvider.removeValueFromPollOption(index);
    }
  }
}
