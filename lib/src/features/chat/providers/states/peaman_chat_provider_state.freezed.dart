// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_chat_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanChatProviderState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanChatProviderStateCopyWith<PeamanChatProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanChatProviderStateCopyWith<$Res> {
  factory $PeamanChatProviderStateCopyWith(PeamanChatProviderState value,
          $Res Function(PeamanChatProviderState) then) =
      _$PeamanChatProviderStateCopyWithImpl<$Res, PeamanChatProviderState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$PeamanChatProviderStateCopyWithImpl<$Res,
        $Val extends PeamanChatProviderState>
    implements $PeamanChatProviderStateCopyWith<$Res> {
  _$PeamanChatProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanChatProviderStateCopyWith<$Res>
    implements $PeamanChatProviderStateCopyWith<$Res> {
  factory _$$_PeamanChatProviderStateCopyWith(_$_PeamanChatProviderState value,
          $Res Function(_$_PeamanChatProviderState) then) =
      __$$_PeamanChatProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_PeamanChatProviderStateCopyWithImpl<$Res>
    extends _$PeamanChatProviderStateCopyWithImpl<$Res,
        _$_PeamanChatProviderState>
    implements _$$_PeamanChatProviderStateCopyWith<$Res> {
  __$$_PeamanChatProviderStateCopyWithImpl(_$_PeamanChatProviderState _value,
      $Res Function(_$_PeamanChatProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_PeamanChatProviderState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PeamanChatProviderState implements _PeamanChatProviderState {
  const _$_PeamanChatProviderState({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'PeamanChatProviderState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatProviderState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatProviderStateCopyWith<_$_PeamanChatProviderState>
      get copyWith =>
          __$$_PeamanChatProviderStateCopyWithImpl<_$_PeamanChatProviderState>(
              this, _$identity);
}

abstract class _PeamanChatProviderState implements PeamanChatProviderState {
  const factory _PeamanChatProviderState({final bool isLoading}) =
      _$_PeamanChatProviderState;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatProviderStateCopyWith<_$_PeamanChatProviderState>
      get copyWith => throw _privateConstructorUsedError;
}
