import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFileUrlExtended implements PeamanFileUrl {
  @override
  final String url;

  @override
  final PeamanFileType type;

  bool isLocal;

  PeamanFileUrlExtended({
    required this.url,
    required this.type,
    required this.isLocal,
  });

  @override
  $PeamanFileUrlCopyWith<PeamanFileUrl> get copyWith =>
      PeamanFileUrl(url: url, type: type).copyWith;

  @override
  Map<String, dynamic> toJson() {
    return PeamanFileUrl(url: url, type: type).toJson();
  }
}