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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$PeamanChatMessageExtraDataImplCopyWith<$Res>
    implements $PeamanChatMessageExtraDataCopyWith<$Res> {
  factory _$$PeamanChatMessageExtraDataImplCopyWith(
          _$PeamanChatMessageExtraDataImpl value,
          $Res Function(_$PeamanChatMessageExtraDataImpl) then) =
      __$$PeamanChatMessageExtraDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PeamanInfoMessageType infoType});
}

/// @nodoc
class __$$PeamanChatMessageExtraDataImplCopyWithImpl<$Res>
    extends _$PeamanChatMessageExtraDataCopyWithImpl<$Res,
        _$PeamanChatMessageExtraDataImpl>
    implements _$$PeamanChatMessageExtraDataImplCopyWith<$Res> {
  __$$PeamanChatMessageExtraDataImplCopyWithImpl(
      _$PeamanChatMessageExtraDataImpl _value,
      $Res Function(_$PeamanChatMessageExtraDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infoType = null,
  }) {
    return _then(_$PeamanChatMessageExtraDataImpl(
      infoType: null == infoType
          ? _value.infoType
          : infoType // ignore: cast_nullable_to_non_nullable
              as PeamanInfoMessageType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeamanChatMessageExtraDataImpl implements _PeamanChatMessageExtraData {
  const _$PeamanChatMessageExtraDataImpl(
      {this.infoType = PeamanInfoMessageType.unknown});

  factory _$PeamanChatMessageExtraDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PeamanChatMessageExtraDataImplFromJson(json);

  @override
  @JsonKey()
  final PeamanInfoMessageType infoType;

  @override
  String toString() {
    return 'PeamanChatMessageExtraData(infoType: $infoType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeamanChatMessageExtraDataImpl &&
            (identical(other.infoType, infoType) ||
                other.infoType == infoType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, infoType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeamanChatMessageExtraDataImplCopyWith<_$PeamanChatMessageExtraDataImpl>
      get copyWith => __$$PeamanChatMessageExtraDataImplCopyWithImpl<
          _$PeamanChatMessageExtraDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeamanChatMessageExtraDataImplToJson(
      this,
    );
  }
}

abstract class _PeamanChatMessageExtraData
    implements PeamanChatMessageExtraData {
  const factory _PeamanChatMessageExtraData(
          {final PeamanInfoMessageType infoType}) =
      _$PeamanChatMessageExtraDataImpl;

  factory _PeamanChatMessageExtraData.fromJson(Map<String, dynamic> json) =
      _$PeamanChatMessageExtraDataImpl.fromJson;

  @override
  PeamanInfoMessageType get infoType;
  @override
  @JsonKey(ignore: true)
  _$$PeamanChatMessageExtraDataImplCopyWith<_$PeamanChatMessageExtraDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
