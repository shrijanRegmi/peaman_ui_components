// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_user_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanUserProviderState {
  UpdateUserState get updateUserState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanUserProviderStateCopyWith<PeamanUserProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanUserProviderStateCopyWith<$Res> {
  factory $PeamanUserProviderStateCopyWith(PeamanUserProviderState value,
          $Res Function(PeamanUserProviderState) then) =
      _$PeamanUserProviderStateCopyWithImpl<$Res, PeamanUserProviderState>;
  @useResult
  $Res call({UpdateUserState updateUserState});

  $UpdateUserStateCopyWith<$Res> get updateUserState;
}

/// @nodoc
class _$PeamanUserProviderStateCopyWithImpl<$Res,
        $Val extends PeamanUserProviderState>
    implements $PeamanUserProviderStateCopyWith<$Res> {
  _$PeamanUserProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserState = null,
  }) {
    return _then(_value.copyWith(
      updateUserState: null == updateUserState
          ? _value.updateUserState
          : updateUserState // ignore: cast_nullable_to_non_nullable
              as UpdateUserState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdateUserStateCopyWith<$Res> get updateUserState {
    return $UpdateUserStateCopyWith<$Res>(_value.updateUserState, (value) {
      return _then(_value.copyWith(updateUserState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PeamanUserProviderStateCopyWith<$Res>
    implements $PeamanUserProviderStateCopyWith<$Res> {
  factory _$$_PeamanUserProviderStateCopyWith(_$_PeamanUserProviderState value,
          $Res Function(_$_PeamanUserProviderState) then) =
      __$$_PeamanUserProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UpdateUserState updateUserState});

  @override
  $UpdateUserStateCopyWith<$Res> get updateUserState;
}

/// @nodoc
class __$$_PeamanUserProviderStateCopyWithImpl<$Res>
    extends _$PeamanUserProviderStateCopyWithImpl<$Res,
        _$_PeamanUserProviderState>
    implements _$$_PeamanUserProviderStateCopyWith<$Res> {
  __$$_PeamanUserProviderStateCopyWithImpl(_$_PeamanUserProviderState _value,
      $Res Function(_$_PeamanUserProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserState = null,
  }) {
    return _then(_$_PeamanUserProviderState(
      updateUserState: null == updateUserState
          ? _value.updateUserState
          : updateUserState // ignore: cast_nullable_to_non_nullable
              as UpdateUserState,
    ));
  }
}

/// @nodoc

class _$_PeamanUserProviderState implements _PeamanUserProviderState {
  const _$_PeamanUserProviderState(
      {this.updateUserState = const UpdateUserState.initial()});

  @override
  @JsonKey()
  final UpdateUserState updateUserState;

  @override
  String toString() {
    return 'PeamanUserProviderState(updateUserState: $updateUserState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanUserProviderState &&
            (identical(other.updateUserState, updateUserState) ||
                other.updateUserState == updateUserState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateUserState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanUserProviderStateCopyWith<_$_PeamanUserProviderState>
      get copyWith =>
          __$$_PeamanUserProviderStateCopyWithImpl<_$_PeamanUserProviderState>(
              this, _$identity);
}

abstract class _PeamanUserProviderState implements PeamanUserProviderState {
  const factory _PeamanUserProviderState(
      {final UpdateUserState updateUserState}) = _$_PeamanUserProviderState;

  @override
  UpdateUserState get updateUserState;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanUserProviderStateCopyWith<_$_PeamanUserProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateUserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserStateInitial value) initial,
    required TResult Function(_UpdateUserStateLoading value) loading,
    required TResult Function(_UpdateUserStateSuccess value) success,
    required TResult Function(_UpdateUserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserStateInitial value)? initial,
    TResult? Function(_UpdateUserStateLoading value)? loading,
    TResult? Function(_UpdateUserStateSuccess value)? success,
    TResult? Function(_UpdateUserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserStateInitial value)? initial,
    TResult Function(_UpdateUserStateLoading value)? loading,
    TResult Function(_UpdateUserStateSuccess value)? success,
    TResult Function(_UpdateUserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserStateCopyWith<$Res> {
  factory $UpdateUserStateCopyWith(
          UpdateUserState value, $Res Function(UpdateUserState) then) =
      _$UpdateUserStateCopyWithImpl<$Res, UpdateUserState>;
}

/// @nodoc
class _$UpdateUserStateCopyWithImpl<$Res, $Val extends UpdateUserState>
    implements $UpdateUserStateCopyWith<$Res> {
  _$UpdateUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UpdateUserStateInitialCopyWith<$Res> {
  factory _$$_UpdateUserStateInitialCopyWith(_$_UpdateUserStateInitial value,
          $Res Function(_$_UpdateUserStateInitial) then) =
      __$$_UpdateUserStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateUserStateInitialCopyWithImpl<$Res>
    extends _$UpdateUserStateCopyWithImpl<$Res, _$_UpdateUserStateInitial>
    implements _$$_UpdateUserStateInitialCopyWith<$Res> {
  __$$_UpdateUserStateInitialCopyWithImpl(_$_UpdateUserStateInitial _value,
      $Res Function(_$_UpdateUserStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateUserStateInitial implements _UpdateUserStateInitial {
  const _$_UpdateUserStateInitial();

  @override
  String toString() {
    return 'UpdateUserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserStateInitial value) initial,
    required TResult Function(_UpdateUserStateLoading value) loading,
    required TResult Function(_UpdateUserStateSuccess value) success,
    required TResult Function(_UpdateUserStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserStateInitial value)? initial,
    TResult? Function(_UpdateUserStateLoading value)? loading,
    TResult? Function(_UpdateUserStateSuccess value)? success,
    TResult? Function(_UpdateUserStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserStateInitial value)? initial,
    TResult Function(_UpdateUserStateLoading value)? loading,
    TResult Function(_UpdateUserStateSuccess value)? success,
    TResult Function(_UpdateUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserStateInitial implements UpdateUserState {
  const factory _UpdateUserStateInitial() = _$_UpdateUserStateInitial;
}

/// @nodoc
abstract class _$$_UpdateUserStateLoadingCopyWith<$Res> {
  factory _$$_UpdateUserStateLoadingCopyWith(_$_UpdateUserStateLoading value,
          $Res Function(_$_UpdateUserStateLoading) then) =
      __$$_UpdateUserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateUserStateLoadingCopyWithImpl<$Res>
    extends _$UpdateUserStateCopyWithImpl<$Res, _$_UpdateUserStateLoading>
    implements _$$_UpdateUserStateLoadingCopyWith<$Res> {
  __$$_UpdateUserStateLoadingCopyWithImpl(_$_UpdateUserStateLoading _value,
      $Res Function(_$_UpdateUserStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateUserStateLoading implements _UpdateUserStateLoading {
  const _$_UpdateUserStateLoading();

  @override
  String toString() {
    return 'UpdateUserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserStateInitial value) initial,
    required TResult Function(_UpdateUserStateLoading value) loading,
    required TResult Function(_UpdateUserStateSuccess value) success,
    required TResult Function(_UpdateUserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserStateInitial value)? initial,
    TResult? Function(_UpdateUserStateLoading value)? loading,
    TResult? Function(_UpdateUserStateSuccess value)? success,
    TResult? Function(_UpdateUserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserStateInitial value)? initial,
    TResult Function(_UpdateUserStateLoading value)? loading,
    TResult Function(_UpdateUserStateSuccess value)? success,
    TResult Function(_UpdateUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserStateLoading implements UpdateUserState {
  const factory _UpdateUserStateLoading() = _$_UpdateUserStateLoading;
}

/// @nodoc
abstract class _$$_UpdateUserStateSuccessCopyWith<$Res> {
  factory _$$_UpdateUserStateSuccessCopyWith(_$_UpdateUserStateSuccess value,
          $Res Function(_$_UpdateUserStateSuccess) then) =
      __$$_UpdateUserStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_UpdateUserStateSuccessCopyWithImpl<$Res>
    extends _$UpdateUserStateCopyWithImpl<$Res, _$_UpdateUserStateSuccess>
    implements _$$_UpdateUserStateSuccessCopyWith<$Res> {
  __$$_UpdateUserStateSuccessCopyWithImpl(_$_UpdateUserStateSuccess _value,
      $Res Function(_$_UpdateUserStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_UpdateUserStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateUserStateSuccess implements _UpdateUserStateSuccess {
  const _$_UpdateUserStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'UpdateUserState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserStateSuccessCopyWith<_$_UpdateUserStateSuccess> get copyWith =>
      __$$_UpdateUserStateSuccessCopyWithImpl<_$_UpdateUserStateSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserStateInitial value) initial,
    required TResult Function(_UpdateUserStateLoading value) loading,
    required TResult Function(_UpdateUserStateSuccess value) success,
    required TResult Function(_UpdateUserStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserStateInitial value)? initial,
    TResult? Function(_UpdateUserStateLoading value)? loading,
    TResult? Function(_UpdateUserStateSuccess value)? success,
    TResult? Function(_UpdateUserStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserStateInitial value)? initial,
    TResult Function(_UpdateUserStateLoading value)? loading,
    TResult Function(_UpdateUserStateSuccess value)? success,
    TResult Function(_UpdateUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserStateSuccess implements UpdateUserState {
  const factory _UpdateUserStateSuccess(final bool result) =
      _$_UpdateUserStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_UpdateUserStateSuccessCopyWith<_$_UpdateUserStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateUserStateErrorCopyWith<$Res> {
  factory _$$_UpdateUserStateErrorCopyWith(_$_UpdateUserStateError value,
          $Res Function(_$_UpdateUserStateError) then) =
      __$$_UpdateUserStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_UpdateUserStateErrorCopyWithImpl<$Res>
    extends _$UpdateUserStateCopyWithImpl<$Res, _$_UpdateUserStateError>
    implements _$$_UpdateUserStateErrorCopyWith<$Res> {
  __$$_UpdateUserStateErrorCopyWithImpl(_$_UpdateUserStateError _value,
      $Res Function(_$_UpdateUserStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UpdateUserStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_UpdateUserStateError implements _UpdateUserStateError {
  const _$_UpdateUserStateError(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'UpdateUserState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateUserStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateUserStateErrorCopyWith<_$_UpdateUserStateError> get copyWith =>
      __$$_UpdateUserStateErrorCopyWithImpl<_$_UpdateUserStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(bool result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(bool result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(bool result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserStateInitial value) initial,
    required TResult Function(_UpdateUserStateLoading value) loading,
    required TResult Function(_UpdateUserStateSuccess value) success,
    required TResult Function(_UpdateUserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserStateInitial value)? initial,
    TResult? Function(_UpdateUserStateLoading value)? loading,
    TResult? Function(_UpdateUserStateSuccess value)? success,
    TResult? Function(_UpdateUserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserStateInitial value)? initial,
    TResult Function(_UpdateUserStateLoading value)? loading,
    TResult Function(_UpdateUserStateSuccess value)? success,
    TResult Function(_UpdateUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserStateError implements UpdateUserState {
  const factory _UpdateUserStateError(final PeamanError error) =
      _$_UpdateUserStateError;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_UpdateUserStateErrorCopyWith<_$_UpdateUserStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
