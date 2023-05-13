import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanViewMediasListItem extends ConsumerStatefulWidget {
  final PeamanFileUrlExtended url;

  const PeamanViewMediasListItem({
    super.key,
    required this.url,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanViewMediasListItemState();
}

class _PeamanViewMediasListItemState
    extends ConsumerState<PeamanViewMediasListItem> {
  @override
  Widget build(BuildContext context) {
    switch (widget.url.type) {
      case PeamanFileType.image:
        return PeamanViewImageMedia(
          url: widget.url,
        );
      case PeamanFileType.video:
        return PeamanViewVideoMedia(
          url: widget.url,
        );
      default:
        return const SizedBox();
    }
  }
}
