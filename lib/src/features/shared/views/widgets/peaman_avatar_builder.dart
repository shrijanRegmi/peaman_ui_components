import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  network,
  multiNetwork,
  file,
  asset,
  letter,
}

class PeamanAvatarBuilder extends StatefulWidget {
  final _Type _type;

  final List<String?> imgUrls;
  final String? imgUrl;
  final File? file;
  final String? assetPath;
  final String? letter;

  final double size;
  final Color? color;
  final TextStyle? letterStyle;
  final String? heroTag;
  final Widget? overlayWidget;
  final Border? border;
  final double spreadFactor;
  final Function()? onPressed;

  const PeamanAvatarBuilder.network(
    this.imgUrl, {
    super.key,
    this.size = 50.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrls = const [],
        file = null,
        assetPath = null,
        letter = null,
        letterStyle = null,
        spreadFactor = 1.0,
        _type = _Type.network;

  const PeamanAvatarBuilder.multiNetwork(
    this.imgUrls, {
    super.key,
    this.size = 50.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.spreadFactor = 1.0,
    this.onPressed,
  })  : file = null,
        imgUrl = null,
        assetPath = null,
        letter = null,
        letterStyle = null,
        _type = _Type.multiNetwork;

  const PeamanAvatarBuilder.file(
    this.file, {
    super.key,
    this.size = 50.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrl = null,
        imgUrls = const [],
        assetPath = null,
        letter = null,
        letterStyle = null,
        spreadFactor = 1.0,
        _type = _Type.file;

  const PeamanAvatarBuilder.asset(
    this.assetPath, {
    super.key,
    this.size = 50.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrl = null,
        imgUrls = const [],
        file = null,
        letter = null,
        letterStyle = null,
        spreadFactor = 1.0,
        _type = _Type.asset;

  const PeamanAvatarBuilder.letter(
    this.letter, {
    super.key,
    this.letterStyle,
    this.size = 50.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrl = null,
        imgUrls = const [],
        file = null,
        assetPath = null,
        spreadFactor = 1.0,
        _type = _Type.letter;

  @override
  State<PeamanAvatarBuilder> createState() => _PeamanAvatarBuilderState();
}

class _PeamanAvatarBuilderState extends State<PeamanAvatarBuilder> {
  @override
  Widget build(BuildContext context) {
    switch (widget._type) {
      case _Type.network:
        return _networkBuilder();
      case _Type.multiNetwork:
        return _multiNetworkBuilder();
      case _Type.file:
        return _fileBuilder();
      case _Type.asset:
        return _assetBuilder();
      case _Type.letter:
        return _letterBuilder();
      default:
    }
    return Container();
  }

  Widget _networkBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: PeamanColors.extraLightGrey,
          shape: BoxShape.circle,
          border: Border.all(color: PeamanColors.white),
          image: DecorationImage(
            image: CachedNetworkImageProvider('${widget.imgUrl}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _multiNetworkBuilder() {
    final images = widget.imgUrls
        .sublist(0, widget.imgUrls.length > 3 ? 3 : widget.imgUrls.length);

    return _baseBuilder(
      images.length <= 1
          ? _networkStackItemBuilder(
              imgUrl: images.isEmpty ? null : images[0],
              size: widget.size,
              border: false,
            )
          : Stack(
              clipBehavior: Clip.none,
              children: [
                for (var i = 0; i < images.length; i++)
                  Positioned(
                    top: i == 1 && images.length == 2
                        ? 10.0 * widget.spreadFactor
                        : i == 0
                            ? null
                            : i == 1
                                ? 15.0 * widget.spreadFactor
                                : i == 2
                                    ? 5.0 * widget.spreadFactor
                                    : null,
                    right: i == 1 && images.length == 2
                        ? null
                        : i == 0 || i == 1
                            ? 10.0 * widget.spreadFactor
                            : null,
                    left: i == 1 && images.length == 2
                        ? 5.0 * widget.spreadFactor
                        : i == 2
                            ? 10.0 * widget.spreadFactor
                            : null,
                    child: _networkStackItemBuilder(
                      imgUrl: images[i],
                      size: i == 0 ? widget.size - 3 : widget.size - 6,
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _fileBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(widget.file!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _assetBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(widget.assetPath!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _letterBuilder() {
    return _baseBuilder(
      Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '${widget.letter}',
            style: widget.letterStyle,
          ),
        ),
      ),
    );
  }

  Widget _baseBuilder(Widget child) {
    return GestureDetector(
      onTap: widget.onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: (widget.size + 2).w,
        height: (widget.size + 2).h,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: widget.border,
        ),
        child: child,
      ),
    );
  }

  Widget _networkStackItemBuilder({
    required final String? imgUrl,
    required final double size,
    final bool border = true,
  }) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey2,
        shape: BoxShape.circle,
        border: border
            ? Border.all(
                color: context.isDarkMode
                    ? PeamanColors.white70
                    : PeamanColors.white,
                width: 1.5,
              )
            : null,
        image: imgUrl == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(imgUrl),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
