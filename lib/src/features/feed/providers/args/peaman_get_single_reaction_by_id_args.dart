import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_get_single_reaction_by_id_args.freezed.dart';

@freezed
class PeamanGetSingleReactionByIdArgs with _$PeamanGetSingleReactionByIdArgs {
  const factory PeamanGetSingleReactionByIdArgs({
    required final String feedId,
    required final String reactionId,
  }) = _PeamanGetSingleReactionByIdArgs;
}
