// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_info_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanInfoProviderState {
  String? get error => throw _privateConstructorUsedError;
  String? get success => throw _privateConstructorUsedError;
  String? get warning => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanInfoProviderStateCopyWith<PeamanInfoProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanInfoProviderStateCopyWith<$Res> {
  factory $PeamanInfoProviderStateCopyWith(PeamanInfoProviderState value,
          $Res Function(PeamanInfoProviderState) then) =
      _$PeamanInfoProviderStateCopyWithImpl<$Res, PeamanInfoProviderState>;
  @useResult
  $Res call({String? error, String? success, String? warning});
}

/// @nodoc
class _$PeamanInfoProviderStateCopyWithImpl<$Res,
        $Val extends PeamanInfoProviderState>
    implements $PeamanInfoProviderStateCopyWith<$Res> {
  _$PeamanInfoProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? success = freezed,
    Object? warning = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      warning: freezed == warning
          ? _value.warning
          : warning // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanInfoProviderStateCopyWith<$Res>
    implements $PeamanInfoProviderStateCopyWith<$Res> {
  factory _$$_PeamanInfoProviderStateCopyWith(_$_PeamanInfoProviderState value,
          $Res Function(_$_PeamanInfoProviderState) then) =
      __$$_PeamanInfoProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, String? success, String? warning});
}

/// @nodoc
class __$$_PeamanInfoProviderStateCopyWithImpl<$Res>
    extends _$PeamanInfoProviderStateCopyWithImpl<$Res,
        _$_PeamanInfoProviderState>
    implements _$$_PeamanInfoProviderStateCopyWith<$Res> {
  __$$_PeamanInfoProviderStateCopyWithImpl(_$_PeamanInfoProviderState _value,
      $Res Function(_$_PeamanInfoProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? success = freezed,
    Object? warning = freezed,
  }) {
    return _then(_$_PeamanInfoProviderState(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as String?,
      warning: freezed == warning
          ? _value.warning
          : warning // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PeamanInfoProviderState implements _PeamanInfoProviderState {
  const _$_PeamanInfoProviderState({this.error, this.success, this.warning});

  @override
  final String? error;
  @override
  final String? success;
  @override
  final String? warning;

  @override
  String toString() {
    return 'PeamanInfoProviderState(error: $error, success: $success, warning: $warning)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanInfoProviderState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.warning, warning) || other.warning == warning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, success, warning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanInfoProviderStateCopyWith<_$_PeamanInfoProviderState>
      get copyWith =>
          __$$_PeamanInfoProviderStateCopyWithImpl<_$_PeamanInfoProviderState>(
              this, _$identity);
}

abstract class _PeamanInfoProviderState implements PeamanInfoProviderState {
  const factory _PeamanInfoProviderState(
      {final String? error,
      final String? success,
      final String? warning}) = _$_PeamanInfoProviderState;

  @override
  String? get error;
  @override
  String? get success;
  @override
  String? get warning;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanInfoProviderStateCopyWith<_$_PeamanInfoProviderState>
      get copyWith => throw _privateConstructorUsedError;
}
