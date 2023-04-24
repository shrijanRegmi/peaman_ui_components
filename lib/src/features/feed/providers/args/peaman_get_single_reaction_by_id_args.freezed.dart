// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_get_single_reaction_by_id_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanGetSingleReactionByIdArgs {
  String get feedId => throw _privateConstructorUsedError;
  String get reactionId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanGetSingleReactionByIdArgsCopyWith<PeamanGetSingleReactionByIdArgs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanGetSingleReactionByIdArgsCopyWith<$Res> {
  factory $PeamanGetSingleReactionByIdArgsCopyWith(
          PeamanGetSingleReactionByIdArgs value,
          $Res Function(PeamanGetSingleReactionByIdArgs) then) =
      _$PeamanGetSingleReactionByIdArgsCopyWithImpl<$Res,
          PeamanGetSingleReactionByIdArgs>;
  @useResult
  $Res call({String feedId, String reactionId});
}

/// @nodoc
class _$PeamanGetSingleReactionByIdArgsCopyWithImpl<$Res,
        $Val extends PeamanGetSingleReactionByIdArgs>
    implements $PeamanGetSingleReactionByIdArgsCopyWith<$Res> {
  _$PeamanGetSingleReactionByIdArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedId = null,
    Object? reactionId = null,
  }) {
    return _then(_value.copyWith(
      feedId: null == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String,
      reactionId: null == reactionId
          ? _value.reactionId
          : reactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanGetSingleReactionByIdArgsCopyWith<$Res>
    implements $PeamanGetSingleReactionByIdArgsCopyWith<$Res> {
  factory _$$_PeamanGetSingleReactionByIdArgsCopyWith(
          _$_PeamanGetSingleReactionByIdArgs value,
          $Res Function(_$_PeamanGetSingleReactionByIdArgs) then) =
      __$$_PeamanGetSingleReactionByIdArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String feedId, String reactionId});
}

/// @nodoc
class __$$_PeamanGetSingleReactionByIdArgsCopyWithImpl<$Res>
    extends _$PeamanGetSingleReactionByIdArgsCopyWithImpl<$Res,
        _$_PeamanGetSingleReactionByIdArgs>
    implements _$$_PeamanGetSingleReactionByIdArgsCopyWith<$Res> {
  __$$_PeamanGetSingleReactionByIdArgsCopyWithImpl(
      _$_PeamanGetSingleReactionByIdArgs _value,
      $Res Function(_$_PeamanGetSingleReactionByIdArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedId = null,
    Object? reactionId = null,
  }) {
    return _then(_$_PeamanGetSingleReactionByIdArgs(
      feedId: null == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String,
      reactionId: null == reactionId
          ? _value.reactionId
          : reactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PeamanGetSingleReactionByIdArgs
    implements _PeamanGetSingleReactionByIdArgs {
  const _$_PeamanGetSingleReactionByIdArgs(
      {required this.feedId, required this.reactionId});

  @override
  final String feedId;
  @override
  final String reactionId;

  @override
  String toString() {
    return 'PeamanGetSingleReactionByIdArgs(feedId: $feedId, reactionId: $reactionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanGetSingleReactionByIdArgs &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.reactionId, reactionId) ||
                other.reactionId == reactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedId, reactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanGetSingleReactionByIdArgsCopyWith<
          _$_PeamanGetSingleReactionByIdArgs>
      get copyWith => __$$_PeamanGetSingleReactionByIdArgsCopyWithImpl<
          _$_PeamanGetSingleReactionByIdArgs>(this, _$identity);
}

abstract class _PeamanGetSingleReactionByIdArgs
    implements PeamanGetSingleReactionByIdArgs {
  const factory _PeamanGetSingleReactionByIdArgs(
      {required final String feedId,
      required final String reactionId}) = _$_PeamanGetSingleReactionByIdArgs;

  @override
  String get feedId;
  @override
  String get reactionId;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanGetSingleReactionByIdArgsCopyWith<
          _$_PeamanGetSingleReactionByIdArgs>
      get copyWith => throw _privateConstructorUsedError;
}
