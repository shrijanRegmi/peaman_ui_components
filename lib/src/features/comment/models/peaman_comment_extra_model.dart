import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_comment_extra_model.freezed.dart';
part 'peaman_comment_extra_model.g.dart';

@freezed
class PeamanCommentExtraModel with _$PeamanCommentExtraModel {
  const factory PeamanCommentExtraModel({
    /// Whether the comment is local or not.
    ///
    /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
    @Default(false) final bool isLocal,
  }) = _PeamanCommentExtraModel;

  factory PeamanCommentExtraModel.fromJson(Map<String, dynamic> json) =>
      _$PeamanCommentExtraModelFromJson(json);
}
