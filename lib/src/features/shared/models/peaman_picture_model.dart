import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanPicture {
  final String path;
  final PeamanPictureType type;

  PeamanPicture({
    required this.path,
    this.type = PeamanPictureType.network,
  });
}
