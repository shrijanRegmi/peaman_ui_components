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
  bool get isLoading => throw _privateConstructorUsedError;
  TextEditingController get emailController =>
      throw _privateConstructorUsedError;
  TextEditingController get passwordController =>
      throw _privateConstructorUsedError;
  TextEditingController get confirmPasswordController =>
      throw _privateConstructorUsedError;

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
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController});
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
    Object? isLoading = null,
    Object? emailController = null,
    Object? passwordController = null,
    Object? confirmPasswordController = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
    ) as $Val);
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
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController confirmPasswordController});
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
    Object? isLoading = null,
    Object? emailController = null,
    Object? passwordController = null,
    Object? confirmPasswordController = null,
  }) {
    return _then(_$_PeamanAuthProviderState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
    ));
  }
}

/// @nodoc

class _$_PeamanAuthProviderState implements _PeamanAuthProviderState {
  const _$_PeamanAuthProviderState(
      {this.isLoading = false,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController passwordController;
  @override
  final TextEditingController confirmPasswordController;

  @override
  String toString() {
    return 'PeamanAuthProviderState(isLoading: $isLoading, emailController: $emailController, passwordController: $passwordController, confirmPasswordController: $confirmPasswordController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanAuthProviderState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.confirmPasswordController,
                    confirmPasswordController) ||
                other.confirmPasswordController == confirmPasswordController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, emailController,
      passwordController, confirmPasswordController);

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
          {final bool isLoading,
          required final TextEditingController emailController,
          required final TextEditingController passwordController,
          required final TextEditingController confirmPasswordController}) =
      _$_PeamanAuthProviderState;

  @override
  bool get isLoading;
  @override
  TextEditingController get emailController;
  @override
  TextEditingController get passwordController;
  @override
  TextEditingController get confirmPasswordController;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanAuthProviderStateCopyWith<_$_PeamanAuthProviderState>
      get copyWith => throw _privateConstructorUsedError;
}
