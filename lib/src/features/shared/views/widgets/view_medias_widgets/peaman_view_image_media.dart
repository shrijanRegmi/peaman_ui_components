import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:photo_view/photo_view.dart';

class PeamanViewImageMedia extends ConsumerStatefulWidget {
  final PeamanFileUrlExtended url;

  const PeamanViewImageMedia({
    super.key,
    required this.url,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewImageMediaState();
}

class _PeamanViewImageMediaState extends ConsumerState<PeamanViewImageMedia> {
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      initialScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered,
      minScale: PhotoViewComputedScale.contained,
      heroAttributes: PhotoViewHeroAttributes(tag: widget.url.url),
      imageProvider: widget.url.isLocal
          ? FileImage(File(widget.url.url))
          : CachedNetworkImageProvider(
              widget.url.url,
            ) as ImageProvider,
    );
  }
}
