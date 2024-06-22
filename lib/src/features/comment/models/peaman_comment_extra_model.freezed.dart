// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_comment_extra_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PeamanCommentExtraModel _$PeamanCommentExtraModelFromJson(
    Map<String, dynamic> json) {
  return _PeamanCommentExtraModel.fromJson(json);
}

/// @nodoc
mixin _$PeamanCommentExtraModel {
  /// Whether the comment is local or not.
  ///
  /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
  bool get isLocal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanCommentExtraModelCopyWith<PeamanCommentExtraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanCommentExtraModelCopyWith<$Res> {
  factory $PeamanCommentExtraModelCopyWith(PeamanCommentExtraModel value,
          $Res Function(PeamanCommentExtraModel) then) =
      _$PeamanCommentExtraModelCopyWithImpl<$Res, PeamanCommentExtraModel>;
  @useResult
  $Res call({bool isLocal});
}

/// @nodoc
class _$PeamanCommentExtraModelCopyWithImpl<$Res,
        $Val extends PeamanCommentExtraModel>
    implements $PeamanCommentExtraModelCopyWith<$Res> {
  _$PeamanCommentExtraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocal = null,
  }) {
    return _then(_value.copyWith(
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeamanCommentExtraModelImplCopyWith<$Res>
    implements $PeamanCommentExtraModelCopyWith<$Res> {
  factory _$$PeamanCommentExtraModelImplCopyWith(
          _$PeamanCommentExtraModelImpl value,
          $Res Function(_$PeamanCommentExtraModelImpl) then) =
      __$$PeamanCommentExtraModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLocal});
}

/// @nodoc
class __$$PeamanCommentExtraModelImplCopyWithImpl<$Res>
    extends _$PeamanCommentExtraModelCopyWithImpl<$Res,
        _$PeamanCommentExtraModelImpl>
    implements _$$PeamanCommentExtraModelImplCopyWith<$Res> {
  __$$PeamanCommentExtraModelImplCopyWithImpl(
      _$PeamanCommentExtraModelImpl _value,
      $Res Function(_$PeamanCommentExtraModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLocal = null,
  }) {
    return _then(_$PeamanCommentExtraModelImpl(
      isLocal: null == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeamanCommentExtraModelImpl implements _PeamanCommentExtraModel {
  const _$PeamanCommentExtraModelImpl({this.isLocal = false});

  factory _$PeamanCommentExtraModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeamanCommentExtraModelImplFromJson(json);

  /// Whether the comment is local or not.
  ///
  /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
  @override
  @JsonKey()
  final bool isLocal;

  @override
  String toString() {
    return 'PeamanCommentExtraModel(isLocal: $isLocal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeamanCommentExtraModelImpl &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLocal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeamanCommentExtraModelImplCopyWith<_$PeamanCommentExtraModelImpl>
      get copyWith => __$$PeamanCommentExtraModelImplCopyWithImpl<
          _$PeamanCommentExtraModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeamanCommentExtraModelImplToJson(
      this,
    );
  }
}

abstract class _PeamanCommentExtraModel implements PeamanCommentExtraModel {
  const factory _PeamanCommentExtraModel({final bool isLocal}) =
      _$PeamanCommentExtraModelImpl;

  factory _PeamanCommentExtraModel.fromJson(Map<String, dynamic> json) =
      _$PeamanCommentExtraModelImpl.fromJson;

  @override

  /// Whether the comment is local or not.
  ///
  /// Local comments are the comments that are created by the user but are not yet uploaded to the server.
  bool get isLocal;
  @override
  @JsonKey(ignore: true)
  _$$PeamanCommentExtraModelImplCopyWith<_$PeamanCommentExtraModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
