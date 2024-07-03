import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/comment/models/peaman_comment_extra_model.dart';

extension PeamanCommentExt on PeamanComment {
  PeamanCommentExtraModel get extraModel =>
      PeamanCommentExtraModel.fromJson(extraData);

  bool get isLocal => extraModel.isLocal;
}
