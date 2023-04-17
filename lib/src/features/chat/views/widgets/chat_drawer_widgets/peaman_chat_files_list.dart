import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanChatFilesList extends ConsumerStatefulWidget {
  const PeamanChatFilesList({
    super.key,
    required this.chatId,
    this.listBuilder,
    this.itemBuilder,
    this.imageTypeItemBuilder,
    this.videoTypeItemBuilder,
    this.pdfTypeItemBuilder,
    this.linkTypeItemBuilder,
    this.otherTypeItemBuilder,
    this.dividerBuilder,
    this.loadingBuilder,
    this.emptyBuilder,
    this.errorBuilder,
  });

  final String chatId;
  final Widget Function(
    BuildContext,
    WidgetRef,
    List<PeamanChatFile>,
  )? listBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChatFile,
  )? dividerBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanChatFile,
  )? itemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFileUrl,
  )? imageTypeItemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFileUrl,
  )? videoTypeItemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFileUrl,
  )? pdfTypeItemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFileUrl,
  )? linkTypeItemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanFileUrl,
  )? otherTypeItemBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? loadingBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? emptyBuilder;
  final Widget Function(
    BuildContext,
    WidgetRef,
    PeamanError,
  )? errorBuilder;

  @override
  ConsumerState<PeamanChatFilesList> createState() =>
      _PeamanChatFilesListState();
}

class _PeamanChatFilesListState extends ConsumerState<PeamanChatFilesList> {
  @override
  Widget build(BuildContext context) {
    final chatFilesStream = ref.watch(
      providerOfPeamanChatFilesStream(widget.chatId),
    );
    return chatFilesStream.maybeWhen(
      data: (data) {
        if (data.isEmpty) return _emptyBuilder();
        return _dataBuilder(data);
      },
      loading: _loadingBuilder,
      error: (e, _) => _errorBuilder(
        PeamanError(message: e.toString()),
      ),
      orElse: () => const SliverToBoxAdapter(
        child: SizedBox(),
      ),
    );
  }

  Widget _dataBuilder(final List<PeamanChatFile> chatFiles) {
    return widget.listBuilder?.call(context, ref, chatFiles) ??
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final itemIndex = index ~/ 2;
              final chatFile = chatFiles[itemIndex];

              if (index.isEven) {
                return Column(
                  children: [
                    if (index == 0)
                      widget.dividerBuilder?.call(context, ref, chatFile) ??
                          PeamanDateDivider(
                            date: DateTime.fromMillisecondsSinceEpoch(
                              chatFile.createdAt!,
                            ),
                            withTime: true,
                          ),
                    widget.itemBuilder?.call(context, ref, chatFile) ??
                        PeamanChatFilesListItem(
                          chatFile: chatFile,
                          imageTypeItemBuilder: widget.imageTypeItemBuilder,
                          videoTypeItemBuilder: widget.videoTypeItemBuilder,
                          linkTypeItemBuilder: widget.linkTypeItemBuilder,
                          pdfTypeItemBuilder: widget.pdfTypeItemBuilder,
                          otherTypeItemBuilder: widget.otherTypeItemBuilder,
                        ),
                  ],
                );
              }

              return widget.dividerBuilder?.call(context, ref, chatFile) ??
                  PeamanDateDivider(
                    date: DateTime.fromMillisecondsSinceEpoch(
                      chatFile.createdAt!,
                    ),
                    withTime: true,
                  );
            },
            childCount: max(0, chatFiles.length * 2 - 1),
            semanticIndexCallback: (Widget widget, int localIndex) {
              if (localIndex.isEven) {
                return localIndex ~/ 2;
              }
              return null;
            },
          ),
        );
  }

  Widget _loadingBuilder() {
    return SliverToBoxAdapter(
      child: widget.loadingBuilder?.call(context, ref) ?? const PeamanSpinner(),
    );
  }

  Widget _emptyBuilder() {
    return SliverToBoxAdapter(
      child: widget.emptyBuilder?.call(context, ref) ??
          const PeamanEmptyBuilder(
            title: 'No results found',
          ),
    );
  }

  Widget _errorBuilder(final PeamanError error) {
    return SliverToBoxAdapter(
      child: widget.errorBuilder?.call(context, ref, error) ??
          PeamanText.body1(error.message),
    );
  }
}
