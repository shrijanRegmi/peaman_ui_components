import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanPollOptionInput extends ConsumerStatefulWidget {
  const PeamanPollOptionInput({
    super.key,
    required this.option,
    required this.index,
    required this.length,
    this.activeButtonBuilder,
    this.clearButtonBuilder,
    this.onPressed,
    this.onPressedClear,
    this.onSubmit,
  });

  final PeamanPollOption option;
  final int index;
  final int length;

  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
  )? activeButtonBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
  )? clearButtonBuilder;

  final Function(
    BuildContext,
    WidgetRef,
  )? onPressed;
  final Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
    Function(),
  )? onSubmit;
  final Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
    Function(),
  )? onPressedClear;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanPollOptionInputState();
}

class _PeamanPollOptionInputState extends ConsumerState<PeamanPollOptionInput> {
  final _controller = TextEditingController();
  List<PeamanPollOption> get pollOptions => ref.watch(
        providerOfPeamanCreateFeed.select((value) => value.pollOptions),
      );

  @override
  void initState() {
    if (widget.option.option != null) {
      _controller.text = widget.option.option!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      providerOfPeamanDebounce(widget.index.toString()),
      (previous, next) {
        if (previous != next) {
          next.maybeWhen(
            success: () => widget.onSubmit?.call(
              context,
              ref,
              _controller,
              () {},
            ),
            orElse: () {},
          );
        }
      },
    );

    final notifier = ref.read(providerOfPeamanDebounce(
      widget.index.toString(),
    ).notifier);

    return PeamanInput(
      hintText: 'Option${widget.index + 1}',
      controller: _controller,
      limit: 50,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (val) => notifier.startDebounce(),
      leading: _activeButtonBuilder(),
      trailing: (_controller.text.trim().isNotEmpty || widget.length > 2)
          ? _clearButtonBuilder()
          : null,
      onPressed: () => widget.onPressed?.call(context, ref),
    ).pB(10);
  }

  Widget? _activeButtonBuilder() {
    final state = ref.watch(providerOfPeamanDebounce(
      widget.index.toString(),
    ));

    if (_controller.text.trim().isEmpty) return null;

    final color = state.maybeWhen(
      success: () => null,
      orElse: () => PeamanColors.grey,
    );

    return widget.activeButtonBuilder?.call(
          context,
          ref,
          _controller,
        ) ??
        SizedBox(
          width: 30.w,
          child: IconButton(
            splashRadius: 20.r,
            onPressed: () {},
            color: color,
            icon: const Icon(Icons.check_rounded),
          ),
        );
  }

  Widget _clearButtonBuilder() {
    return widget.clearButtonBuilder?.call(
          context,
          ref,
          _controller,
        ) ??
        SizedBox(
          width: 30.w,
          child: IconButton(
            splashRadius: 20.r,
            onPressed: () {
              if (widget.onPressedClear != null) {
                widget.onPressedClear?.call(
                  context,
                  ref,
                  _controller,
                  () {
                    setState(() {
                      _controller.clear();
                    });
                  },
                );
              } else {
                setState(() {
                  _controller.clear();
                });
              }
            },
            icon: const Icon(Icons.close),
          ),
        );
  }
}
