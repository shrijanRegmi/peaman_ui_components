// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_single_peaman_chat_message_stream_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanSingleChatMessageArgs {
  String get chatId => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanSingleChatMessageArgsCopyWith<PeamanSingleChatMessageArgs>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanSingleChatMessageArgsCopyWith<$Res> {
  factory $PeamanSingleChatMessageArgsCopyWith(
          PeamanSingleChatMessageArgs value,
          $Res Function(PeamanSingleChatMessageArgs) then) =
      _$PeamanSingleChatMessageArgsCopyWithImpl<$Res,
          PeamanSingleChatMessageArgs>;
  @useResult
  $Res call({String chatId, String messageId});
}

/// @nodoc
class _$PeamanSingleChatMessageArgsCopyWithImpl<$Res,
        $Val extends PeamanSingleChatMessageArgs>
    implements $PeamanSingleChatMessageArgsCopyWith<$Res> {
  _$PeamanSingleChatMessageArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? messageId = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanSingleChatMessageArgsCopyWith<$Res>
    implements $PeamanSingleChatMessageArgsCopyWith<$Res> {
  factory _$$_PeamanSingleChatMessageArgsCopyWith(
          _$_PeamanSingleChatMessageArgs value,
          $Res Function(_$_PeamanSingleChatMessageArgs) then) =
      __$$_PeamanSingleChatMessageArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String chatId, String messageId});
}

/// @nodoc
class __$$_PeamanSingleChatMessageArgsCopyWithImpl<$Res>
    extends _$PeamanSingleChatMessageArgsCopyWithImpl<$Res,
        _$_PeamanSingleChatMessageArgs>
    implements _$$_PeamanSingleChatMessageArgsCopyWith<$Res> {
  __$$_PeamanSingleChatMessageArgsCopyWithImpl(
      _$_PeamanSingleChatMessageArgs _value,
      $Res Function(_$_PeamanSingleChatMessageArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? messageId = null,
  }) {
    return _then(_$_PeamanSingleChatMessageArgs(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PeamanSingleChatMessageArgs implements _PeamanSingleChatMessageArgs {
  const _$_PeamanSingleChatMessageArgs(
      {required this.chatId, required this.messageId});

  @override
  final String chatId;
  @override
  final String messageId;

  @override
  String toString() {
    return 'PeamanSingleChatMessageArgs(chatId: $chatId, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanSingleChatMessageArgs &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chatId, messageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanSingleChatMessageArgsCopyWith<_$_PeamanSingleChatMessageArgs>
      get copyWith => __$$_PeamanSingleChatMessageArgsCopyWithImpl<
          _$_PeamanSingleChatMessageArgs>(this, _$identity);
}

abstract class _PeamanSingleChatMessageArgs
    implements PeamanSingleChatMessageArgs {
  const factory _PeamanSingleChatMessageArgs(
      {required final String chatId,
      required final String messageId}) = _$_PeamanSingleChatMessageArgs;

  @override
  String get chatId;
  @override
  String get messageId;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanSingleChatMessageArgsCopyWith<_$_PeamanSingleChatMessageArgs>
      get copyWith => throw _privateConstructorUsedError;
}
