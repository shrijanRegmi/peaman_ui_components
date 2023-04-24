import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFileUrlExtended implements PeamanFileUrl {
  @override
  String? id;

  @override
  final String url;

  @override
  final String? thumbnailUrl;

  @override
  final PeamanFileType type;

  bool isLocal;

  PeamanFileUrlExtended({
    this.id,
    required this.url,
    required this.type,
    required this.isLocal,
    this.thumbnailUrl,
  });

  @override
  $PeamanFileUrlCopyWith<PeamanFileUrl> get copyWith => PeamanFileUrl(
        id: id,
        url: url,
        type: type,
        thumbnailUrl: thumbnailUrl,
      ).copyWith;

  @override
  Map<String, dynamic> toJson() {
    return PeamanFileUrl(
      id: id,
      url: url,
      type: type,
      thumbnailUrl: thumbnailUrl,
    ).toJson();
  }
}
