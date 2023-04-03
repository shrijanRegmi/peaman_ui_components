// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_auth_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanAuthProviderState {
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;
  TextEditingController get confirmPasswordController =>
      throw _privateConstructorUsedError;
  SignInWithEmailPasswordState get signInWithEmailPasswordState =>
      throw _privateConstructorUsedError;
  SignUpWithEmailPasswordState get signUpWithEmailPasswordState =>
      throw _privateConstructorUsedError;
  SignInWithGoogleState get signInWithGoogleState =>
      throw _privateConstructorUsedError;
  SignInWithFacebookState get signInWithFacebookState =>
      throw _privateConstructorUsedError;
  SignOutState get signOutState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanAuthProviderStateCopyWith<PeamanAuthProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanAuthProviderStateCopyWith<$Res> {
  factory $PeamanAuthProviderStateCopyWith(PeamanAuthProviderState value,
          $Res Function(PeamanAuthProviderState) then) =
      _$PeamanAuthProviderStateCopyWithImpl<$Res, PeamanAuthProviderState>;
  @useResult
  $Res call(
      {TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController,
      SignInWithEmailPasswordState signInWithEmailPasswordState,
      SignUpWithEmailPasswordState signUpWithEmailPasswordState,
      SignInWithGoogleState signInWithGoogleState,
      SignInWithFacebookState signInWithFacebookState,
      SignOutState signOutState});

  $SignInWithEmailPasswordStateCopyWith<$Res> get signInWithEmailPasswordState;
  $SignUpWithEmailPasswordStateCopyWith<$Res> get signUpWithEmailPasswordState;
  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState;
  $SignInWithFacebookStateCopyWith<$Res> get signInWithFacebookState;
  $SignOutStateCopyWith<$Res> get signOutState;
}

