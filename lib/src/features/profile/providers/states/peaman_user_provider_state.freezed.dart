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
  BlockUserState get blockUserState => throw _privateConstructorUsedError;
  UnblockUserState get unblockUserState => throw _privateConstructorUsedError;

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
  $Res call(
      {UpdateUserState updateUserState,
      BlockUserState blockUserState,
      UnblockUserState unblockUserState});

  $UpdateUserStateCopyWith<$Res> get updateUserState;
  $BlockUserStateCopyWith<$Res> get blockUserState;
  $UnblockUserStateCopyWith<$Res> get unblockUserState;
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
    Object? blockUserState = null,
    Object? unblockUserState = null,
  }) {
    return _then(_value.copyWith(
      updateUserState: null == updateUserState
          ? _value.updateUserState
          : updateUserState // ignore: cast_nullable_to_non_nullable
              as UpdateUserState,
      blockUserState: null == blockUserState
          ? _value.blockUserState
          : blockUserState // ignore: cast_nullable_to_non_nullable
              as BlockUserState,
      unblockUserState: null == unblockUserState
          ? _value.unblockUserState
          : unblockUserState // ignore: cast_nullable_to_non_nullable
              as UnblockUserState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdateUserStateCopyWith<$Res> get updateUserState {
    return $UpdateUserStateCopyWith<$Res>(_value.updateUserState, (value) {
      return _then(_value.copyWith(updateUserState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockUserStateCopyWith<$Res> get blockUserState {
    return $BlockUserStateCopyWith<$Res>(_value.blockUserState, (value) {
      return _then(_value.copyWith(blockUserState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnblockUserStateCopyWith<$Res> get unblockUserState {
    return $UnblockUserStateCopyWith<$Res>(_value.unblockUserState, (value) {
      return _then(_value.copyWith(unblockUserState: value) as $Val);
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
  $Res call(
      {UpdateUserState updateUserState,
      BlockUserState blockUserState,
      UnblockUserState unblockUserState});

  @override
  $UpdateUserStateCopyWith<$Res> get updateUserState;
  @override
  $BlockUserStateCopyWith<$Res> get blockUserState;
  @override
  $UnblockUserStateCopyWith<$Res> get unblockUserState;
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
    Object? blockUserState = null,
    Object? unblockUserState = null,
  }) {
    return _then(_$_PeamanUserProviderState(
      updateUserState: null == updateUserState
          ? _value.updateUserState
          : updateUserState // ignore: cast_nullable_to_non_nullable
              as UpdateUserState,
      blockUserState: null == blockUserState
          ? _value.blockUserState
          : blockUserState // ignore: cast_nullable_to_non_nullable
              as BlockUserState,
      unblockUserState: null == unblockUserState
          ? _value.unblockUserState
          : unblockUserState // ignore: cast_nullable_to_non_nullable
              as UnblockUserState,
    ));
  }
}

/// @nodoc

class _$_PeamanUserProviderState implements _PeamanUserProviderState {
  const _$_PeamanUserProviderState(
      {this.updateUserState = const UpdateUserState.initial(),
      this.blockUserState = const BlockUserState.initial(),
      this.unblockUserState = const UnblockUserState.initial()});

  @override
  @JsonKey()
  final UpdateUserState updateUserState;
  @override
  @JsonKey()
  final BlockUserState blockUserState;
  @override
  @JsonKey()
  final UnblockUserState unblockUserState;

  @override
  String toString() {
    return 'PeamanUserProviderState(updateUserState: $updateUserState, blockUserState: $blockUserState, unblockUserState: $unblockUserState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanUserProviderState &&
            (identical(other.updateUserState, updateUserState) ||
                other.updateUserState == updateUserState) &&
            (identical(other.blockUserState, blockUserState) ||
                other.blockUserState == blockUserState) &&
            (identical(other.unblockUserState, unblockUserState) ||
                other.unblockUserState == unblockUserState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, updateUserState, blockUserState, unblockUserState);

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
      {final UpdateUserState updateUserState,
      final BlockUserState blockUserState,
      final UnblockUserState unblockUserState}) = _$_PeamanUserProviderState;

  @override
  UpdateUserState get updateUserState;
  @override
  BlockUserState get blockUserState;
  @override
  UnblockUserState get unblockUserState;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanUserProviderStateCopyWith<_$_PeamanUserProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BlockUserState {
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
    required TResult Function(_BlockUserStateInitial value) initial,
    required TResult Function(_BlockUserStateLoading value) loading,
    required TResult Function(_BlockUserStateSuccess value) success,
    required TResult Function(_BlockUserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BlockUserStateInitial value)? initial,
    TResult? Function(_BlockUserStateLoading value)? loading,
    TResult? Function(_BlockUserStateSuccess value)? success,
    TResult? Function(_BlockUserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BlockUserStateInitial value)? initial,
    TResult Function(_BlockUserStateLoading value)? loading,
    TResult Function(_BlockUserStateSuccess value)? success,
    TResult Function(_BlockUserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockUserStateCopyWith<$Res> {
  factory $BlockUserStateCopyWith(
          BlockUserState value, $Res Function(BlockUserState) then) =
      _$BlockUserStateCopyWithImpl<$Res, BlockUserState>;
}

/// @nodoc
class _$BlockUserStateCopyWithImpl<$Res, $Val extends BlockUserState>
    implements $BlockUserStateCopyWith<$Res> {
  _$BlockUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BlockUserStateInitialCopyWith<$Res> {
  factory _$$_BlockUserStateInitialCopyWith(_$_BlockUserStateInitial value,
          $Res Function(_$_BlockUserStateInitial) then) =
      __$$_BlockUserStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BlockUserStateInitialCopyWithImpl<$Res>
    extends _$BlockUserStateCopyWithImpl<$Res, _$_BlockUserStateInitial>
    implements _$$_BlockUserStateInitialCopyWith<$Res> {
  __$$_BlockUserStateInitialCopyWithImpl(_$_BlockUserStateInitial _value,
      $Res Function(_$_BlockUserStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BlockUserStateInitial implements _BlockUserStateInitial {
  const _$_BlockUserStateInitial();

  @override
  String toString() {
    return 'BlockUserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BlockUserStateInitial);
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
    required TResult Function(_BlockUserStateInitial value) initial,
    required TResult Function(_BlockUserStateLoading value) loading,
    required TResult Function(_BlockUserStateSuccess value) success,
    required TResult Function(_BlockUserStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BlockUserStateInitial value)? initial,
    TResult? Function(_BlockUserStateLoading value)? loading,
    TResult? Function(_BlockUserStateSuccess value)? success,
    TResult? Function(_BlockUserStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BlockUserStateInitial value)? initial,
    TResult Function(_BlockUserStateLoading value)? loading,
    TResult Function(_BlockUserStateSuccess value)? success,
    TResult Function(_BlockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _BlockUserStateInitial implements BlockUserState {
  const factory _BlockUserStateInitial() = _$_BlockUserStateInitial;
}

/// @nodoc
abstract class _$$_BlockUserStateLoadingCopyWith<$Res> {
  factory _$$_BlockUserStateLoadingCopyWith(_$_BlockUserStateLoading value,
          $Res Function(_$_BlockUserStateLoading) then) =
      __$$_BlockUserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BlockUserStateLoadingCopyWithImpl<$Res>
    extends _$BlockUserStateCopyWithImpl<$Res, _$_BlockUserStateLoading>
    implements _$$_BlockUserStateLoadingCopyWith<$Res> {
  __$$_BlockUserStateLoadingCopyWithImpl(_$_BlockUserStateLoading _value,
      $Res Function(_$_BlockUserStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BlockUserStateLoading implements _BlockUserStateLoading {
  const _$_BlockUserStateLoading();

  @override
  String toString() {
    return 'BlockUserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_BlockUserStateLoading);
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
    required TResult Function(_BlockUserStateInitial value) initial,
    required TResult Function(_BlockUserStateLoading value) loading,
    required TResult Function(_BlockUserStateSuccess value) success,
    required TResult Function(_BlockUserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BlockUserStateInitial value)? initial,
    TResult? Function(_BlockUserStateLoading value)? loading,
    TResult? Function(_BlockUserStateSuccess value)? success,
    TResult? Function(_BlockUserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BlockUserStateInitial value)? initial,
    TResult Function(_BlockUserStateLoading value)? loading,
    TResult Function(_BlockUserStateSuccess value)? success,
    TResult Function(_BlockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _BlockUserStateLoading implements BlockUserState {
  const factory _BlockUserStateLoading() = _$_BlockUserStateLoading;
}

/// @nodoc
abstract class _$$_BlockUserStateSuccessCopyWith<$Res> {
  factory _$$_BlockUserStateSuccessCopyWith(_$_BlockUserStateSuccess value,
          $Res Function(_$_BlockUserStateSuccess) then) =
      __$$_BlockUserStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_BlockUserStateSuccessCopyWithImpl<$Res>
    extends _$BlockUserStateCopyWithImpl<$Res, _$_BlockUserStateSuccess>
    implements _$$_BlockUserStateSuccessCopyWith<$Res> {
  __$$_BlockUserStateSuccessCopyWithImpl(_$_BlockUserStateSuccess _value,
      $Res Function(_$_BlockUserStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_BlockUserStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BlockUserStateSuccess implements _BlockUserStateSuccess {
  const _$_BlockUserStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'BlockUserState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockUserStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockUserStateSuccessCopyWith<_$_BlockUserStateSuccess> get copyWith =>
      __$$_BlockUserStateSuccessCopyWithImpl<_$_BlockUserStateSuccess>(
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
    required TResult Function(_BlockUserStateInitial value) initial,
    required TResult Function(_BlockUserStateLoading value) loading,
    required TResult Function(_BlockUserStateSuccess value) success,
    required TResult Function(_BlockUserStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BlockUserStateInitial value)? initial,
    TResult? Function(_BlockUserStateLoading value)? loading,
    TResult? Function(_BlockUserStateSuccess value)? success,
    TResult? Function(_BlockUserStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BlockUserStateInitial value)? initial,
    TResult Function(_BlockUserStateLoading value)? loading,
    TResult Function(_BlockUserStateSuccess value)? success,
    TResult Function(_BlockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _BlockUserStateSuccess implements BlockUserState {
  const factory _BlockUserStateSuccess(final bool result) =
      _$_BlockUserStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_BlockUserStateSuccessCopyWith<_$_BlockUserStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BlockUserStateErrorCopyWith<$Res> {
  factory _$$_BlockUserStateErrorCopyWith(_$_BlockUserStateError value,
          $Res Function(_$_BlockUserStateError) then) =
      __$$_BlockUserStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_BlockUserStateErrorCopyWithImpl<$Res>
    extends _$BlockUserStateCopyWithImpl<$Res, _$_BlockUserStateError>
    implements _$$_BlockUserStateErrorCopyWith<$Res> {
  __$$_BlockUserStateErrorCopyWithImpl(_$_BlockUserStateError _value,
      $Res Function(_$_BlockUserStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_BlockUserStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_BlockUserStateError implements _BlockUserStateError {
  const _$_BlockUserStateError(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'BlockUserState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockUserStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockUserStateErrorCopyWith<_$_BlockUserStateError> get copyWith =>
      __$$_BlockUserStateErrorCopyWithImpl<_$_BlockUserStateError>(
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
    required TResult Function(_BlockUserStateInitial value) initial,
    required TResult Function(_BlockUserStateLoading value) loading,
    required TResult Function(_BlockUserStateSuccess value) success,
    required TResult Function(_BlockUserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BlockUserStateInitial value)? initial,
    TResult? Function(_BlockUserStateLoading value)? loading,
    TResult? Function(_BlockUserStateSuccess value)? success,
    TResult? Function(_BlockUserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BlockUserStateInitial value)? initial,
    TResult Function(_BlockUserStateLoading value)? loading,
    TResult Function(_BlockUserStateSuccess value)? success,
    TResult Function(_BlockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _BlockUserStateError implements BlockUserState {
  const factory _BlockUserStateError(final PeamanError error) =
      _$_BlockUserStateError;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_BlockUserStateErrorCopyWith<_$_BlockUserStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UnblockUserState {
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
    required TResult Function(_UnblockUserStateInitial value) initial,
    required TResult Function(_UnblockUserStateLoading value) loading,
    required TResult Function(_UnblockUserStateSuccess value) success,
    required TResult Function(_UnblockUserStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnblockUserStateInitial value)? initial,
    TResult? Function(_UnblockUserStateLoading value)? loading,
    TResult? Function(_UnblockUserStateSuccess value)? success,
    TResult? Function(_UnblockUserStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnblockUserStateInitial value)? initial,
    TResult Function(_UnblockUserStateLoading value)? loading,
    TResult Function(_UnblockUserStateSuccess value)? success,
    TResult Function(_UnblockUserStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnblockUserStateCopyWith<$Res> {
  factory $UnblockUserStateCopyWith(
          UnblockUserState value, $Res Function(UnblockUserState) then) =
      _$UnblockUserStateCopyWithImpl<$Res, UnblockUserState>;
}

/// @nodoc
class _$UnblockUserStateCopyWithImpl<$Res, $Val extends UnblockUserState>
    implements $UnblockUserStateCopyWith<$Res> {
  _$UnblockUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnblockUserStateInitialCopyWith<$Res> {
  factory _$$_UnblockUserStateInitialCopyWith(_$_UnblockUserStateInitial value,
          $Res Function(_$_UnblockUserStateInitial) then) =
      __$$_UnblockUserStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnblockUserStateInitialCopyWithImpl<$Res>
    extends _$UnblockUserStateCopyWithImpl<$Res, _$_UnblockUserStateInitial>
    implements _$$_UnblockUserStateInitialCopyWith<$Res> {
  __$$_UnblockUserStateInitialCopyWithImpl(_$_UnblockUserStateInitial _value,
      $Res Function(_$_UnblockUserStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnblockUserStateInitial implements _UnblockUserStateInitial {
  const _$_UnblockUserStateInitial();

  @override
  String toString() {
    return 'UnblockUserState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnblockUserStateInitial);
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
    required TResult Function(_UnblockUserStateInitial value) initial,
    required TResult Function(_UnblockUserStateLoading value) loading,
    required TResult Function(_UnblockUserStateSuccess value) success,
    required TResult Function(_UnblockUserStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnblockUserStateInitial value)? initial,
    TResult? Function(_UnblockUserStateLoading value)? loading,
    TResult? Function(_UnblockUserStateSuccess value)? success,
    TResult? Function(_UnblockUserStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnblockUserStateInitial value)? initial,
    TResult Function(_UnblockUserStateLoading value)? loading,
    TResult Function(_UnblockUserStateSuccess value)? success,
    TResult Function(_UnblockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UnblockUserStateInitial implements UnblockUserState {
  const factory _UnblockUserStateInitial() = _$_UnblockUserStateInitial;
}

/// @nodoc
abstract class _$$_UnblockUserStateLoadingCopyWith<$Res> {
  factory _$$_UnblockUserStateLoadingCopyWith(_$_UnblockUserStateLoading value,
          $Res Function(_$_UnblockUserStateLoading) then) =
      __$$_UnblockUserStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnblockUserStateLoadingCopyWithImpl<$Res>
    extends _$UnblockUserStateCopyWithImpl<$Res, _$_UnblockUserStateLoading>
    implements _$$_UnblockUserStateLoadingCopyWith<$Res> {
  __$$_UnblockUserStateLoadingCopyWithImpl(_$_UnblockUserStateLoading _value,
      $Res Function(_$_UnblockUserStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnblockUserStateLoading implements _UnblockUserStateLoading {
  const _$_UnblockUserStateLoading();

  @override
  String toString() {
    return 'UnblockUserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnblockUserStateLoading);
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
    required TResult Function(_UnblockUserStateInitial value) initial,
    required TResult Function(_UnblockUserStateLoading value) loading,
    required TResult Function(_UnblockUserStateSuccess value) success,
    required TResult Function(_UnblockUserStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnblockUserStateInitial value)? initial,
    TResult? Function(_UnblockUserStateLoading value)? loading,
    TResult? Function(_UnblockUserStateSuccess value)? success,
    TResult? Function(_UnblockUserStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnblockUserStateInitial value)? initial,
    TResult Function(_UnblockUserStateLoading value)? loading,
    TResult Function(_UnblockUserStateSuccess value)? success,
    TResult Function(_UnblockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UnblockUserStateLoading implements UnblockUserState {
  const factory _UnblockUserStateLoading() = _$_UnblockUserStateLoading;
}

/// @nodoc
abstract class _$$_UnblockUserStateSuccessCopyWith<$Res> {
  factory _$$_UnblockUserStateSuccessCopyWith(_$_UnblockUserStateSuccess value,
          $Res Function(_$_UnblockUserStateSuccess) then) =
      __$$_UnblockUserStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_UnblockUserStateSuccessCopyWithImpl<$Res>
    extends _$UnblockUserStateCopyWithImpl<$Res, _$_UnblockUserStateSuccess>
    implements _$$_UnblockUserStateSuccessCopyWith<$Res> {
  __$$_UnblockUserStateSuccessCopyWithImpl(_$_UnblockUserStateSuccess _value,
      $Res Function(_$_UnblockUserStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_UnblockUserStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UnblockUserStateSuccess implements _UnblockUserStateSuccess {
  const _$_UnblockUserStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'UnblockUserState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnblockUserStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnblockUserStateSuccessCopyWith<_$_UnblockUserStateSuccess>
      get copyWith =>
          __$$_UnblockUserStateSuccessCopyWithImpl<_$_UnblockUserStateSuccess>(
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
    required TResult Function(_UnblockUserStateInitial value) initial,
    required TResult Function(_UnblockUserStateLoading value) loading,
    required TResult Function(_UnblockUserStateSuccess value) success,
    required TResult Function(_UnblockUserStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnblockUserStateInitial value)? initial,
    TResult? Function(_UnblockUserStateLoading value)? loading,
    TResult? Function(_UnblockUserStateSuccess value)? success,
    TResult? Function(_UnblockUserStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnblockUserStateInitial value)? initial,
    TResult Function(_UnblockUserStateLoading value)? loading,
    TResult Function(_UnblockUserStateSuccess value)? success,
    TResult Function(_UnblockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _UnblockUserStateSuccess implements UnblockUserState {
  const factory _UnblockUserStateSuccess(final bool result) =
      _$_UnblockUserStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_UnblockUserStateSuccessCopyWith<_$_UnblockUserStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnblockUserStateErrorCopyWith<$Res> {
  factory _$$_UnblockUserStateErrorCopyWith(_$_UnblockUserStateError value,
          $Res Function(_$_UnblockUserStateError) then) =
      __$$_UnblockUserStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_UnblockUserStateErrorCopyWithImpl<$Res>
    extends _$UnblockUserStateCopyWithImpl<$Res, _$_UnblockUserStateError>
    implements _$$_UnblockUserStateErrorCopyWith<$Res> {
  __$$_UnblockUserStateErrorCopyWithImpl(_$_UnblockUserStateError _value,
      $Res Function(_$_UnblockUserStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UnblockUserStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_UnblockUserStateError implements _UnblockUserStateError {
  const _$_UnblockUserStateError(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'UnblockUserState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnblockUserStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnblockUserStateErrorCopyWith<_$_UnblockUserStateError> get copyWith =>
      __$$_UnblockUserStateErrorCopyWithImpl<_$_UnblockUserStateError>(
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
    required TResult Function(_UnblockUserStateInitial value) initial,
    required TResult Function(_UnblockUserStateLoading value) loading,
    required TResult Function(_UnblockUserStateSuccess value) success,
    required TResult Function(_UnblockUserStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnblockUserStateInitial value)? initial,
    TResult? Function(_UnblockUserStateLoading value)? loading,
    TResult? Function(_UnblockUserStateSuccess value)? success,
    TResult? Function(_UnblockUserStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnblockUserStateInitial value)? initial,
    TResult Function(_UnblockUserStateLoading value)? loading,
    TResult Function(_UnblockUserStateSuccess value)? success,
    TResult Function(_UnblockUserStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UnblockUserStateError implements UnblockUserState {
  const factory _UnblockUserStateError(final PeamanError error) =
      _$_UnblockUserStateError;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_UnblockUserStateErrorCopyWith<_$_UnblockUserStateError> get copyWith =>
      throw _privateConstructorUsedError;
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
