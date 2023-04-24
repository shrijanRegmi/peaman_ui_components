// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_feed_extra_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanFeedExtraData _$PeamanFeedExtraDataFromJson(Map<String, dynamic> json) {
  return _PeamanFeedExtraData.fromJson(json);
}

/// @nodoc
mixin _$PeamanFeedExtraData {
  String? get appUserSelectedPollOptionId => throw _privateConstructorUsedError;
  bool get isReacted => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanFeedExtraDataCopyWith<PeamanFeedExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanFeedExtraDataCopyWith<$Res> {
  factory $PeamanFeedExtraDataCopyWith(
          PeamanFeedExtraData value, $Res Function(PeamanFeedExtraData) then) =
      _$PeamanFeedExtraDataCopyWithImpl<$Res, PeamanFeedExtraData>;
  @useResult
  $Res call(
      {String? appUserSelectedPollOptionId, bool isReacted, bool isSaved});
}

/// @nodoc
class _$PeamanFeedExtraDataCopyWithImpl<$Res, $Val extends PeamanFeedExtraData>
    implements $PeamanFeedExtraDataCopyWith<$Res> {
  _$PeamanFeedExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUserSelectedPollOptionId = freezed,
    Object? isReacted = null,
    Object? isSaved = null,
  }) {
    return _then(_value.copyWith(
      appUserSelectedPollOptionId: freezed == appUserSelectedPollOptionId
          ? _value.appUserSelectedPollOptionId
          : appUserSelectedPollOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isReacted: null == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanFeedExtraDataCopyWith<$Res>
    implements $PeamanFeedExtraDataCopyWith<$Res> {
  factory _$$_PeamanFeedExtraDataCopyWith(_$_PeamanFeedExtraData value,
          $Res Function(_$_PeamanFeedExtraData) then) =
      __$$_PeamanFeedExtraDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? appUserSelectedPollOptionId, bool isReacted, bool isSaved});
}

/// @nodoc
class __$$_PeamanFeedExtraDataCopyWithImpl<$Res>
    extends _$PeamanFeedExtraDataCopyWithImpl<$Res, _$_PeamanFeedExtraData>
    implements _$$_PeamanFeedExtraDataCopyWith<$Res> {
  __$$_PeamanFeedExtraDataCopyWithImpl(_$_PeamanFeedExtraData _value,
      $Res Function(_$_PeamanFeedExtraData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUserSelectedPollOptionId = freezed,
    Object? isReacted = null,
    Object? isSaved = null,
  }) {
    return _then(_$_PeamanFeedExtraData(
      appUserSelectedPollOptionId: freezed == appUserSelectedPollOptionId
          ? _value.appUserSelectedPollOptionId
          : appUserSelectedPollOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isReacted: null == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanFeedExtraData implements _PeamanFeedExtraData {
  const _$_PeamanFeedExtraData(
      {this.appUserSelectedPollOptionId,
      this.isReacted = false,
      this.isSaved = false});

  factory _$_PeamanFeedExtraData.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanFeedExtraDataFromJson(json);

  @override
  final String? appUserSelectedPollOptionId;
  @override
  @JsonKey()
  final bool isReacted;
  @override
  @JsonKey()
  final bool isSaved;

  @override
  String toString() {
    return 'PeamanFeedExtraData(appUserSelectedPollOptionId: $appUserSelectedPollOptionId, isReacted: $isReacted, isSaved: $isSaved)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanFeedExtraData &&
            (identical(other.appUserSelectedPollOptionId,
                    appUserSelectedPollOptionId) ||
                other.appUserSelectedPollOptionId ==
                    appUserSelectedPollOptionId) &&
            (identical(other.isReacted, isReacted) ||
                other.isReacted == isReacted) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, appUserSelectedPollOptionId, isReacted, isSaved);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanFeedExtraDataCopyWith<_$_PeamanFeedExtraData> get copyWith =>
      __$$_PeamanFeedExtraDataCopyWithImpl<_$_PeamanFeedExtraData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanFeedExtraDataToJson(
      this,
    );
  }
}

abstract class _PeamanFeedExtraData implements PeamanFeedExtraData {
  const factory _PeamanFeedExtraData(
      {final String? appUserSelectedPollOptionId,
      final bool isReacted,
      final bool isSaved}) = _$_PeamanFeedExtraData;

  factory _PeamanFeedExtraData.fromJson(Map<String, dynamic> json) =
      _$_PeamanFeedExtraData.fromJson;

  @override
  String? get appUserSelectedPollOptionId;
  @override
  bool get isReacted;
  @override
  bool get isSaved;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanFeedExtraDataCopyWith<_$_PeamanFeedExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}
