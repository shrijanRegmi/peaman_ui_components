import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  users,
}

class PeamanSearchBuilder<T> extends StatefulHookConsumerWidget {
  const PeamanSearchBuilder.users({
    super.key,
    required this.builder,
    this.searchType = PeamanSearchType.global,
    this.filterBuilder,
    this.initialBuilder,
    this.searchBarBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
  }) : type = _Type.users;

  final _Type type;
  final PeamanSearchType searchType;

  final Widget Function(BuildContext, WidgetRef, T) builder;
  final T Function(BuildContext, WidgetRef, T)? filterBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    TextEditingController,
    Function(),
  )? searchBarBuilder;
  final Widget Function(BuildContext, WidgetRef)? initialBuilder;
  final Widget Function(BuildContext, WidgetRef)? loadingBuilder;
  final Widget Function(BuildContext, WidgetRef)? emptyBuilder;
  final Widget Function(BuildContext, WidgetRef, PeamanError)? errorBuilder;

  @override
  ConsumerState<PeamanSearchBuilder<T>> createState() =>
      _PeamanSearchBuilderState<T>();
}

class _PeamanSearchBuilderState<T>
    extends ConsumerState<PeamanSearchBuilder<T>> {
  final _controller = TextEditingController();
  PeamanDebounceProviderState get _state => ref.watch(providerOfPeamanDebounce);
  PeamanDebounceProvider get _notifier =>
      ref.watch(providerOfPeamanDebounce.notifier);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _searchInputBuilder(),
        Expanded(
          child: _searchResultsBuilder(),
        ),
      ],
    );
  }

  Widget _searchInputBuilder() {
    return widget.searchBarBuilder?.call(
          context,
          ref,
          _controller,
          _notifier.startDebounce,
        ) ??
        PeamanInput(
          hintText: 'Search...',
          height: 40.0,
          controller: _controller,
          onChanged: (_) => _notifier.startDebounce(),
        ).pB(10);
  }

  Widget _searchResultsBuilder() {
    switch (widget.type) {
      case _Type.users:
        return _usersSearchResultBuilder();
      default:
    }
    return const SizedBox();
  }

  Widget _usersSearchResultBuilder() {
    return _state.maybeWhen(
          loading: () =>
              widget.loadingBuilder?.call(context, ref) ??
              const PeamanSpinner(),
          success: () {
            final usersFuture = ref.watch(
              providerOfPeamanUsersBySearchKeys(
                _controller.text.trim().toUpperCase(),
              ),
            );
            return usersFuture.when(
              data: (data) => data.when(
                (success) {
                  final users = (widget.filterBuilder?.call(
                        context,
                        ref,
                        success as T,
                      ) as List<PeamanUser>?) ??
                      success;

                  if (users.isEmpty) {
                    if (_controller.text.trim().isEmpty) {
                      return widget.initialBuilder?.call(context, ref);
                    }
                    return widget.emptyBuilder?.call(context, ref);
                  }
                  return widget.builder(context, ref, users as T);
                },
                (failure) =>
                    widget.errorBuilder?.call(context, ref, failure) ??
                    const SizedBox(),
              ),
              error: (e, _) => widget.errorBuilder
                  ?.call(context, ref, PeamanError(message: e.toString())),
              loading: () =>
                  widget.loadingBuilder?.call(context, ref) ??
                  const PeamanSpinner(),
            );
          },
          orElse: () => widget.initialBuilder?.call(context, ref),
        ) ??
        const SizedBox();
  }
}
