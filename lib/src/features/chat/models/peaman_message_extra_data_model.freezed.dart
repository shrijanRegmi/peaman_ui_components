// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_message_extra_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PeamanChatMessageExtraData _$PeamanChatMessageExtraDataFromJson(
    Map<String, dynamic> json) {
  return _PeamanChatMessageExtraData.fromJson(json);
}

/// @nodoc
mixin _$PeamanChatMessageExtraData {
  PeamanInfoMessageType get infoType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeamanChatMessageExtraDataCopyWith<PeamanChatMessageExtraData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatMessageExtraDataCopyWith<$Res> {
  factory $PeamanChatMessageExtraDataCopyWith(PeamanChatMessageExtraData value,
          $Res Function(PeamanChatMessageExtraData) then) =
      _$PeamanChatMessageExtraDataCopyWithImpl<$Res,
          PeamanChatMessageExtraData>;
  @useResult
  $Res call({PeamanInfoMessageType infoType});
}

/// @nodoc
class _$PeamanChatMessageExtraDataCopyWithImpl<$Res,
        $Val extends PeamanChatMessageExtraData>
    implements $PeamanChatMessageExtraDataCopyWith<$Res> {
  _$PeamanChatMessageExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infoType = null,
  }) {
    return _then(_value.copyWith(
      infoType: null == infoType
          ? _value.infoType
          : infoType // ignore: cast_nullable_to_non_nullable
              as PeamanInfoMessageType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatMessageExtraDataCopyWith<$Res>
    implements $PeamanChatMessageExtraDataCopyWith<$Res> {
  factory _$$_PeamanChatMessageExtraDataCopyWith(
          _$_PeamanChatMessageExtraData value,
          $Res Function(_$_PeamanChatMessageExtraData) then) =
      __$$_PeamanChatMessageExtraDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PeamanInfoMessageType infoType});
}

/// @nodoc
class __$$_PeamanChatMessageExtraDataCopyWithImpl<$Res>
    extends _$PeamanChatMessageExtraDataCopyWithImpl<$Res,
        _$_PeamanChatMessageExtraData>
    implements _$$_PeamanChatMessageExtraDataCopyWith<$Res> {
  __$$_PeamanChatMessageExtraDataCopyWithImpl(
      _$_PeamanChatMessageExtraData _value,
      $Res Function(_$_PeamanChatMessageExtraData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infoType = null,
  }) {
    return _then(_$_PeamanChatMessageExtraData(
      infoType: null == infoType
          ? _value.infoType
          : infoType // ignore: cast_nullable_to_non_nullable
              as PeamanInfoMessageType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeamanChatMessageExtraData implements _PeamanChatMessageExtraData {
  const _$_PeamanChatMessageExtraData(
      {this.infoType = PeamanInfoMessageType.unknown});

  factory _$_PeamanChatMessageExtraData.fromJson(Map<String, dynamic> json) =>
      _$$_PeamanChatMessageExtraDataFromJson(json);

  @override
  @JsonKey()
  final PeamanInfoMessageType infoType;

  @override
  String toString() {
    return 'PeamanChatMessageExtraData(infoType: $infoType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatMessageExtraData &&
            (identical(other.infoType, infoType) ||
                other.infoType == infoType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, infoType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatMessageExtraDataCopyWith<_$_PeamanChatMessageExtraData>
      get copyWith => __$$_PeamanChatMessageExtraDataCopyWithImpl<
          _$_PeamanChatMessageExtraData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeamanChatMessageExtraDataToJson(
      this,
    );
  }
}

abstract class _PeamanChatMessageExtraData
    implements PeamanChatMessageExtraData {
  const factory _PeamanChatMessageExtraData(
      {final PeamanInfoMessageType infoType}) = _$_PeamanChatMessageExtraData;

  factory _PeamanChatMessageExtraData.fromJson(Map<String, dynamic> json) =
      _$_PeamanChatMessageExtraData.fromJson;

  @override
  PeamanInfoMessageType get infoType;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatMessageExtraDataCopyWith<_$_PeamanChatMessageExtraData>
      get copyWith => throw _privateConstructorUsedError;
}
