import 'package:peaman_ui_components/peaman_ui_components.dart';

extension PeamanMessageExtraDataExt on PeamanMessage {
  PeamanMessageExtraData get _extraData =>
      PeamanMessageExtraData.fromJson(extraData);

  String? get parentId => _extraData.parentId;
  String? get parentText => _extraData.parentText;
}

class PeamanMessageExtraData {
  final String? parentId;
  final String? parentText;

  PeamanMessageExtraData({
    this.parentId,
    this.parentText,
  });

  static PeamanMessageExtraData fromJson(final Map<String, dynamic> data) {
    return PeamanMessageExtraData(
      parentId: data['parent_id'],
      parentText: data['parent_text'],
    );
  }
}
