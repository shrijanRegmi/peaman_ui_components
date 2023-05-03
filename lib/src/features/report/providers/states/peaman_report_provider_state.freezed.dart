// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_report_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanReportProviderState {
  SubmitReportState get submitReportState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanReportProviderStateCopyWith<PeamanReportProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanReportProviderStateCopyWith<$Res> {
  factory $PeamanReportProviderStateCopyWith(PeamanReportProviderState value,
          $Res Function(PeamanReportProviderState) then) =
      _$PeamanReportProviderStateCopyWithImpl<$Res, PeamanReportProviderState>;
  @useResult
  $Res call({SubmitReportState submitReportState});

  $SubmitReportStateCopyWith<$Res> get submitReportState;
}

/// @nodoc
class _$PeamanReportProviderStateCopyWithImpl<$Res,
        $Val extends PeamanReportProviderState>
    implements $PeamanReportProviderStateCopyWith<$Res> {
  _$PeamanReportProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitReportState = null,
  }) {
    return _then(_value.copyWith(
      submitReportState: null == submitReportState
          ? _value.submitReportState
          : submitReportState // ignore: cast_nullable_to_non_nullable
              as SubmitReportState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitReportStateCopyWith<$Res> get submitReportState {
    return $SubmitReportStateCopyWith<$Res>(_value.submitReportState, (value) {
      return _then(_value.copyWith(submitReportState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PeamanReportProviderStateCopyWith<$Res>
    implements $PeamanReportProviderStateCopyWith<$Res> {
  factory _$$_PeamanReportProviderStateCopyWith(
          _$_PeamanReportProviderState value,
          $Res Function(_$_PeamanReportProviderState) then) =
      __$$_PeamanReportProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SubmitReportState submitReportState});

  @override
  $SubmitReportStateCopyWith<$Res> get submitReportState;
}

/// @nodoc
class __$$_PeamanReportProviderStateCopyWithImpl<$Res>
    extends _$PeamanReportProviderStateCopyWithImpl<$Res,
        _$_PeamanReportProviderState>
    implements _$$_PeamanReportProviderStateCopyWith<$Res> {
  __$$_PeamanReportProviderStateCopyWithImpl(
      _$_PeamanReportProviderState _value,
      $Res Function(_$_PeamanReportProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submitReportState = null,
  }) {
    return _then(_$_PeamanReportProviderState(
      submitReportState: null == submitReportState
          ? _value.submitReportState
          : submitReportState // ignore: cast_nullable_to_non_nullable
              as SubmitReportState,
    ));
  }
}

/// @nodoc

class _$_PeamanReportProviderState implements _PeamanReportProviderState {
  const _$_PeamanReportProviderState(
      {this.submitReportState = const SubmitReportState.initial()});

  @override
  @JsonKey()
  final SubmitReportState submitReportState;

  @override
  String toString() {
    return 'PeamanReportProviderState(submitReportState: $submitReportState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanReportProviderState &&
            (identical(other.submitReportState, submitReportState) ||
                other.submitReportState == submitReportState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, submitReportState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanReportProviderStateCopyWith<_$_PeamanReportProviderState>
      get copyWith => __$$_PeamanReportProviderStateCopyWithImpl<
          _$_PeamanReportProviderState>(this, _$identity);
}

abstract class _PeamanReportProviderState implements PeamanReportProviderState {
  const factory _PeamanReportProviderState(
          {final SubmitReportState submitReportState}) =
      _$_PeamanReportProviderState;

  @override
  SubmitReportState get submitReportState;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanReportProviderStateCopyWith<_$_PeamanReportProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubmitReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanReport result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanReport result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanReport result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmitReportStateInitial value) initial,
    required TResult Function(_SubmitReportStateLoading value) loading,
    required TResult Function(_SubmitReportStateSuccess value) success,
    required TResult Function(_SubmitReportStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitReportStateInitial value)? initial,
    TResult? Function(_SubmitReportStateLoading value)? loading,
    TResult? Function(_SubmitReportStateSuccess value)? success,
    TResult? Function(_SubmitReportStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitReportStateInitial value)? initial,
    TResult Function(_SubmitReportStateLoading value)? loading,
    TResult Function(_SubmitReportStateSuccess value)? success,
    TResult Function(_SubmitReportStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReportStateCopyWith<$Res> {
  factory $SubmitReportStateCopyWith(
          SubmitReportState value, $Res Function(SubmitReportState) then) =
      _$SubmitReportStateCopyWithImpl<$Res, SubmitReportState>;
}

/// @nodoc
class _$SubmitReportStateCopyWithImpl<$Res, $Val extends SubmitReportState>
    implements $SubmitReportStateCopyWith<$Res> {
  _$SubmitReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SubmitReportStateInitialCopyWith<$Res> {
  factory _$$_SubmitReportStateInitialCopyWith(
          _$_SubmitReportStateInitial value,
          $Res Function(_$_SubmitReportStateInitial) then) =
      __$$_SubmitReportStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmitReportStateInitialCopyWithImpl<$Res>
    extends _$SubmitReportStateCopyWithImpl<$Res, _$_SubmitReportStateInitial>
    implements _$$_SubmitReportStateInitialCopyWith<$Res> {
  __$$_SubmitReportStateInitialCopyWithImpl(_$_SubmitReportStateInitial _value,
      $Res Function(_$_SubmitReportStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SubmitReportStateInitial implements _SubmitReportStateInitial {
  const _$_SubmitReportStateInitial();

  @override
  String toString() {
    return 'SubmitReportState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReportStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanReport result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanReport result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanReport result)? success,
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
    required TResult Function(_SubmitReportStateInitial value) initial,
    required TResult Function(_SubmitReportStateLoading value) loading,
    required TResult Function(_SubmitReportStateSuccess value) success,
    required TResult Function(_SubmitReportStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitReportStateInitial value)? initial,
    TResult? Function(_SubmitReportStateLoading value)? loading,
    TResult? Function(_SubmitReportStateSuccess value)? success,
    TResult? Function(_SubmitReportStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitReportStateInitial value)? initial,
    TResult Function(_SubmitReportStateLoading value)? loading,
    TResult Function(_SubmitReportStateSuccess value)? success,
    TResult Function(_SubmitReportStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportStateInitial implements SubmitReportState {
  const factory _SubmitReportStateInitial() = _$_SubmitReportStateInitial;
}

/// @nodoc
abstract class _$$_SubmitReportStateLoadingCopyWith<$Res> {
  factory _$$_SubmitReportStateLoadingCopyWith(
          _$_SubmitReportStateLoading value,
          $Res Function(_$_SubmitReportStateLoading) then) =
      __$$_SubmitReportStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SubmitReportStateLoadingCopyWithImpl<$Res>
    extends _$SubmitReportStateCopyWithImpl<$Res, _$_SubmitReportStateLoading>
    implements _$$_SubmitReportStateLoadingCopyWith<$Res> {
  __$$_SubmitReportStateLoadingCopyWithImpl(_$_SubmitReportStateLoading _value,
      $Res Function(_$_SubmitReportStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SubmitReportStateLoading implements _SubmitReportStateLoading {
  const _$_SubmitReportStateLoading();

  @override
  String toString() {
    return 'SubmitReportState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReportStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanReport result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanReport result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanReport result)? success,
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
    required TResult Function(_SubmitReportStateInitial value) initial,
    required TResult Function(_SubmitReportStateLoading value) loading,
    required TResult Function(_SubmitReportStateSuccess value) success,
    required TResult Function(_SubmitReportStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitReportStateInitial value)? initial,
    TResult? Function(_SubmitReportStateLoading value)? loading,
    TResult? Function(_SubmitReportStateSuccess value)? success,
    TResult? Function(_SubmitReportStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitReportStateInitial value)? initial,
    TResult Function(_SubmitReportStateLoading value)? loading,
    TResult Function(_SubmitReportStateSuccess value)? success,
    TResult Function(_SubmitReportStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportStateLoading implements SubmitReportState {
  const factory _SubmitReportStateLoading() = _$_SubmitReportStateLoading;
}

/// @nodoc
abstract class _$$_SubmitReportStateSuccessCopyWith<$Res> {
  factory _$$_SubmitReportStateSuccessCopyWith(
          _$_SubmitReportStateSuccess value,
          $Res Function(_$_SubmitReportStateSuccess) then) =
      __$$_SubmitReportStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanReport result});

  $PeamanReportCopyWith<$Res> get result;
}

/// @nodoc
class __$$_SubmitReportStateSuccessCopyWithImpl<$Res>
    extends _$SubmitReportStateCopyWithImpl<$Res, _$_SubmitReportStateSuccess>
    implements _$$_SubmitReportStateSuccessCopyWith<$Res> {
  __$$_SubmitReportStateSuccessCopyWithImpl(_$_SubmitReportStateSuccess _value,
      $Res Function(_$_SubmitReportStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SubmitReportStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PeamanReport,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanReportCopyWith<$Res> get result {
    return $PeamanReportCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$_SubmitReportStateSuccess implements _SubmitReportStateSuccess {
  const _$_SubmitReportStateSuccess(this.result);

  @override
  final PeamanReport result;

  @override
  String toString() {
    return 'SubmitReportState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReportStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitReportStateSuccessCopyWith<_$_SubmitReportStateSuccess>
      get copyWith => __$$_SubmitReportStateSuccessCopyWithImpl<
          _$_SubmitReportStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanReport result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanReport result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanReport result)? success,
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
    required TResult Function(_SubmitReportStateInitial value) initial,
    required TResult Function(_SubmitReportStateLoading value) loading,
    required TResult Function(_SubmitReportStateSuccess value) success,
    required TResult Function(_SubmitReportStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitReportStateInitial value)? initial,
    TResult? Function(_SubmitReportStateLoading value)? loading,
    TResult? Function(_SubmitReportStateSuccess value)? success,
    TResult? Function(_SubmitReportStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitReportStateInitial value)? initial,
    TResult Function(_SubmitReportStateLoading value)? loading,
    TResult Function(_SubmitReportStateSuccess value)? success,
    TResult Function(_SubmitReportStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportStateSuccess implements SubmitReportState {
  const factory _SubmitReportStateSuccess(final PeamanReport result) =
      _$_SubmitReportStateSuccess;

  PeamanReport get result;
  @JsonKey(ignore: true)
  _$$_SubmitReportStateSuccessCopyWith<_$_SubmitReportStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitReportStateErrorCopyWith<$Res> {
  factory _$$_SubmitReportStateErrorCopyWith(_$_SubmitReportStateError value,
          $Res Function(_$_SubmitReportStateError) then) =
      __$$_SubmitReportStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SubmitReportStateErrorCopyWithImpl<$Res>
    extends _$SubmitReportStateCopyWithImpl<$Res, _$_SubmitReportStateError>
    implements _$$_SubmitReportStateErrorCopyWith<$Res> {
  __$$_SubmitReportStateErrorCopyWithImpl(_$_SubmitReportStateError _value,
      $Res Function(_$_SubmitReportStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SubmitReportStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanErrorCopyWith<$Res> get error {
    return $PeamanErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$_SubmitReportStateError implements _SubmitReportStateError {
  const _$_SubmitReportStateError(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SubmitReportState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReportStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitReportStateErrorCopyWith<_$_SubmitReportStateError> get copyWith =>
      __$$_SubmitReportStateErrorCopyWithImpl<_$_SubmitReportStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanReport result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanReport result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanReport result)? success,
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
    required TResult Function(_SubmitReportStateInitial value) initial,
    required TResult Function(_SubmitReportStateLoading value) loading,
    required TResult Function(_SubmitReportStateSuccess value) success,
    required TResult Function(_SubmitReportStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitReportStateInitial value)? initial,
    TResult? Function(_SubmitReportStateLoading value)? loading,
    TResult? Function(_SubmitReportStateSuccess value)? success,
    TResult? Function(_SubmitReportStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitReportStateInitial value)? initial,
    TResult Function(_SubmitReportStateLoading value)? loading,
    TResult Function(_SubmitReportStateSuccess value)? success,
    TResult Function(_SubmitReportStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SubmitReportStateError implements SubmitReportState {
  const factory _SubmitReportStateError(final PeamanError error) =
      _$_SubmitReportStateError;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SubmitReportStateErrorCopyWith<_$_SubmitReportStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
