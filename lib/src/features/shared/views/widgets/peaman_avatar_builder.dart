import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum _Type {
  network,
  file,
  asset,
  letter,
}

class PeamanAvatarBuilder extends StatelessWidget {
  final _Type _type;

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
  final Function()? onPressed;

  const PeamanAvatarBuilder.network(
    this.imgUrl, {
    super.key,
    this.size = 40.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : file = null,
        assetPath = null,
        letter = null,
        letterStyle = null,
        _type = _Type.network;

  const PeamanAvatarBuilder.file(
    this.file, {
    super.key,
    this.size = 40.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrl = null,
        assetPath = null,
        letter = null,
        letterStyle = null,
        _type = _Type.file;

  const PeamanAvatarBuilder.asset(
    this.assetPath, {
    super.key,
    this.size = 40.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrl = null,
        file = null,
        letter = null,
        letterStyle = null,
        _type = _Type.asset;

  const PeamanAvatarBuilder.letter(
    this.letter, {
    super.key,
    this.letterStyle,
    this.size = 40.0,
    this.color,
    this.heroTag,
    this.overlayWidget,
    this.border,
    this.onPressed,
  })  : imgUrl = null,
        file = null,
        assetPath = null,
        _type = _Type.letter;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _Type.network:
        return _networkBuilder();
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
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider('$imgUrl'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _fileBuilder() {
    return _baseBuilder(
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: FileImage(file!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _assetBuilder() {
    return _baseBuilder(
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(assetPath!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _letterBuilder() {
    return _baseBuilder(
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$letter',
            style: letterStyle,
          ),
        ),
      ),
    );
  }

  Widget _baseBuilder(Widget child) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: size + 2,
        height: size + 2,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: border,
        ),
        child: child,
      ),
    );
  }
}
