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

  Widget _dataBuilder(List<PeamanChatFile> chatFiles) {
    final oldChatFiles = chatFiles;
    chatFiles = _groupChatFilesBasedOnCreatedDate(chatFiles);
    return widget.listBuilder?.call(context, ref, oldChatFiles) ??
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final chatFile = chatFiles[index];
            final nextChatFile =
                (index + 1) >= chatFiles.length ? null : chatFiles[index + 1];

            return Column(
              children: [
                if (index == 0)
                  widget.dividerBuilder?.call(context, ref, chatFile) ??
                      _dividerBuilder(chatFile),
                widget.itemBuilder?.call(context, ref, chatFile) ??
                    PeamanChatFilesListItem(
                      chatFile: chatFile,
                      imageTypeItemBuilder: widget.imageTypeItemBuilder,
                      videoTypeItemBuilder: widget.videoTypeItemBuilder,
                      linkTypeItemBuilder: widget.linkTypeItemBuilder,
                      pdfTypeItemBuilder: widget.pdfTypeItemBuilder,
                      otherTypeItemBuilder: widget.otherTypeItemBuilder,
                    ),
                if (nextChatFile != null)
                  widget.dividerBuilder?.call(context, ref, chatFile) ??
                      _dividerBuilder(nextChatFile),
              ],
            );
          }, childCount: chatFiles.length),
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

  Widget _dividerBuilder(final PeamanChatFile chatFile) {
    return widget.dividerBuilder?.call(context, ref, chatFile) ??
        PeamanDateDivider(
          date: DateTime.fromMillisecondsSinceEpoch(
            chatFile.createdAt!,
          ),
          indent: 0.0,
          endIndent: 0.0,
        ).pY(10.0);
  }

  List<PeamanChatFile> _groupChatFilesBasedOnCreatedDate(
    final List<PeamanChatFile> chatFiles,
  ) {
    final mergedChatFiles = <PeamanChatFile>[];
    final chatFilesByDate = <String, List<PeamanChatFile>>{};

    for (final chatFile in chatFiles) {
      final chatFileDate = DateTime.fromMillisecondsSinceEpoch(
        chatFile.createdAt!,
      );
      final requiredDate = DateTime(
        chatFileDate.year,
        chatFileDate.month,
        chatFileDate.day,
      );
      chatFilesByDate['${requiredDate.millisecondsSinceEpoch}'] = [
        ...?chatFilesByDate['${requiredDate.millisecondsSinceEpoch}'],
        chatFile,
      ];
    }

    chatFilesByDate.forEach((key, value) {
      final mergedChatFile = value.reduce(
        (value, element) => element.copyWith(
          urls: [...value.urls, ...element.urls],
        ),
      );
      mergedChatFiles.add(mergedChatFile);
    });

    return mergedChatFiles;
  }
}