/// @nodoc
class _$PeamanAuthProviderStateCopyWithImpl<$Res,
        $Val extends PeamanAuthProviderState>
    implements $PeamanAuthProviderStateCopyWith<$Res> {
  _$PeamanAuthProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailController = null,
    Object? passwordController = null,
    Object? confirmPasswordController = null,
    Object? signInWithEmailPasswordState = null,
    Object? signUpWithEmailPasswordState = null,
    Object? signInWithGoogleState = null,
    Object? signInWithFacebookState = null,
    Object? signOutState = null,
  }) {
    return _then(_value.copyWith(
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: null == passwordController
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      confirmPasswordController: null == confirmPasswordController
          ? _value.confirmPasswordController
          : confirmPasswordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      signInWithEmailPasswordState: null == signInWithEmailPasswordState
          ? _value.signInWithEmailPasswordState
          : signInWithEmailPasswordState // ignore: cast_nullable_to_non_nullable
              as SignInWithEmailPasswordState,
      signUpWithEmailPasswordState: null == signUpWithEmailPasswordState
          ? _value.signUpWithEmailPasswordState
          : signUpWithEmailPasswordState // ignore: cast_nullable_to_non_nullable
              as SignUpWithEmailPasswordState,
      signInWithGoogleState: null == signInWithGoogleState
          ? _value.signInWithGoogleState
          : signInWithGoogleState // ignore: cast_nullable_to_non_nullable
              as SignInWithGoogleState,
      signInWithFacebookState: null == signInWithFacebookState
          ? _value.signInWithFacebookState
          : signInWithFacebookState // ignore: cast_nullable_to_non_nullable
              as SignInWithFacebookState,
      signOutState: null == signOutState
          ? _value.signOutState
          : signOutState // ignore: cast_nullable_to_non_nullable
              as SignOutState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignInWithEmailPasswordStateCopyWith<$Res> get signInWithEmailPasswordState {
    return $SignInWithEmailPasswordStateCopyWith<$Res>(
        _value.signInWithEmailPasswordState, (value) {
      return _then(
          _value.copyWith(signInWithEmailPasswordState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpWithEmailPasswordStateCopyWith<$Res> get signUpWithEmailPasswordState {
    return $SignUpWithEmailPasswordStateCopyWith<$Res>(
        _value.signUpWithEmailPasswordState, (value) {
      return _then(
          _value.copyWith(signUpWithEmailPasswordState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState {
    return $SignInWithGoogleStateCopyWith<$Res>(_value.signInWithGoogleState,
        (value) {
      return _then(_value.copyWith(signInWithGoogleState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SignInWithFacebookStateCopyWith<$Res> get signInWithFacebookState {
    return $SignInWithFacebookStateCopyWith<$Res>(
        _value.signInWithFacebookState, (value) {
      return _then(_value.copyWith(signInWithFacebookState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SignOutStateCopyWith<$Res> get signOutState {
    return $SignOutStateCopyWith<$Res>(_value.signOutState, (value) {
      return _then(_value.copyWith(signOutState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PeamanAuthProviderStateCopyWith<$Res>
    implements $PeamanAuthProviderStateCopyWith<$Res> {
  factory _$$_PeamanAuthProviderStateCopyWith(_$_PeamanAuthProviderState value,
          $Res Function(_$_PeamanAuthProviderState) then) =
      __$$_PeamanAuthProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController,
      SignInWithEmailPasswordState signInWithEmailPasswordState,
      SignUpWithEmailPasswordState signUpWithEmailPasswordState,
      SignInWithGoogleState signInWithGoogleState,
      SignInWithFacebookState signInWithFacebookState,
      SignOutState signOutState});

  @override
  $SignInWithEmailPasswordStateCopyWith<$Res> get signInWithEmailPasswordState;
  @override
  $SignUpWithEmailPasswordStateCopyWith<$Res> get signUpWithEmailPasswordState;
  @override
  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState;
  @override
  $SignInWithFacebookStateCopyWith<$Res> get signInWithFacebookState;
  @override
  $SignOutStateCopyWith<$Res> get signOutState;
}

/// @nodoc
class __$$_PeamanAuthProviderStateCopyWithImpl<$Res>
    extends _$PeamanAuthProviderStateCopyWithImpl<$Res,
        _$_PeamanAuthProviderState>
    implements _$$_PeamanAuthProviderStateCopyWith<$Res> {
  __$$_PeamanAuthProviderStateCopyWithImpl(_$_PeamanAuthProviderState _value,
      $Res Function(_$_PeamanAuthProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailController = null,
    Object? passwordController = null,
    Object? confirmPasswordController = null,
    Object? signInWithEmailPasswordState = null,
    Object? signUpWithEmailPasswordState = null,
    Object? signInWithGoogleState = null,
    Object? signInWithFacebookState = null,
    Object? signOutState = null,
  }) {
    return _then(_$_PeamanAuthProviderState(
      emailController: null == emailController
          ? _value.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: null == passwordController
          ? _value.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      confirmPasswordController: null == confirmPasswordController
          ? _value.confirmPasswordController
          : confirmPasswordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      signInWithEmailPasswordState: null == signInWithEmailPasswordState
          ? _value.signInWithEmailPasswordState
          : signInWithEmailPasswordState // ignore: cast_nullable_to_non_nullable
              as SignInWithEmailPasswordState,
      signUpWithEmailPasswordState: null == signUpWithEmailPasswordState
          ? _value.signUpWithEmailPasswordState
          : signUpWithEmailPasswordState // ignore: cast_nullable_to_non_nullable
              as SignUpWithEmailPasswordState,
      signInWithGoogleState: null == signInWithGoogleState
          ? _value.signInWithGoogleState
          : signInWithGoogleState // ignore: cast_nullable_to_non_nullable
              as SignInWithGoogleState,
      signInWithFacebookState: null == signInWithFacebookState
          ? _value.signInWithFacebookState
          : signInWithFacebookState // ignore: cast_nullable_to_non_nullable
              as SignInWithFacebookState,
      signOutState: null == signOutState
          ? _value.signOutState
          : signOutState // ignore: cast_nullable_to_non_nullable
              as SignOutState,
    ));
  }
}

/// @nodoc

class _$_PeamanAuthProviderState implements _PeamanAuthProviderState {
  const _$_PeamanAuthProviderState(
      {required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      this.signInWithEmailPasswordState =
          const SignInWithEmailPasswordState.initial(),
      this.signUpWithEmailPasswordState =
          const SignUpWithEmailPasswordState.initial(),
      this.signInWithGoogleState = const SignInWithGoogleState.initial(),
      this.signInWithFacebookState = const SignInWithFacebookState.initial(),
      this.signOutState = const SignOutState.initial()});

  @override
  final TextEditingController emailController;
  @override
  final TextEditingController passwordController;
  @override
  final TextEditingController confirmPasswordController;
  @override
  @JsonKey()
  final SignInWithEmailPasswordState signInWithEmailPasswordState;
  @override
  @JsonKey()
  final SignUpWithEmailPasswordState signUpWithEmailPasswordState;
  @override
  @JsonKey()
  final SignInWithGoogleState signInWithGoogleState;
  @override
  @JsonKey()
  final SignInWithFacebookState signInWithFacebookState;
  @override
  @JsonKey()
  final SignOutState signOutState;

  @override
  String toString() {
    return 'PeamanAuthProviderState(emailController: $emailController, passwordController: $passwordController, confirmPasswordController: $confirmPasswordController, signInWithEmailPasswordState: $signInWithEmailPasswordState, signUpWithEmailPasswordState: $signUpWithEmailPasswordState, signInWithGoogleState: $signInWithGoogleState, signInWithFacebookState: $signInWithFacebookState, signOutState: $signOutState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanAuthProviderState &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.confirmPasswordController,
                    confirmPasswordController) ||
                other.confirmPasswordController == confirmPasswordController) &&
            (identical(other.signInWithEmailPasswordState,
                    signInWithEmailPasswordState) ||
                other.signInWithEmailPasswordState ==
                    signInWithEmailPasswordState) &&
            (identical(other.signUpWithEmailPasswordState,
                    signUpWithEmailPasswordState) ||
                other.signUpWithEmailPasswordState ==
                    signUpWithEmailPasswordState) &&
            (identical(other.signInWithGoogleState, signInWithGoogleState) ||
                other.signInWithGoogleState == signInWithGoogleState) &&
            (identical(
                    other.signInWithFacebookState, signInWithFacebookState) ||
                other.signInWithFacebookState == signInWithFacebookState) &&
            (identical(other.signOutState, signOutState) ||
                other.signOutState == signOutState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailController,
      passwordController,
      confirmPasswordController,
      signInWithEmailPasswordState,
      signUpWithEmailPasswordState,
      signInWithGoogleState,
      signInWithFacebookState,
      signOutState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanAuthProviderStateCopyWith<_$_PeamanAuthProviderState>
      get copyWith =>
          __$$_PeamanAuthProviderStateCopyWithImpl<_$_PeamanAuthProviderState>(
              this, _$identity);
}

abstract class _PeamanAuthProviderState implements PeamanAuthProviderState {
  const factory _PeamanAuthProviderState(
      {required final TextEditingController emailController,
      required final TextEditingController passwordController,
      required final TextEditingController confirmPasswordController,
      final SignInWithEmailPasswordState signInWithEmailPasswordState,
      final SignUpWithEmailPasswordState signUpWithEmailPasswordState,
      final SignInWithGoogleState signInWithGoogleState,
      final SignInWithFacebookState signInWithFacebookState,
      final SignOutState signOutState}) = _$_PeamanAuthProviderState;

  @override
  TextEditingController get emailController;
  @override
  TextEditingController get passwordController;
  @override
  TextEditingController get confirmPasswordController;
  @override
  SignInWithEmailPasswordState get signInWithEmailPasswordState;
  @override
  SignUpWithEmailPasswordState get signUpWithEmailPasswordState;
  @override
  SignInWithGoogleState get signInWithGoogleState;
  @override
  SignInWithFacebookState get signInWithFacebookState;
  @override
  SignOutState get signOutState;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanAuthProviderStateCopyWith<_$_PeamanAuthProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInWithEmailPasswordState {
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
    required TResult Function(_SignInWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignInWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignInWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignInWithEmailPasswordStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignInWithEmailPasswordStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignInWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithEmailPasswordStateCopyWith<$Res> {
  factory $SignInWithEmailPasswordStateCopyWith(
          SignInWithEmailPasswordState value,
          $Res Function(SignInWithEmailPasswordState) then) =
      _$SignInWithEmailPasswordStateCopyWithImpl<$Res,
          SignInWithEmailPasswordState>;
}

/// @nodoc
class _$SignInWithEmailPasswordStateCopyWithImpl<$Res,
        $Val extends SignInWithEmailPasswordState>
    implements $SignInWithEmailPasswordStateCopyWith<$Res> {
  _$SignInWithEmailPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignInWithEmailPasswordStateInitialCopyWith<$Res> {
  factory _$$_SignInWithEmailPasswordStateInitialCopyWith(
          _$_SignInWithEmailPasswordStateInitial value,
          $Res Function(_$_SignInWithEmailPasswordStateInitial) then) =
      __$$_SignInWithEmailPasswordStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithEmailPasswordStateInitialCopyWithImpl<$Res>
    extends _$SignInWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignInWithEmailPasswordStateInitial>
    implements _$$_SignInWithEmailPasswordStateInitialCopyWith<$Res> {
  __$$_SignInWithEmailPasswordStateInitialCopyWithImpl(
      _$_SignInWithEmailPasswordStateInitial _value,
      $Res Function(_$_SignInWithEmailPasswordStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithEmailPasswordStateInitial
    implements _SignInWithEmailPasswordStateInitial {
  const _$_SignInWithEmailPasswordStateInitial();

  @override
  String toString() {
    return 'SignInWithEmailPasswordState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmailPasswordStateInitial);
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
    required TResult Function(_SignInWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignInWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignInWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignInWithEmailPasswordStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignInWithEmailPasswordStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignInWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailPasswordStateInitial
    implements SignInWithEmailPasswordState {
  const factory _SignInWithEmailPasswordStateInitial() =
      _$_SignInWithEmailPasswordStateInitial;
}

/// @nodoc
abstract class _$$_SignInWithEmailPasswordStateLoadingCopyWith<$Res> {
  factory _$$_SignInWithEmailPasswordStateLoadingCopyWith(
          _$_SignInWithEmailPasswordStateLoading value,
          $Res Function(_$_SignInWithEmailPasswordStateLoading) then) =
      __$$_SignInWithEmailPasswordStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithEmailPasswordStateLoadingCopyWithImpl<$Res>
    extends _$SignInWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignInWithEmailPasswordStateLoading>
    implements _$$_SignInWithEmailPasswordStateLoadingCopyWith<$Res> {
  __$$_SignInWithEmailPasswordStateLoadingCopyWithImpl(
      _$_SignInWithEmailPasswordStateLoading _value,
      $Res Function(_$_SignInWithEmailPasswordStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithEmailPasswordStateLoading
    implements _SignInWithEmailPasswordStateLoading {
  const _$_SignInWithEmailPasswordStateLoading();

  @override
  String toString() {
    return 'SignInWithEmailPasswordState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmailPasswordStateLoading);
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
    required TResult Function(_SignInWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignInWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignInWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignInWithEmailPasswordStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignInWithEmailPasswordStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignInWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailPasswordStateLoading
    implements SignInWithEmailPasswordState {
  const factory _SignInWithEmailPasswordStateLoading() =
      _$_SignInWithEmailPasswordStateLoading;
}

/// @nodoc
abstract class _$$_SignInWithEmailPasswordStateSuccessCopyWith<$Res> {
  factory _$$_SignInWithEmailPasswordStateSuccessCopyWith(
          _$_SignInWithEmailPasswordStateSuccess value,
          $Res Function(_$_SignInWithEmailPasswordStateSuccess) then) =
      __$$_SignInWithEmailPasswordStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_SignInWithEmailPasswordStateSuccessCopyWithImpl<$Res>
    extends _$SignInWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignInWithEmailPasswordStateSuccess>
    implements _$$_SignInWithEmailPasswordStateSuccessCopyWith<$Res> {
  __$$_SignInWithEmailPasswordStateSuccessCopyWithImpl(
      _$_SignInWithEmailPasswordStateSuccess _value,
      $Res Function(_$_SignInWithEmailPasswordStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SignInWithEmailPasswordStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInWithEmailPasswordStateSuccess
    implements _SignInWithEmailPasswordStateSuccess {
  const _$_SignInWithEmailPasswordStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'SignInWithEmailPasswordState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmailPasswordStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithEmailPasswordStateSuccessCopyWith<
          _$_SignInWithEmailPasswordStateSuccess>
      get copyWith => __$$_SignInWithEmailPasswordStateSuccessCopyWithImpl<
          _$_SignInWithEmailPasswordStateSuccess>(this, _$identity);

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
    required TResult Function(_SignInWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignInWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignInWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignInWithEmailPasswordStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignInWithEmailPasswordStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignInWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailPasswordStateSuccess
    implements SignInWithEmailPasswordState {
  const factory _SignInWithEmailPasswordStateSuccess(final bool result) =
      _$_SignInWithEmailPasswordStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_SignInWithEmailPasswordStateSuccessCopyWith<
          _$_SignInWithEmailPasswordStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInWithEmailPasswordStateFailureCopyWith<$Res> {
  factory _$$_SignInWithEmailPasswordStateFailureCopyWith(
          _$_SignInWithEmailPasswordStateFailure value,
          $Res Function(_$_SignInWithEmailPasswordStateFailure) then) =
      __$$_SignInWithEmailPasswordStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SignInWithEmailPasswordStateFailureCopyWithImpl<$Res>
    extends _$SignInWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignInWithEmailPasswordStateFailure>
    implements _$$_SignInWithEmailPasswordStateFailureCopyWith<$Res> {
  __$$_SignInWithEmailPasswordStateFailureCopyWithImpl(
      _$_SignInWithEmailPasswordStateFailure _value,
      $Res Function(_$_SignInWithEmailPasswordStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SignInWithEmailPasswordStateFailure(
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

class _$_SignInWithEmailPasswordStateFailure
    implements _SignInWithEmailPasswordStateFailure {
  const _$_SignInWithEmailPasswordStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SignInWithEmailPasswordState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmailPasswordStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithEmailPasswordStateFailureCopyWith<
          _$_SignInWithEmailPasswordStateFailure>
      get copyWith => __$$_SignInWithEmailPasswordStateFailureCopyWithImpl<
          _$_SignInWithEmailPasswordStateFailure>(this, _$identity);

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
    required TResult Function(_SignInWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignInWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignInWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignInWithEmailPasswordStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignInWithEmailPasswordStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignInWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignInWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignInWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailPasswordStateFailure
    implements SignInWithEmailPasswordState {
  const factory _SignInWithEmailPasswordStateFailure(final PeamanError error) =
      _$_SignInWithEmailPasswordStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SignInWithEmailPasswordStateFailureCopyWith<
          _$_SignInWithEmailPasswordStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpWithEmailPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignUpWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignUpWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignUpWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignUpWithEmailPasswordStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignUpWithEmailPasswordStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignUpWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpWithEmailPasswordStateCopyWith<$Res> {
  factory $SignUpWithEmailPasswordStateCopyWith(
          SignUpWithEmailPasswordState value,
          $Res Function(SignUpWithEmailPasswordState) then) =
      _$SignUpWithEmailPasswordStateCopyWithImpl<$Res,
          SignUpWithEmailPasswordState>;
}

/// @nodoc
class _$SignUpWithEmailPasswordStateCopyWithImpl<$Res,
        $Val extends SignUpWithEmailPasswordState>
    implements $SignUpWithEmailPasswordStateCopyWith<$Res> {
  _$SignUpWithEmailPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignUpWithEmailPasswordStateInitialCopyWith<$Res> {
  factory _$$_SignUpWithEmailPasswordStateInitialCopyWith(
          _$_SignUpWithEmailPasswordStateInitial value,
          $Res Function(_$_SignUpWithEmailPasswordStateInitial) then) =
      __$$_SignUpWithEmailPasswordStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpWithEmailPasswordStateInitialCopyWithImpl<$Res>
    extends _$SignUpWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignUpWithEmailPasswordStateInitial>
    implements _$$_SignUpWithEmailPasswordStateInitialCopyWith<$Res> {
  __$$_SignUpWithEmailPasswordStateInitialCopyWithImpl(
      _$_SignUpWithEmailPasswordStateInitial _value,
      $Res Function(_$_SignUpWithEmailPasswordStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUpWithEmailPasswordStateInitial
    implements _SignUpWithEmailPasswordStateInitial {
  const _$_SignUpWithEmailPasswordStateInitial();

  @override
  String toString() {
    return 'SignUpWithEmailPasswordState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpWithEmailPasswordStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser result)? success,
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
    required TResult Function(_SignUpWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignUpWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignUpWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignUpWithEmailPasswordStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignUpWithEmailPasswordStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignUpWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmailPasswordStateInitial
    implements SignUpWithEmailPasswordState {
  const factory _SignUpWithEmailPasswordStateInitial() =
      _$_SignUpWithEmailPasswordStateInitial;
}

/// @nodoc
abstract class _$$_SignUpWithEmailPasswordStateLoadingCopyWith<$Res> {
  factory _$$_SignUpWithEmailPasswordStateLoadingCopyWith(
          _$_SignUpWithEmailPasswordStateLoading value,
          $Res Function(_$_SignUpWithEmailPasswordStateLoading) then) =
      __$$_SignUpWithEmailPasswordStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpWithEmailPasswordStateLoadingCopyWithImpl<$Res>
    extends _$SignUpWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignUpWithEmailPasswordStateLoading>
    implements _$$_SignUpWithEmailPasswordStateLoadingCopyWith<$Res> {
  __$$_SignUpWithEmailPasswordStateLoadingCopyWithImpl(
      _$_SignUpWithEmailPasswordStateLoading _value,
      $Res Function(_$_SignUpWithEmailPasswordStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUpWithEmailPasswordStateLoading
    implements _SignUpWithEmailPasswordStateLoading {
  const _$_SignUpWithEmailPasswordStateLoading();

  @override
  String toString() {
    return 'SignUpWithEmailPasswordState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpWithEmailPasswordStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser result)? success,
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
    required TResult Function(_SignUpWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignUpWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignUpWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignUpWithEmailPasswordStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignUpWithEmailPasswordStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignUpWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmailPasswordStateLoading
    implements SignUpWithEmailPasswordState {
  const factory _SignUpWithEmailPasswordStateLoading() =
      _$_SignUpWithEmailPasswordStateLoading;
}

/// @nodoc
abstract class _$$_SignUpWithEmailPasswordStateSuccessCopyWith<$Res> {
  factory _$$_SignUpWithEmailPasswordStateSuccessCopyWith(
          _$_SignUpWithEmailPasswordStateSuccess value,
          $Res Function(_$_SignUpWithEmailPasswordStateSuccess) then) =
      __$$_SignUpWithEmailPasswordStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanUser result});

  $PeamanUserCopyWith<$Res> get result;
}

/// @nodoc
class __$$_SignUpWithEmailPasswordStateSuccessCopyWithImpl<$Res>
    extends _$SignUpWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignUpWithEmailPasswordStateSuccess>
    implements _$$_SignUpWithEmailPasswordStateSuccessCopyWith<$Res> {
  __$$_SignUpWithEmailPasswordStateSuccessCopyWithImpl(
      _$_SignUpWithEmailPasswordStateSuccess _value,
      $Res Function(_$_SignUpWithEmailPasswordStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SignUpWithEmailPasswordStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PeamanUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanUserCopyWith<$Res> get result {
    return $PeamanUserCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$_SignUpWithEmailPasswordStateSuccess
    implements _SignUpWithEmailPasswordStateSuccess {
  const _$_SignUpWithEmailPasswordStateSuccess(this.result);

  @override
  final PeamanUser result;

  @override
  String toString() {
    return 'SignUpWithEmailPasswordState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpWithEmailPasswordStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpWithEmailPasswordStateSuccessCopyWith<
          _$_SignUpWithEmailPasswordStateSuccess>
      get copyWith => __$$_SignUpWithEmailPasswordStateSuccessCopyWithImpl<
          _$_SignUpWithEmailPasswordStateSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser result)? success,
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
    required TResult Function(_SignUpWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignUpWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignUpWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignUpWithEmailPasswordStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignUpWithEmailPasswordStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignUpWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmailPasswordStateSuccess
    implements SignUpWithEmailPasswordState {
  const factory _SignUpWithEmailPasswordStateSuccess(final PeamanUser result) =
      _$_SignUpWithEmailPasswordStateSuccess;

  PeamanUser get result;
  @JsonKey(ignore: true)
  _$$_SignUpWithEmailPasswordStateSuccessCopyWith<
          _$_SignUpWithEmailPasswordStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpWithEmailPasswordStateFailureCopyWith<$Res> {
  factory _$$_SignUpWithEmailPasswordStateFailureCopyWith(
          _$_SignUpWithEmailPasswordStateFailure value,
          $Res Function(_$_SignUpWithEmailPasswordStateFailure) then) =
      __$$_SignUpWithEmailPasswordStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SignUpWithEmailPasswordStateFailureCopyWithImpl<$Res>
    extends _$SignUpWithEmailPasswordStateCopyWithImpl<$Res,
        _$_SignUpWithEmailPasswordStateFailure>
    implements _$$_SignUpWithEmailPasswordStateFailureCopyWith<$Res> {
  __$$_SignUpWithEmailPasswordStateFailureCopyWithImpl(
      _$_SignUpWithEmailPasswordStateFailure _value,
      $Res Function(_$_SignUpWithEmailPasswordStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SignUpWithEmailPasswordStateFailure(
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

class _$_SignUpWithEmailPasswordStateFailure
    implements _SignUpWithEmailPasswordStateFailure {
  const _$_SignUpWithEmailPasswordStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SignUpWithEmailPasswordState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpWithEmailPasswordStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpWithEmailPasswordStateFailureCopyWith<
          _$_SignUpWithEmailPasswordStateFailure>
      get copyWith => __$$_SignUpWithEmailPasswordStateFailureCopyWithImpl<
          _$_SignUpWithEmailPasswordStateFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanUser result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanUser result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanUser result)? success,
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
    required TResult Function(_SignUpWithEmailPasswordStateInitial value)
        initial,
    required TResult Function(_SignUpWithEmailPasswordStateLoading value)
        loading,
    required TResult Function(_SignUpWithEmailPasswordStateSuccess value)
        success,
    required TResult Function(_SignUpWithEmailPasswordStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult? Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult? Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult? Function(_SignUpWithEmailPasswordStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignUpWithEmailPasswordStateInitial value)? initial,
    TResult Function(_SignUpWithEmailPasswordStateLoading value)? loading,
    TResult Function(_SignUpWithEmailPasswordStateSuccess value)? success,
    TResult Function(_SignUpWithEmailPasswordStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmailPasswordStateFailure
    implements SignUpWithEmailPasswordState {
  const factory _SignUpWithEmailPasswordStateFailure(final PeamanError error) =
      _$_SignUpWithEmailPasswordStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SignUpWithEmailPasswordStateFailureCopyWith<
          _$_SignUpWithEmailPasswordStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInWithGoogleState {
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
    required TResult Function(_SignInWithGoogleStateInitial value) initial,
    required TResult Function(_SignInWithGoogleStateLoading value) loading,
    required TResult Function(_SignInWithGoogleStateSuccess value) success,
    required TResult Function(_SignInWithGoogleStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleStateInitial value)? initial,
    TResult? Function(_SignInWithGoogleStateLoading value)? loading,
    TResult? Function(_SignInWithGoogleStateSuccess value)? success,
    TResult? Function(_SignInWithGoogleStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleStateInitial value)? initial,
    TResult Function(_SignInWithGoogleStateLoading value)? loading,
    TResult Function(_SignInWithGoogleStateSuccess value)? success,
    TResult Function(_SignInWithGoogleStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithGoogleStateCopyWith<$Res> {
  factory $SignInWithGoogleStateCopyWith(SignInWithGoogleState value,
          $Res Function(SignInWithGoogleState) then) =
      _$SignInWithGoogleStateCopyWithImpl<$Res, SignInWithGoogleState>;
}

/// @nodoc
class _$SignInWithGoogleStateCopyWithImpl<$Res,
        $Val extends SignInWithGoogleState>
    implements $SignInWithGoogleStateCopyWith<$Res> {
  _$SignInWithGoogleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignInWithGoogleStateInitialCopyWith<$Res> {
  factory _$$_SignInWithGoogleStateInitialCopyWith(
          _$_SignInWithGoogleStateInitial value,
          $Res Function(_$_SignInWithGoogleStateInitial) then) =
      __$$_SignInWithGoogleStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithGoogleStateInitialCopyWithImpl<$Res>
    extends _$SignInWithGoogleStateCopyWithImpl<$Res,
        _$_SignInWithGoogleStateInitial>
    implements _$$_SignInWithGoogleStateInitialCopyWith<$Res> {
  __$$_SignInWithGoogleStateInitialCopyWithImpl(
      _$_SignInWithGoogleStateInitial _value,
      $Res Function(_$_SignInWithGoogleStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithGoogleStateInitial implements _SignInWithGoogleStateInitial {
  const _$_SignInWithGoogleStateInitial();

  @override
  String toString() {
    return 'SignInWithGoogleState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithGoogleStateInitial);
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
    required TResult Function(_SignInWithGoogleStateInitial value) initial,
    required TResult Function(_SignInWithGoogleStateLoading value) loading,
    required TResult Function(_SignInWithGoogleStateSuccess value) success,
    required TResult Function(_SignInWithGoogleStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleStateInitial value)? initial,
    TResult? Function(_SignInWithGoogleStateLoading value)? loading,
    TResult? Function(_SignInWithGoogleStateSuccess value)? success,
    TResult? Function(_SignInWithGoogleStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleStateInitial value)? initial,
    TResult Function(_SignInWithGoogleStateLoading value)? loading,
    TResult Function(_SignInWithGoogleStateSuccess value)? success,
    TResult Function(_SignInWithGoogleStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogleStateInitial implements SignInWithGoogleState {
  const factory _SignInWithGoogleStateInitial() =
      _$_SignInWithGoogleStateInitial;
}

/// @nodoc
abstract class _$$_SignInWithGoogleStateLoadingCopyWith<$Res> {
  factory _$$_SignInWithGoogleStateLoadingCopyWith(
          _$_SignInWithGoogleStateLoading value,
          $Res Function(_$_SignInWithGoogleStateLoading) then) =
      __$$_SignInWithGoogleStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithGoogleStateLoadingCopyWithImpl<$Res>
    extends _$SignInWithGoogleStateCopyWithImpl<$Res,
        _$_SignInWithGoogleStateLoading>
    implements _$$_SignInWithGoogleStateLoadingCopyWith<$Res> {
  __$$_SignInWithGoogleStateLoadingCopyWithImpl(
      _$_SignInWithGoogleStateLoading _value,
      $Res Function(_$_SignInWithGoogleStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithGoogleStateLoading implements _SignInWithGoogleStateLoading {
  const _$_SignInWithGoogleStateLoading();

  @override
  String toString() {
    return 'SignInWithGoogleState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithGoogleStateLoading);
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
    required TResult Function(_SignInWithGoogleStateInitial value) initial,
    required TResult Function(_SignInWithGoogleStateLoading value) loading,
    required TResult Function(_SignInWithGoogleStateSuccess value) success,
    required TResult Function(_SignInWithGoogleStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleStateInitial value)? initial,
    TResult? Function(_SignInWithGoogleStateLoading value)? loading,
    TResult? Function(_SignInWithGoogleStateSuccess value)? success,
    TResult? Function(_SignInWithGoogleStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleStateInitial value)? initial,
    TResult Function(_SignInWithGoogleStateLoading value)? loading,
    TResult Function(_SignInWithGoogleStateSuccess value)? success,
    TResult Function(_SignInWithGoogleStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogleStateLoading implements SignInWithGoogleState {
  const factory _SignInWithGoogleStateLoading() =
      _$_SignInWithGoogleStateLoading;
}

/// @nodoc
abstract class _$$_SignInWithGoogleStateSuccessCopyWith<$Res> {
  factory _$$_SignInWithGoogleStateSuccessCopyWith(
          _$_SignInWithGoogleStateSuccess value,
          $Res Function(_$_SignInWithGoogleStateSuccess) then) =
      __$$_SignInWithGoogleStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_SignInWithGoogleStateSuccessCopyWithImpl<$Res>
    extends _$SignInWithGoogleStateCopyWithImpl<$Res,
        _$_SignInWithGoogleStateSuccess>
    implements _$$_SignInWithGoogleStateSuccessCopyWith<$Res> {
  __$$_SignInWithGoogleStateSuccessCopyWithImpl(
      _$_SignInWithGoogleStateSuccess _value,
      $Res Function(_$_SignInWithGoogleStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SignInWithGoogleStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInWithGoogleStateSuccess implements _SignInWithGoogleStateSuccess {
  const _$_SignInWithGoogleStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'SignInWithGoogleState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithGoogleStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithGoogleStateSuccessCopyWith<_$_SignInWithGoogleStateSuccess>
      get copyWith => __$$_SignInWithGoogleStateSuccessCopyWithImpl<
          _$_SignInWithGoogleStateSuccess>(this, _$identity);

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
    required TResult Function(_SignInWithGoogleStateInitial value) initial,
    required TResult Function(_SignInWithGoogleStateLoading value) loading,
    required TResult Function(_SignInWithGoogleStateSuccess value) success,
    required TResult Function(_SignInWithGoogleStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleStateInitial value)? initial,
    TResult? Function(_SignInWithGoogleStateLoading value)? loading,
    TResult? Function(_SignInWithGoogleStateSuccess value)? success,
    TResult? Function(_SignInWithGoogleStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleStateInitial value)? initial,
    TResult Function(_SignInWithGoogleStateLoading value)? loading,
    TResult Function(_SignInWithGoogleStateSuccess value)? success,
    TResult Function(_SignInWithGoogleStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogleStateSuccess implements SignInWithGoogleState {
  const factory _SignInWithGoogleStateSuccess(final bool result) =
      _$_SignInWithGoogleStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_SignInWithGoogleStateSuccessCopyWith<_$_SignInWithGoogleStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInWithGoogleStateFailureCopyWith<$Res> {
  factory _$$_SignInWithGoogleStateFailureCopyWith(
          _$_SignInWithGoogleStateFailure value,
          $Res Function(_$_SignInWithGoogleStateFailure) then) =
      __$$_SignInWithGoogleStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SignInWithGoogleStateFailureCopyWithImpl<$Res>
    extends _$SignInWithGoogleStateCopyWithImpl<$Res,
        _$_SignInWithGoogleStateFailure>
    implements _$$_SignInWithGoogleStateFailureCopyWith<$Res> {
  __$$_SignInWithGoogleStateFailureCopyWithImpl(
      _$_SignInWithGoogleStateFailure _value,
      $Res Function(_$_SignInWithGoogleStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SignInWithGoogleStateFailure(
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

class _$_SignInWithGoogleStateFailure implements _SignInWithGoogleStateFailure {
  const _$_SignInWithGoogleStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SignInWithGoogleState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithGoogleStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithGoogleStateFailureCopyWith<_$_SignInWithGoogleStateFailure>
      get copyWith => __$$_SignInWithGoogleStateFailureCopyWithImpl<
          _$_SignInWithGoogleStateFailure>(this, _$identity);

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
    required TResult Function(_SignInWithGoogleStateInitial value) initial,
    required TResult Function(_SignInWithGoogleStateLoading value) loading,
    required TResult Function(_SignInWithGoogleStateSuccess value) success,
    required TResult Function(_SignInWithGoogleStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithGoogleStateInitial value)? initial,
    TResult? Function(_SignInWithGoogleStateLoading value)? loading,
    TResult? Function(_SignInWithGoogleStateSuccess value)? success,
    TResult? Function(_SignInWithGoogleStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithGoogleStateInitial value)? initial,
    TResult Function(_SignInWithGoogleStateLoading value)? loading,
    TResult Function(_SignInWithGoogleStateSuccess value)? success,
    TResult Function(_SignInWithGoogleStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogleStateFailure implements SignInWithGoogleState {
  const factory _SignInWithGoogleStateFailure(final PeamanError error) =
      _$_SignInWithGoogleStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SignInWithGoogleStateFailureCopyWith<_$_SignInWithGoogleStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInWithFacebookState {
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
    required TResult Function(_SignInWithFacebookStateInitial value) initial,
    required TResult Function(_SignInWithFacebookStateLoading value) loading,
    required TResult Function(_SignInWithFacebookStateSuccess value) success,
    required TResult Function(_SignInWithFacebookStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithFacebookStateInitial value)? initial,
    TResult? Function(_SignInWithFacebookStateLoading value)? loading,
    TResult? Function(_SignInWithFacebookStateSuccess value)? success,
    TResult? Function(_SignInWithFacebookStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebookStateInitial value)? initial,
    TResult Function(_SignInWithFacebookStateLoading value)? loading,
    TResult Function(_SignInWithFacebookStateSuccess value)? success,
    TResult Function(_SignInWithFacebookStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithFacebookStateCopyWith<$Res> {
  factory $SignInWithFacebookStateCopyWith(SignInWithFacebookState value,
          $Res Function(SignInWithFacebookState) then) =
      _$SignInWithFacebookStateCopyWithImpl<$Res, SignInWithFacebookState>;
}

/// @nodoc
class _$SignInWithFacebookStateCopyWithImpl<$Res,
        $Val extends SignInWithFacebookState>
    implements $SignInWithFacebookStateCopyWith<$Res> {
  _$SignInWithFacebookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignInWithFacebookStateInitialCopyWith<$Res> {
  factory _$$_SignInWithFacebookStateInitialCopyWith(
          _$_SignInWithFacebookStateInitial value,
          $Res Function(_$_SignInWithFacebookStateInitial) then) =
      __$$_SignInWithFacebookStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithFacebookStateInitialCopyWithImpl<$Res>
    extends _$SignInWithFacebookStateCopyWithImpl<$Res,
        _$_SignInWithFacebookStateInitial>
    implements _$$_SignInWithFacebookStateInitialCopyWith<$Res> {
  __$$_SignInWithFacebookStateInitialCopyWithImpl(
      _$_SignInWithFacebookStateInitial _value,
      $Res Function(_$_SignInWithFacebookStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithFacebookStateInitial
    implements _SignInWithFacebookStateInitial {
  const _$_SignInWithFacebookStateInitial();

  @override
  String toString() {
    return 'SignInWithFacebookState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithFacebookStateInitial);
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
    required TResult Function(_SignInWithFacebookStateInitial value) initial,
    required TResult Function(_SignInWithFacebookStateLoading value) loading,
    required TResult Function(_SignInWithFacebookStateSuccess value) success,
    required TResult Function(_SignInWithFacebookStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithFacebookStateInitial value)? initial,
    TResult? Function(_SignInWithFacebookStateLoading value)? loading,
    TResult? Function(_SignInWithFacebookStateSuccess value)? success,
    TResult? Function(_SignInWithFacebookStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebookStateInitial value)? initial,
    TResult Function(_SignInWithFacebookStateLoading value)? loading,
    TResult Function(_SignInWithFacebookStateSuccess value)? success,
    TResult Function(_SignInWithFacebookStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignInWithFacebookStateInitial
    implements SignInWithFacebookState {
  const factory _SignInWithFacebookStateInitial() =
      _$_SignInWithFacebookStateInitial;
}

/// @nodoc
abstract class _$$_SignInWithFacebookStateLoadingCopyWith<$Res> {
  factory _$$_SignInWithFacebookStateLoadingCopyWith(
          _$_SignInWithFacebookStateLoading value,
          $Res Function(_$_SignInWithFacebookStateLoading) then) =
      __$$_SignInWithFacebookStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInWithFacebookStateLoadingCopyWithImpl<$Res>
    extends _$SignInWithFacebookStateCopyWithImpl<$Res,
        _$_SignInWithFacebookStateLoading>
    implements _$$_SignInWithFacebookStateLoadingCopyWith<$Res> {
  __$$_SignInWithFacebookStateLoadingCopyWithImpl(
      _$_SignInWithFacebookStateLoading _value,
      $Res Function(_$_SignInWithFacebookStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInWithFacebookStateLoading
    implements _SignInWithFacebookStateLoading {
  const _$_SignInWithFacebookStateLoading();

  @override
  String toString() {
    return 'SignInWithFacebookState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithFacebookStateLoading);
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
    required TResult Function(_SignInWithFacebookStateInitial value) initial,
    required TResult Function(_SignInWithFacebookStateLoading value) loading,
    required TResult Function(_SignInWithFacebookStateSuccess value) success,
    required TResult Function(_SignInWithFacebookStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithFacebookStateInitial value)? initial,
    TResult? Function(_SignInWithFacebookStateLoading value)? loading,
    TResult? Function(_SignInWithFacebookStateSuccess value)? success,
    TResult? Function(_SignInWithFacebookStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebookStateInitial value)? initial,
    TResult Function(_SignInWithFacebookStateLoading value)? loading,
    TResult Function(_SignInWithFacebookStateSuccess value)? success,
    TResult Function(_SignInWithFacebookStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInWithFacebookStateLoading
    implements SignInWithFacebookState {
  const factory _SignInWithFacebookStateLoading() =
      _$_SignInWithFacebookStateLoading;
}

/// @nodoc
abstract class _$$_SignInWithFacebookStateSuccessCopyWith<$Res> {
  factory _$$_SignInWithFacebookStateSuccessCopyWith(
          _$_SignInWithFacebookStateSuccess value,
          $Res Function(_$_SignInWithFacebookStateSuccess) then) =
      __$$_SignInWithFacebookStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_SignInWithFacebookStateSuccessCopyWithImpl<$Res>
    extends _$SignInWithFacebookStateCopyWithImpl<$Res,
        _$_SignInWithFacebookStateSuccess>
    implements _$$_SignInWithFacebookStateSuccessCopyWith<$Res> {
  __$$_SignInWithFacebookStateSuccessCopyWithImpl(
      _$_SignInWithFacebookStateSuccess _value,
      $Res Function(_$_SignInWithFacebookStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SignInWithFacebookStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignInWithFacebookStateSuccess
    implements _SignInWithFacebookStateSuccess {
  const _$_SignInWithFacebookStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'SignInWithFacebookState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithFacebookStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithFacebookStateSuccessCopyWith<_$_SignInWithFacebookStateSuccess>
      get copyWith => __$$_SignInWithFacebookStateSuccessCopyWithImpl<
          _$_SignInWithFacebookStateSuccess>(this, _$identity);

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
    required TResult Function(_SignInWithFacebookStateInitial value) initial,
    required TResult Function(_SignInWithFacebookStateLoading value) loading,
    required TResult Function(_SignInWithFacebookStateSuccess value) success,
    required TResult Function(_SignInWithFacebookStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithFacebookStateInitial value)? initial,
    TResult? Function(_SignInWithFacebookStateLoading value)? loading,
    TResult? Function(_SignInWithFacebookStateSuccess value)? success,
    TResult? Function(_SignInWithFacebookStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebookStateInitial value)? initial,
    TResult Function(_SignInWithFacebookStateLoading value)? loading,
    TResult Function(_SignInWithFacebookStateSuccess value)? success,
    TResult Function(_SignInWithFacebookStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignInWithFacebookStateSuccess
    implements SignInWithFacebookState {
  const factory _SignInWithFacebookStateSuccess(final bool result) =
      _$_SignInWithFacebookStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_SignInWithFacebookStateSuccessCopyWith<_$_SignInWithFacebookStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInWithFacebookStateFailureCopyWith<$Res> {
  factory _$$_SignInWithFacebookStateFailureCopyWith(
          _$_SignInWithFacebookStateFailure value,
          $Res Function(_$_SignInWithFacebookStateFailure) then) =
      __$$_SignInWithFacebookStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SignInWithFacebookStateFailureCopyWithImpl<$Res>
    extends _$SignInWithFacebookStateCopyWithImpl<$Res,
        _$_SignInWithFacebookStateFailure>
    implements _$$_SignInWithFacebookStateFailureCopyWith<$Res> {
  __$$_SignInWithFacebookStateFailureCopyWithImpl(
      _$_SignInWithFacebookStateFailure _value,
      $Res Function(_$_SignInWithFacebookStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SignInWithFacebookStateFailure(
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

class _$_SignInWithFacebookStateFailure
    implements _SignInWithFacebookStateFailure {
  const _$_SignInWithFacebookStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SignInWithFacebookState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithFacebookStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithFacebookStateFailureCopyWith<_$_SignInWithFacebookStateFailure>
      get copyWith => __$$_SignInWithFacebookStateFailureCopyWithImpl<
          _$_SignInWithFacebookStateFailure>(this, _$identity);

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
    required TResult Function(_SignInWithFacebookStateInitial value) initial,
    required TResult Function(_SignInWithFacebookStateLoading value) loading,
    required TResult Function(_SignInWithFacebookStateSuccess value) success,
    required TResult Function(_SignInWithFacebookStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithFacebookStateInitial value)? initial,
    TResult? Function(_SignInWithFacebookStateLoading value)? loading,
    TResult? Function(_SignInWithFacebookStateSuccess value)? success,
    TResult? Function(_SignInWithFacebookStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithFacebookStateInitial value)? initial,
    TResult Function(_SignInWithFacebookStateLoading value)? loading,
    TResult Function(_SignInWithFacebookStateSuccess value)? success,
    TResult Function(_SignInWithFacebookStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignInWithFacebookStateFailure
    implements SignInWithFacebookState {
  const factory _SignInWithFacebookStateFailure(final PeamanError error) =
      _$_SignInWithFacebookStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SignInWithFacebookStateFailureCopyWith<_$_SignInWithFacebookStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignOutState {
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
    required TResult Function(_SignOutStateInitial value) initial,
    required TResult Function(_SignOutStateLoading value) loading,
    required TResult Function(_SignOutStateSuccess value) success,
    required TResult Function(_SignOutStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignOutStateInitial value)? initial,
    TResult? Function(_SignOutStateLoading value)? loading,
    TResult? Function(_SignOutStateSuccess value)? success,
    TResult? Function(_SignOutStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignOutStateInitial value)? initial,
    TResult Function(_SignOutStateLoading value)? loading,
    TResult Function(_SignOutStateSuccess value)? success,
    TResult Function(_SignOutStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignOutStateCopyWith<$Res> {
  factory $SignOutStateCopyWith(
          SignOutState value, $Res Function(SignOutState) then) =
      _$SignOutStateCopyWithImpl<$Res, SignOutState>;
}

/// @nodoc
class _$SignOutStateCopyWithImpl<$Res, $Val extends SignOutState>
    implements $SignOutStateCopyWith<$Res> {
  _$SignOutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignOutStateInitialCopyWith<$Res> {
  factory _$$_SignOutStateInitialCopyWith(_$_SignOutStateInitial value,
          $Res Function(_$_SignOutStateInitial) then) =
      __$$_SignOutStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignOutStateInitialCopyWithImpl<$Res>
    extends _$SignOutStateCopyWithImpl<$Res, _$_SignOutStateInitial>
    implements _$$_SignOutStateInitialCopyWith<$Res> {
  __$$_SignOutStateInitialCopyWithImpl(_$_SignOutStateInitial _value,
      $Res Function(_$_SignOutStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignOutStateInitial implements _SignOutStateInitial {
  const _$_SignOutStateInitial();

  @override
  String toString() {
    return 'SignOutState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignOutStateInitial);
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
    required TResult Function(_SignOutStateInitial value) initial,
    required TResult Function(_SignOutStateLoading value) loading,
    required TResult Function(_SignOutStateSuccess value) success,
    required TResult Function(_SignOutStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignOutStateInitial value)? initial,
    TResult? Function(_SignOutStateLoading value)? loading,
    TResult? Function(_SignOutStateSuccess value)? success,
    TResult? Function(_SignOutStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignOutStateInitial value)? initial,
    TResult Function(_SignOutStateLoading value)? loading,
    TResult Function(_SignOutStateSuccess value)? success,
    TResult Function(_SignOutStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignOutStateInitial implements SignOutState {
  const factory _SignOutStateInitial() = _$_SignOutStateInitial;
}

/// @nodoc
abstract class _$$_SignOutStateLoadingCopyWith<$Res> {
  factory _$$_SignOutStateLoadingCopyWith(_$_SignOutStateLoading value,
          $Res Function(_$_SignOutStateLoading) then) =
      __$$_SignOutStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignOutStateLoadingCopyWithImpl<$Res>
    extends _$SignOutStateCopyWithImpl<$Res, _$_SignOutStateLoading>
    implements _$$_SignOutStateLoadingCopyWith<$Res> {
  __$$_SignOutStateLoadingCopyWithImpl(_$_SignOutStateLoading _value,
      $Res Function(_$_SignOutStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignOutStateLoading implements _SignOutStateLoading {
  const _$_SignOutStateLoading();

  @override
  String toString() {
    return 'SignOutState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignOutStateLoading);
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
    required TResult Function(_SignOutStateInitial value) initial,
    required TResult Function(_SignOutStateLoading value) loading,
    required TResult Function(_SignOutStateSuccess value) success,
    required TResult Function(_SignOutStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignOutStateInitial value)? initial,
    TResult? Function(_SignOutStateLoading value)? loading,
    TResult? Function(_SignOutStateSuccess value)? success,
    TResult? Function(_SignOutStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignOutStateInitial value)? initial,
    TResult Function(_SignOutStateLoading value)? loading,
    TResult Function(_SignOutStateSuccess value)? success,
    TResult Function(_SignOutStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignOutStateLoading implements SignOutState {
  const factory _SignOutStateLoading() = _$_SignOutStateLoading;
}

/// @nodoc
abstract class _$$_SignOutStateSuccessCopyWith<$Res> {
  factory _$$_SignOutStateSuccessCopyWith(_$_SignOutStateSuccess value,
          $Res Function(_$_SignOutStateSuccess) then) =
      __$$_SignOutStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_SignOutStateSuccessCopyWithImpl<$Res>
    extends _$SignOutStateCopyWithImpl<$Res, _$_SignOutStateSuccess>
    implements _$$_SignOutStateSuccessCopyWith<$Res> {
  __$$_SignOutStateSuccessCopyWithImpl(_$_SignOutStateSuccess _value,
      $Res Function(_$_SignOutStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SignOutStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignOutStateSuccess implements _SignOutStateSuccess {
  const _$_SignOutStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'SignOutState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignOutStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignOutStateSuccessCopyWith<_$_SignOutStateSuccess> get copyWith =>
      __$$_SignOutStateSuccessCopyWithImpl<_$_SignOutStateSuccess>(
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
    required TResult Function(_SignOutStateInitial value) initial,
    required TResult Function(_SignOutStateLoading value) loading,
    required TResult Function(_SignOutStateSuccess value) success,
    required TResult Function(_SignOutStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignOutStateInitial value)? initial,
    TResult? Function(_SignOutStateLoading value)? loading,
    TResult? Function(_SignOutStateSuccess value)? success,
    TResult? Function(_SignOutStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignOutStateInitial value)? initial,
    TResult Function(_SignOutStateLoading value)? loading,
    TResult Function(_SignOutStateSuccess value)? success,
    TResult Function(_SignOutStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignOutStateSuccess implements SignOutState {
  const factory _SignOutStateSuccess(final bool result) =
      _$_SignOutStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_SignOutStateSuccessCopyWith<_$_SignOutStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignOutStateFailureCopyWith<$Res> {
  factory _$$_SignOutStateFailureCopyWith(_$_SignOutStateFailure value,
          $Res Function(_$_SignOutStateFailure) then) =
      __$$_SignOutStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_SignOutStateFailureCopyWithImpl<$Res>
    extends _$SignOutStateCopyWithImpl<$Res, _$_SignOutStateFailure>
    implements _$$_SignOutStateFailureCopyWith<$Res> {
  __$$_SignOutStateFailureCopyWithImpl(_$_SignOutStateFailure _value,
      $Res Function(_$_SignOutStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SignOutStateFailure(
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

class _$_SignOutStateFailure implements _SignOutStateFailure {
  const _$_SignOutStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SignOutState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignOutStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignOutStateFailureCopyWith<_$_SignOutStateFailure> get copyWith =>
      __$$_SignOutStateFailureCopyWithImpl<_$_SignOutStateFailure>(
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
    required TResult Function(_SignOutStateInitial value) initial,
    required TResult Function(_SignOutStateLoading value) loading,
    required TResult Function(_SignOutStateSuccess value) success,
    required TResult Function(_SignOutStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignOutStateInitial value)? initial,
    TResult? Function(_SignOutStateLoading value)? loading,
    TResult? Function(_SignOutStateSuccess value)? success,
    TResult? Function(_SignOutStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignOutStateInitial value)? initial,
    TResult Function(_SignOutStateLoading value)? loading,
    TResult Function(_SignOutStateSuccess value)? success,
    TResult Function(_SignOutStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignOutStateFailure implements SignOutState {
  const factory _SignOutStateFailure(final PeamanError error) =
      _$_SignOutStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SignOutStateFailureCopyWith<_$_SignOutStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
