import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PeamanChatFilesListItem extends ConsumerStatefulWidget {
  const PeamanChatFilesListItem({
    super.key,
    required this.chatFile,
    this.imageTypeItemBuilder,
    this.videoTypeItemBuilder,
    this.pdfTypeItemBuilder,
    this.linkTypeItemBuilder,
    this.otherTypeItemBuilder,
  });

  final PeamanChatFile chatFile;
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

  @override
  ConsumerState<PeamanChatFilesListItem> createState() =>
      _PeamanChatFilesListItemState();
}

class _PeamanChatFilesListItemState
    extends ConsumerState<PeamanChatFilesListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imageTypeBuilder(),
        _linkTypeBuilder(),
      ],
    );
  }

  Widget _imageTypeBuilder() {
    final imageFiles = widget.chatFile.urls
        .where((element) => element.type == PeamanFileType.image)
        .toList();
    if (imageFiles.isEmpty) return const SizedBox();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageFiles.length,
      itemBuilder: (context, index) {
        final url = imageFiles[index];
        return Container(
          width: 200.w,
          height: 200.h,
          decoration: BoxDecoration(
            color: PeamanColors.extraLightGrey,
            borderRadius: BorderRadius.circular(5.r),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                url.url ?? '',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ).onPressed(
          () => context.pushNamed(
            PeamanViewPicturesScreen.route,
            arguments: PeamanViewPicturesArgs(
              pictures: imageFiles.map((e) => e.url ?? '').toList(),
              activeIndex:
                  imageFiles.indexWhere((element) => element.url == url.url),
            ),
          ),
        );
      },
    );
  }

  Widget _linkTypeBuilder() {
    final linkFiles = widget.chatFile.urls
        .where((element) => element.type == PeamanFileType.link)
        .toList();
    if (linkFiles.isEmpty) return const SizedBox();

    return ListView.separated(
      shrinkWrap: true,
      itemCount: linkFiles.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final linkFile = linkFiles[index];
        final metadataFuture = ref.watch(
          providerOfPeamanMetadata(linkFile.url ?? ''),
        );

        return metadataFuture.maybeWhen(
          data: (data) => _metadataBuilder(
            url: linkFile.url ?? '',
            metadata: data,
          ),
          loading: () => _metadataBuilder(url: linkFile.url ?? ''),
          error: (e, _) => _metadataBuilder(url: e.toString()),
          orElse: () => const SizedBox(),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10.h,
        );
      },
    ).pT(10);
  }

  Widget _metadataBuilder({
    required final String url,
    final Metadata? metadata,
  }) {
    return Row(
      children: [
        Container(
          width: 78.w,
          height: 78.w,
          decoration: BoxDecoration(
            color: PeamanColors.extraLightGrey,
            borderRadius: BorderRadius.circular(5.r),
            image: metadata?.image == null
                ? null
                : DecorationImage(
                    image: CachedNetworkImageProvider(
                      metadata!.image!,
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
          child: Center(
            child: Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PeamanColors.black.withOpacity(0.6),
              ),
              child: SvgPicture.asset(
                'assets/svgs/link.svg',
                package: 'peaman_ui_components',
                color: PeamanColors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (metadata?.title != null)
                PeamanText.body1(
                  metadata?.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ).pB(2.0),
              PeamanText.body1(url),
            ],
          ),
        ),
      ],
    ).onPressed(() => _openLink(url));
  }

  void _openLink(String link) async {
    try {
      if (!link.contains('https')) {
        link = 'https://$link';
      }
      if (await canLaunchUrlString(link)) {
        await launchUrlString(link);
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Opening link');
    }
  }
}
