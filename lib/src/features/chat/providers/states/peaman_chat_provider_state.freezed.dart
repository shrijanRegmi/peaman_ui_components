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
  TextEditingController get messageController =>
      throw _privateConstructorUsedError;
  List<PeamanFileUrlExtended> get files => throw _privateConstructorUsedError;
  SendMessageState get sendMessageState => throw _privateConstructorUsedError;
  UpdateMessageState get updateMessageState =>
      throw _privateConstructorUsedError;
  DeleteMessageState get deleteMessageState =>
      throw _privateConstructorUsedError;
  UnsendMessageState get unsendMessageState =>
      throw _privateConstructorUsedError;
  ReadChatState get readChatState => throw _privateConstructorUsedError;
  UpdateChatState get updateChatState => throw _privateConstructorUsedError;
  DeleteChatState get deleteChatState => throw _privateConstructorUsedError;
  ArchiveChatState get archiveChatState => throw _privateConstructorUsedError;
  SetTypingStatusState get setTypingStatusState =>
      throw _privateConstructorUsedError;
  List<PeamanChatMessage> get tempMessages =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {TextEditingController messageController,
      List<PeamanFileUrlExtended> files,
      SendMessageState sendMessageState,
      UpdateMessageState updateMessageState,
      DeleteMessageState deleteMessageState,
      UnsendMessageState unsendMessageState,
      ReadChatState readChatState,
      UpdateChatState updateChatState,
      DeleteChatState deleteChatState,
      ArchiveChatState archiveChatState,
      SetTypingStatusState setTypingStatusState,
      List<PeamanChatMessage> tempMessages});

  $SendMessageStateCopyWith<$Res> get sendMessageState;
  $UpdateMessageStateCopyWith<$Res> get updateMessageState;
  $DeleteMessageStateCopyWith<$Res> get deleteMessageState;
  $UnsendMessageStateCopyWith<$Res> get unsendMessageState;
  $ReadChatStateCopyWith<$Res> get readChatState;
  $UpdateChatStateCopyWith<$Res> get updateChatState;
  $DeleteChatStateCopyWith<$Res> get deleteChatState;
  $ArchiveChatStateCopyWith<$Res> get archiveChatState;
  $SetTypingStatusStateCopyWith<$Res> get setTypingStatusState;
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
    Object? messageController = null,
    Object? files = null,
    Object? sendMessageState = null,
    Object? updateMessageState = null,
    Object? deleteMessageState = null,
    Object? unsendMessageState = null,
    Object? readChatState = null,
    Object? updateChatState = null,
    Object? deleteChatState = null,
    Object? archiveChatState = null,
    Object? setTypingStatusState = null,
    Object? tempMessages = null,
  }) {
    return _then(_value.copyWith(
      messageController: null == messageController
          ? _value.messageController
          : messageController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrlExtended>,
      sendMessageState: null == sendMessageState
          ? _value.sendMessageState
          : sendMessageState // ignore: cast_nullable_to_non_nullable
              as SendMessageState,
      updateMessageState: null == updateMessageState
          ? _value.updateMessageState
          : updateMessageState // ignore: cast_nullable_to_non_nullable
              as UpdateMessageState,
      deleteMessageState: null == deleteMessageState
          ? _value.deleteMessageState
          : deleteMessageState // ignore: cast_nullable_to_non_nullable
              as DeleteMessageState,
      unsendMessageState: null == unsendMessageState
          ? _value.unsendMessageState
          : unsendMessageState // ignore: cast_nullable_to_non_nullable
              as UnsendMessageState,
      readChatState: null == readChatState
          ? _value.readChatState
          : readChatState // ignore: cast_nullable_to_non_nullable
              as ReadChatState,
      updateChatState: null == updateChatState
          ? _value.updateChatState
          : updateChatState // ignore: cast_nullable_to_non_nullable
              as UpdateChatState,
      deleteChatState: null == deleteChatState
          ? _value.deleteChatState
          : deleteChatState // ignore: cast_nullable_to_non_nullable
              as DeleteChatState,
      archiveChatState: null == archiveChatState
          ? _value.archiveChatState
          : archiveChatState // ignore: cast_nullable_to_non_nullable
              as ArchiveChatState,
      setTypingStatusState: null == setTypingStatusState
          ? _value.setTypingStatusState
          : setTypingStatusState // ignore: cast_nullable_to_non_nullable
              as SetTypingStatusState,
      tempMessages: null == tempMessages
          ? _value.tempMessages
          : tempMessages // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatMessage>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SendMessageStateCopyWith<$Res> get sendMessageState {
    return $SendMessageStateCopyWith<$Res>(_value.sendMessageState, (value) {
      return _then(_value.copyWith(sendMessageState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdateMessageStateCopyWith<$Res> get updateMessageState {
    return $UpdateMessageStateCopyWith<$Res>(_value.updateMessageState,
        (value) {
      return _then(_value.copyWith(updateMessageState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeleteMessageStateCopyWith<$Res> get deleteMessageState {
    return $DeleteMessageStateCopyWith<$Res>(_value.deleteMessageState,
        (value) {
      return _then(_value.copyWith(deleteMessageState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UnsendMessageStateCopyWith<$Res> get unsendMessageState {
    return $UnsendMessageStateCopyWith<$Res>(_value.unsendMessageState,
        (value) {
      return _then(_value.copyWith(unsendMessageState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReadChatStateCopyWith<$Res> get readChatState {
    return $ReadChatStateCopyWith<$Res>(_value.readChatState, (value) {
      return _then(_value.copyWith(readChatState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdateChatStateCopyWith<$Res> get updateChatState {
    return $UpdateChatStateCopyWith<$Res>(_value.updateChatState, (value) {
      return _then(_value.copyWith(updateChatState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeleteChatStateCopyWith<$Res> get deleteChatState {
    return $DeleteChatStateCopyWith<$Res>(_value.deleteChatState, (value) {
      return _then(_value.copyWith(deleteChatState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ArchiveChatStateCopyWith<$Res> get archiveChatState {
    return $ArchiveChatStateCopyWith<$Res>(_value.archiveChatState, (value) {
      return _then(_value.copyWith(archiveChatState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SetTypingStatusStateCopyWith<$Res> get setTypingStatusState {
    return $SetTypingStatusStateCopyWith<$Res>(_value.setTypingStatusState,
        (value) {
      return _then(_value.copyWith(setTypingStatusState: value) as $Val);
    });
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
  $Res call(
      {TextEditingController messageController,
      List<PeamanFileUrlExtended> files,
      SendMessageState sendMessageState,
      UpdateMessageState updateMessageState,
      DeleteMessageState deleteMessageState,
      UnsendMessageState unsendMessageState,
      ReadChatState readChatState,
      UpdateChatState updateChatState,
      DeleteChatState deleteChatState,
      ArchiveChatState archiveChatState,
      SetTypingStatusState setTypingStatusState,
      List<PeamanChatMessage> tempMessages});

  @override
  $SendMessageStateCopyWith<$Res> get sendMessageState;
  @override
  $UpdateMessageStateCopyWith<$Res> get updateMessageState;
  @override
  $DeleteMessageStateCopyWith<$Res> get deleteMessageState;
  @override
  $UnsendMessageStateCopyWith<$Res> get unsendMessageState;
  @override
  $ReadChatStateCopyWith<$Res> get readChatState;
  @override
  $UpdateChatStateCopyWith<$Res> get updateChatState;
  @override
  $DeleteChatStateCopyWith<$Res> get deleteChatState;
  @override
  $ArchiveChatStateCopyWith<$Res> get archiveChatState;
  @override
  $SetTypingStatusStateCopyWith<$Res> get setTypingStatusState;
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
    Object? messageController = null,
    Object? files = null,
    Object? sendMessageState = null,
    Object? updateMessageState = null,
    Object? deleteMessageState = null,
    Object? unsendMessageState = null,
    Object? readChatState = null,
    Object? updateChatState = null,
    Object? deleteChatState = null,
    Object? archiveChatState = null,
    Object? setTypingStatusState = null,
    Object? tempMessages = null,
  }) {
    return _then(_$_PeamanChatProviderState(
      messageController: null == messageController
          ? _value.messageController
          : messageController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrlExtended>,
      sendMessageState: null == sendMessageState
          ? _value.sendMessageState
          : sendMessageState // ignore: cast_nullable_to_non_nullable
              as SendMessageState,
      updateMessageState: null == updateMessageState
          ? _value.updateMessageState
          : updateMessageState // ignore: cast_nullable_to_non_nullable
              as UpdateMessageState,
      deleteMessageState: null == deleteMessageState
          ? _value.deleteMessageState
          : deleteMessageState // ignore: cast_nullable_to_non_nullable
              as DeleteMessageState,
      unsendMessageState: null == unsendMessageState
          ? _value.unsendMessageState
          : unsendMessageState // ignore: cast_nullable_to_non_nullable
              as UnsendMessageState,
      readChatState: null == readChatState
          ? _value.readChatState
          : readChatState // ignore: cast_nullable_to_non_nullable
              as ReadChatState,
      updateChatState: null == updateChatState
          ? _value.updateChatState
          : updateChatState // ignore: cast_nullable_to_non_nullable
              as UpdateChatState,
      deleteChatState: null == deleteChatState
          ? _value.deleteChatState
          : deleteChatState // ignore: cast_nullable_to_non_nullable
              as DeleteChatState,
      archiveChatState: null == archiveChatState
          ? _value.archiveChatState
          : archiveChatState // ignore: cast_nullable_to_non_nullable
              as ArchiveChatState,
      setTypingStatusState: null == setTypingStatusState
          ? _value.setTypingStatusState
          : setTypingStatusState // ignore: cast_nullable_to_non_nullable
              as SetTypingStatusState,
      tempMessages: null == tempMessages
          ? _value._tempMessages
          : tempMessages // ignore: cast_nullable_to_non_nullable
              as List<PeamanChatMessage>,
    ));
  }
}

/// @nodoc

class _$_PeamanChatProviderState implements _PeamanChatProviderState {
  const _$_PeamanChatProviderState(
      {required this.messageController,
      final List<PeamanFileUrlExtended> files = const <PeamanFileUrlExtended>[],
      this.sendMessageState = const SendMessageState.initial(),
      this.updateMessageState = const UpdateMessageState.initial(),
      this.deleteMessageState = const DeleteMessageState.initial(),
      this.unsendMessageState = const UnsendMessageState.initial(),
      this.readChatState = const ReadChatState.initial(),
      this.updateChatState = const UpdateChatState.initial(),
      this.deleteChatState = const DeleteChatState.initial(),
      this.archiveChatState = const ArchiveChatState.initial(),
      this.setTypingStatusState = const SetTypingStatusState.initial(),
      final List<PeamanChatMessage> tempMessages = const <PeamanChatMessage>[]})
      : _files = files,
        _tempMessages = tempMessages;

  @override
  final TextEditingController messageController;
  final List<PeamanFileUrlExtended> _files;
  @override
  @JsonKey()
  List<PeamanFileUrlExtended> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  @JsonKey()
  final SendMessageState sendMessageState;
  @override
  @JsonKey()
  final UpdateMessageState updateMessageState;
  @override
  @JsonKey()
  final DeleteMessageState deleteMessageState;
  @override
  @JsonKey()
  final UnsendMessageState unsendMessageState;
  @override
  @JsonKey()
  final ReadChatState readChatState;
  @override
  @JsonKey()
  final UpdateChatState updateChatState;
  @override
  @JsonKey()
  final DeleteChatState deleteChatState;
  @override
  @JsonKey()
  final ArchiveChatState archiveChatState;
  @override
  @JsonKey()
  final SetTypingStatusState setTypingStatusState;
  final List<PeamanChatMessage> _tempMessages;
  @override
  @JsonKey()
  List<PeamanChatMessage> get tempMessages {
    if (_tempMessages is EqualUnmodifiableListView) return _tempMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tempMessages);
  }

  @override
  String toString() {
    return 'PeamanChatProviderState(messageController: $messageController, files: $files, sendMessageState: $sendMessageState, updateMessageState: $updateMessageState, deleteMessageState: $deleteMessageState, unsendMessageState: $unsendMessageState, readChatState: $readChatState, updateChatState: $updateChatState, deleteChatState: $deleteChatState, archiveChatState: $archiveChatState, setTypingStatusState: $setTypingStatusState, tempMessages: $tempMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanChatProviderState &&
            (identical(other.messageController, messageController) ||
                other.messageController == messageController) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.sendMessageState, sendMessageState) ||
                other.sendMessageState == sendMessageState) &&
            (identical(other.updateMessageState, updateMessageState) ||
                other.updateMessageState == updateMessageState) &&
            (identical(other.deleteMessageState, deleteMessageState) ||
                other.deleteMessageState == deleteMessageState) &&
            (identical(other.unsendMessageState, unsendMessageState) ||
                other.unsendMessageState == unsendMessageState) &&
            (identical(other.readChatState, readChatState) ||
                other.readChatState == readChatState) &&
            (identical(other.updateChatState, updateChatState) ||
                other.updateChatState == updateChatState) &&
            (identical(other.deleteChatState, deleteChatState) ||
                other.deleteChatState == deleteChatState) &&
            (identical(other.archiveChatState, archiveChatState) ||
                other.archiveChatState == archiveChatState) &&
            (identical(other.setTypingStatusState, setTypingStatusState) ||
                other.setTypingStatusState == setTypingStatusState) &&
            const DeepCollectionEquality()
                .equals(other._tempMessages, _tempMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageController,
      const DeepCollectionEquality().hash(_files),
      sendMessageState,
      updateMessageState,
      deleteMessageState,
      unsendMessageState,
      readChatState,
      updateChatState,
      deleteChatState,
      archiveChatState,
      setTypingStatusState,
      const DeepCollectionEquality().hash(_tempMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanChatProviderStateCopyWith<_$_PeamanChatProviderState>
      get copyWith =>
          __$$_PeamanChatProviderStateCopyWithImpl<_$_PeamanChatProviderState>(
              this, _$identity);
}

abstract class _PeamanChatProviderState implements PeamanChatProviderState {
  const factory _PeamanChatProviderState(
      {required final TextEditingController messageController,
      final List<PeamanFileUrlExtended> files,
      final SendMessageState sendMessageState,
      final UpdateMessageState updateMessageState,
      final DeleteMessageState deleteMessageState,
      final UnsendMessageState unsendMessageState,
      final ReadChatState readChatState,
      final UpdateChatState updateChatState,
      final DeleteChatState deleteChatState,
      final ArchiveChatState archiveChatState,
      final SetTypingStatusState setTypingStatusState,
      final List<PeamanChatMessage> tempMessages}) = _$_PeamanChatProviderState;

  @override
  TextEditingController get messageController;
  @override
  List<PeamanFileUrlExtended> get files;
  @override
  SendMessageState get sendMessageState;
  @override
  UpdateMessageState get updateMessageState;
  @override
  DeleteMessageState get deleteMessageState;
  @override
  UnsendMessageState get unsendMessageState;
  @override
  ReadChatState get readChatState;
  @override
  UpdateChatState get updateChatState;
  @override
  DeleteChatState get deleteChatState;
  @override
  ArchiveChatState get archiveChatState;
  @override
  SetTypingStatusState get setTypingStatusState;
  @override
  List<PeamanChatMessage> get tempMessages;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanChatProviderStateCopyWith<_$_PeamanChatProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendMessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanChatMessage result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanChatMessage result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanChatMessage result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMessageStateInitial value) initial,
    required TResult Function(_SendMessageStateLoading value) loading,
    required TResult Function(_SendMessageStateSuccess value) success,
    required TResult Function(_SendMessageStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessageStateInitial value)? initial,
    TResult? Function(_SendMessageStateLoading value)? loading,
    TResult? Function(_SendMessageStateSuccess value)? success,
    TResult? Function(_SendMessageStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessageStateInitial value)? initial,
    TResult Function(_SendMessageStateLoading value)? loading,
    TResult Function(_SendMessageStateSuccess value)? success,
    TResult Function(_SendMessageStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageStateCopyWith<$Res> {
  factory $SendMessageStateCopyWith(
          SendMessageState value, $Res Function(SendMessageState) then) =
      _$SendMessageStateCopyWithImpl<$Res, SendMessageState>;
}

/// @nodoc
class _$SendMessageStateCopyWithImpl<$Res, $Val extends SendMessageState>
    implements $SendMessageStateCopyWith<$Res> {
  _$SendMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendMessageStateInitialCopyWith<$Res> {
  factory _$$_SendMessageStateInitialCopyWith(_$_SendMessageStateInitial value,
          $Res Function(_$_SendMessageStateInitial) then) =
      __$$_SendMessageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendMessageStateInitialCopyWithImpl<$Res>
    extends _$SendMessageStateCopyWithImpl<$Res, _$_SendMessageStateInitial>
    implements _$$_SendMessageStateInitialCopyWith<$Res> {
  __$$_SendMessageStateInitialCopyWithImpl(_$_SendMessageStateInitial _value,
      $Res Function(_$_SendMessageStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SendMessageStateInitial implements _SendMessageStateInitial {
  const _$_SendMessageStateInitial();

  @override
  String toString() {
    return 'SendMessageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendMessageStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanChatMessage result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanChatMessage result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanChatMessage result)? success,
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
    required TResult Function(_SendMessageStateInitial value) initial,
    required TResult Function(_SendMessageStateLoading value) loading,
    required TResult Function(_SendMessageStateSuccess value) success,
    required TResult Function(_SendMessageStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessageStateInitial value)? initial,
    TResult? Function(_SendMessageStateLoading value)? loading,
    TResult? Function(_SendMessageStateSuccess value)? success,
    TResult? Function(_SendMessageStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessageStateInitial value)? initial,
    TResult Function(_SendMessageStateLoading value)? loading,
    TResult Function(_SendMessageStateSuccess value)? success,
    TResult Function(_SendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SendMessageStateInitial implements SendMessageState {
  const factory _SendMessageStateInitial() = _$_SendMessageStateInitial;
}

/// @nodoc
abstract class _$$_SendMessageStateLoadingCopyWith<$Res> {
  factory _$$_SendMessageStateLoadingCopyWith(_$_SendMessageStateLoading value,
          $Res Function(_$_SendMessageStateLoading) then) =
      __$$_SendMessageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendMessageStateLoadingCopyWithImpl<$Res>
    extends _$SendMessageStateCopyWithImpl<$Res, _$_SendMessageStateLoading>
    implements _$$_SendMessageStateLoadingCopyWith<$Res> {
  __$$_SendMessageStateLoadingCopyWithImpl(_$_SendMessageStateLoading _value,
      $Res Function(_$_SendMessageStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SendMessageStateLoading implements _SendMessageStateLoading {
  const _$_SendMessageStateLoading();

  @override
  String toString() {
    return 'SendMessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendMessageStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanChatMessage result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanChatMessage result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanChatMessage result)? success,
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
    required TResult Function(_SendMessageStateInitial value) initial,
    required TResult Function(_SendMessageStateLoading value) loading,
    required TResult Function(_SendMessageStateSuccess value) success,
    required TResult Function(_SendMessageStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessageStateInitial value)? initial,
    TResult? Function(_SendMessageStateLoading value)? loading,
    TResult? Function(_SendMessageStateSuccess value)? success,
    TResult? Function(_SendMessageStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessageStateInitial value)? initial,
    TResult Function(_SendMessageStateLoading value)? loading,
    TResult Function(_SendMessageStateSuccess value)? success,
    TResult Function(_SendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SendMessageStateLoading implements SendMessageState {
  const factory _SendMessageStateLoading() = _$_SendMessageStateLoading;
}

/// @nodoc
abstract class _$$_SendMessageStateSuccessCopyWith<$Res> {
  factory _$$_SendMessageStateSuccessCopyWith(_$_SendMessageStateSuccess value,
          $Res Function(_$_SendMessageStateSuccess) then) =
      __$$_SendMessageStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanChatMessage result});

  $PeamanChatMessageCopyWith<$Res> get result;
}

/// @nodoc
class __$$_SendMessageStateSuccessCopyWithImpl<$Res>
    extends _$SendMessageStateCopyWithImpl<$Res, _$_SendMessageStateSuccess>
    implements _$$_SendMessageStateSuccessCopyWith<$Res> {
  __$$_SendMessageStateSuccessCopyWithImpl(_$_SendMessageStateSuccess _value,
      $Res Function(_$_SendMessageStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SendMessageStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PeamanChatMessage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanChatMessageCopyWith<$Res> get result {
    return $PeamanChatMessageCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$_SendMessageStateSuccess implements _SendMessageStateSuccess {
  const _$_SendMessageStateSuccess(this.result);

  @override
  final PeamanChatMessage result;

  @override
  String toString() {
    return 'SendMessageState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendMessageStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendMessageStateSuccessCopyWith<_$_SendMessageStateSuccess>
      get copyWith =>
          __$$_SendMessageStateSuccessCopyWithImpl<_$_SendMessageStateSuccess>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanChatMessage result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanChatMessage result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanChatMessage result)? success,
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
    required TResult Function(_SendMessageStateInitial value) initial,
    required TResult Function(_SendMessageStateLoading value) loading,
    required TResult Function(_SendMessageStateSuccess value) success,
    required TResult Function(_SendMessageStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessageStateInitial value)? initial,
    TResult? Function(_SendMessageStateLoading value)? loading,
    TResult? Function(_SendMessageStateSuccess value)? success,
    TResult? Function(_SendMessageStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessageStateInitial value)? initial,
    TResult Function(_SendMessageStateLoading value)? loading,
    TResult Function(_SendMessageStateSuccess value)? success,
    TResult Function(_SendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SendMessageStateSuccess implements SendMessageState {
  const factory _SendMessageStateSuccess(final PeamanChatMessage result) =
      _$_SendMessageStateSuccess;

  PeamanChatMessage get result;
  @JsonKey(ignore: true)
  _$$_SendMessageStateSuccessCopyWith<_$_SendMessageStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendMessageStateFailureCopyWith<$Res> {
  factory _$$_SendMessageStateFailureCopyWith(_$_SendMessageStateFailure value,
          $Res Function(_$_SendMessageStateFailure) then) =
      __$$_SendMessageStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_SendMessageStateFailureCopyWithImpl<$Res>
    extends _$SendMessageStateCopyWithImpl<$Res, _$_SendMessageStateFailure>
    implements _$$_SendMessageStateFailureCopyWith<$Res> {
  __$$_SendMessageStateFailureCopyWithImpl(_$_SendMessageStateFailure _value,
      $Res Function(_$_SendMessageStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SendMessageStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_SendMessageStateFailure implements _SendMessageStateFailure {
  const _$_SendMessageStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SendMessageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendMessageStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendMessageStateFailureCopyWith<_$_SendMessageStateFailure>
      get copyWith =>
          __$$_SendMessageStateFailureCopyWithImpl<_$_SendMessageStateFailure>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanChatMessage result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanChatMessage result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanChatMessage result)? success,
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
    required TResult Function(_SendMessageStateInitial value) initial,
    required TResult Function(_SendMessageStateLoading value) loading,
    required TResult Function(_SendMessageStateSuccess value) success,
    required TResult Function(_SendMessageStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendMessageStateInitial value)? initial,
    TResult? Function(_SendMessageStateLoading value)? loading,
    TResult? Function(_SendMessageStateSuccess value)? success,
    TResult? Function(_SendMessageStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMessageStateInitial value)? initial,
    TResult Function(_SendMessageStateLoading value)? loading,
    TResult Function(_SendMessageStateSuccess value)? success,
    TResult Function(_SendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SendMessageStateFailure implements SendMessageState {
  const factory _SendMessageStateFailure(final PeamanError error) =
      _$_SendMessageStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SendMessageStateFailureCopyWith<_$_SendMessageStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateMessageState {
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
    required TResult Function(_UpdateMessageStateInitial value) initial,
    required TResult Function(_UpdateMessageStateLoading value) loading,
    required TResult Function(_UpdateMessageStateSuccess value) success,
    required TResult Function(_UpdateMessageStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateMessageStateInitial value)? initial,
    TResult? Function(_UpdateMessageStateLoading value)? loading,
    TResult? Function(_UpdateMessageStateSuccess value)? success,
    TResult? Function(_UpdateMessageStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateMessageStateInitial value)? initial,
    TResult Function(_UpdateMessageStateLoading value)? loading,
    TResult Function(_UpdateMessageStateSuccess value)? success,
    TResult Function(_UpdateMessageStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMessageStateCopyWith<$Res> {
  factory $UpdateMessageStateCopyWith(
          UpdateMessageState value, $Res Function(UpdateMessageState) then) =
      _$UpdateMessageStateCopyWithImpl<$Res, UpdateMessageState>;
}

/// @nodoc
class _$UpdateMessageStateCopyWithImpl<$Res, $Val extends UpdateMessageState>
    implements $UpdateMessageStateCopyWith<$Res> {
  _$UpdateMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UpdateMessageStateInitialCopyWith<$Res> {
  factory _$$_UpdateMessageStateInitialCopyWith(
          _$_UpdateMessageStateInitial value,
          $Res Function(_$_UpdateMessageStateInitial) then) =
      __$$_UpdateMessageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateMessageStateInitialCopyWithImpl<$Res>
    extends _$UpdateMessageStateCopyWithImpl<$Res, _$_UpdateMessageStateInitial>
    implements _$$_UpdateMessageStateInitialCopyWith<$Res> {
  __$$_UpdateMessageStateInitialCopyWithImpl(
      _$_UpdateMessageStateInitial _value,
      $Res Function(_$_UpdateMessageStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateMessageStateInitial implements _UpdateMessageStateInitial {
  const _$_UpdateMessageStateInitial();

  @override
  String toString() {
    return 'UpdateMessageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMessageStateInitial);
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
    required TResult Function(_UpdateMessageStateInitial value) initial,
    required TResult Function(_UpdateMessageStateLoading value) loading,
    required TResult Function(_UpdateMessageStateSuccess value) success,
    required TResult Function(_UpdateMessageStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateMessageStateInitial value)? initial,
    TResult? Function(_UpdateMessageStateLoading value)? loading,
    TResult? Function(_UpdateMessageStateSuccess value)? success,
    TResult? Function(_UpdateMessageStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateMessageStateInitial value)? initial,
    TResult Function(_UpdateMessageStateLoading value)? loading,
    TResult Function(_UpdateMessageStateSuccess value)? success,
    TResult Function(_UpdateMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UpdateMessageStateInitial implements UpdateMessageState {
  const factory _UpdateMessageStateInitial() = _$_UpdateMessageStateInitial;
}

/// @nodoc
abstract class _$$_UpdateMessageStateLoadingCopyWith<$Res> {
  factory _$$_UpdateMessageStateLoadingCopyWith(
          _$_UpdateMessageStateLoading value,
          $Res Function(_$_UpdateMessageStateLoading) then) =
      __$$_UpdateMessageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateMessageStateLoadingCopyWithImpl<$Res>
    extends _$UpdateMessageStateCopyWithImpl<$Res, _$_UpdateMessageStateLoading>
    implements _$$_UpdateMessageStateLoadingCopyWith<$Res> {
  __$$_UpdateMessageStateLoadingCopyWithImpl(
      _$_UpdateMessageStateLoading _value,
      $Res Function(_$_UpdateMessageStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateMessageStateLoading implements _UpdateMessageStateLoading {
  const _$_UpdateMessageStateLoading();

  @override
  String toString() {
    return 'UpdateMessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMessageStateLoading);
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
    required TResult Function(_UpdateMessageStateInitial value) initial,
    required TResult Function(_UpdateMessageStateLoading value) loading,
    required TResult Function(_UpdateMessageStateSuccess value) success,
    required TResult Function(_UpdateMessageStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateMessageStateInitial value)? initial,
    TResult? Function(_UpdateMessageStateLoading value)? loading,
    TResult? Function(_UpdateMessageStateSuccess value)? success,
    TResult? Function(_UpdateMessageStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateMessageStateInitial value)? initial,
    TResult Function(_UpdateMessageStateLoading value)? loading,
    TResult Function(_UpdateMessageStateSuccess value)? success,
    TResult Function(_UpdateMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UpdateMessageStateLoading implements UpdateMessageState {
  const factory _UpdateMessageStateLoading() = _$_UpdateMessageStateLoading;
}

/// @nodoc
abstract class _$$_UpdateMessageStateSuccessCopyWith<$Res> {
  factory _$$_UpdateMessageStateSuccessCopyWith(
          _$_UpdateMessageStateSuccess value,
          $Res Function(_$_UpdateMessageStateSuccess) then) =
      __$$_UpdateMessageStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_UpdateMessageStateSuccessCopyWithImpl<$Res>
    extends _$UpdateMessageStateCopyWithImpl<$Res, _$_UpdateMessageStateSuccess>
    implements _$$_UpdateMessageStateSuccessCopyWith<$Res> {
  __$$_UpdateMessageStateSuccessCopyWithImpl(
      _$_UpdateMessageStateSuccess _value,
      $Res Function(_$_UpdateMessageStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_UpdateMessageStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateMessageStateSuccess implements _UpdateMessageStateSuccess {
  const _$_UpdateMessageStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'UpdateMessageState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMessageStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateMessageStateSuccessCopyWith<_$_UpdateMessageStateSuccess>
      get copyWith => __$$_UpdateMessageStateSuccessCopyWithImpl<
          _$_UpdateMessageStateSuccess>(this, _$identity);

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
    required TResult Function(_UpdateMessageStateInitial value) initial,
    required TResult Function(_UpdateMessageStateLoading value) loading,
    required TResult Function(_UpdateMessageStateSuccess value) success,
    required TResult Function(_UpdateMessageStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateMessageStateInitial value)? initial,
    TResult? Function(_UpdateMessageStateLoading value)? loading,
    TResult? Function(_UpdateMessageStateSuccess value)? success,
    TResult? Function(_UpdateMessageStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateMessageStateInitial value)? initial,
    TResult Function(_UpdateMessageStateLoading value)? loading,
    TResult Function(_UpdateMessageStateSuccess value)? success,
    TResult Function(_UpdateMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _UpdateMessageStateSuccess implements UpdateMessageState {
  const factory _UpdateMessageStateSuccess(final bool result) =
      _$_UpdateMessageStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_UpdateMessageStateSuccessCopyWith<_$_UpdateMessageStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateMessageStateFailureCopyWith<$Res> {
  factory _$$_UpdateMessageStateFailureCopyWith(
          _$_UpdateMessageStateFailure value,
          $Res Function(_$_UpdateMessageStateFailure) then) =
      __$$_UpdateMessageStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_UpdateMessageStateFailureCopyWithImpl<$Res>
    extends _$UpdateMessageStateCopyWithImpl<$Res, _$_UpdateMessageStateFailure>
    implements _$$_UpdateMessageStateFailureCopyWith<$Res> {
  __$$_UpdateMessageStateFailureCopyWithImpl(
      _$_UpdateMessageStateFailure _value,
      $Res Function(_$_UpdateMessageStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UpdateMessageStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_UpdateMessageStateFailure implements _UpdateMessageStateFailure {
  const _$_UpdateMessageStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'UpdateMessageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMessageStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateMessageStateFailureCopyWith<_$_UpdateMessageStateFailure>
      get copyWith => __$$_UpdateMessageStateFailureCopyWithImpl<
          _$_UpdateMessageStateFailure>(this, _$identity);

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
    required TResult Function(_UpdateMessageStateInitial value) initial,
    required TResult Function(_UpdateMessageStateLoading value) loading,
    required TResult Function(_UpdateMessageStateSuccess value) success,
    required TResult Function(_UpdateMessageStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateMessageStateInitial value)? initial,
    TResult? Function(_UpdateMessageStateLoading value)? loading,
    TResult? Function(_UpdateMessageStateSuccess value)? success,
    TResult? Function(_UpdateMessageStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateMessageStateInitial value)? initial,
    TResult Function(_UpdateMessageStateLoading value)? loading,
    TResult Function(_UpdateMessageStateSuccess value)? success,
    TResult Function(_UpdateMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UpdateMessageStateFailure implements UpdateMessageState {
  const factory _UpdateMessageStateFailure(final PeamanError error) =
      _$_UpdateMessageStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_UpdateMessageStateFailureCopyWith<_$_UpdateMessageStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeleteMessageState {
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
    required TResult Function(_DeleteMessageStateInitial value) initial,
    required TResult Function(_DeleteMessageStateLoading value) loading,
    required TResult Function(_DeleteMessageStateSuccess value) success,
    required TResult Function(_DeleteMessageStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteMessageStateInitial value)? initial,
    TResult? Function(_DeleteMessageStateLoading value)? loading,
    TResult? Function(_DeleteMessageStateSuccess value)? success,
    TResult? Function(_DeleteMessageStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteMessageStateInitial value)? initial,
    TResult Function(_DeleteMessageStateLoading value)? loading,
    TResult Function(_DeleteMessageStateSuccess value)? success,
    TResult Function(_DeleteMessageStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteMessageStateCopyWith<$Res> {
  factory $DeleteMessageStateCopyWith(
          DeleteMessageState value, $Res Function(DeleteMessageState) then) =
      _$DeleteMessageStateCopyWithImpl<$Res, DeleteMessageState>;
}

/// @nodoc
class _$DeleteMessageStateCopyWithImpl<$Res, $Val extends DeleteMessageState>
    implements $DeleteMessageStateCopyWith<$Res> {
  _$DeleteMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DeleteMessageStateInitialCopyWith<$Res> {
  factory _$$_DeleteMessageStateInitialCopyWith(
          _$_DeleteMessageStateInitial value,
          $Res Function(_$_DeleteMessageStateInitial) then) =
      __$$_DeleteMessageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteMessageStateInitialCopyWithImpl<$Res>
    extends _$DeleteMessageStateCopyWithImpl<$Res, _$_DeleteMessageStateInitial>
    implements _$$_DeleteMessageStateInitialCopyWith<$Res> {
  __$$_DeleteMessageStateInitialCopyWithImpl(
      _$_DeleteMessageStateInitial _value,
      $Res Function(_$_DeleteMessageStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteMessageStateInitial implements _DeleteMessageStateInitial {
  const _$_DeleteMessageStateInitial();

  @override
  String toString() {
    return 'DeleteMessageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteMessageStateInitial);
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
    required TResult Function(_DeleteMessageStateInitial value) initial,
    required TResult Function(_DeleteMessageStateLoading value) loading,
    required TResult Function(_DeleteMessageStateSuccess value) success,
    required TResult Function(_DeleteMessageStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteMessageStateInitial value)? initial,
    TResult? Function(_DeleteMessageStateLoading value)? loading,
    TResult? Function(_DeleteMessageStateSuccess value)? success,
    TResult? Function(_DeleteMessageStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteMessageStateInitial value)? initial,
    TResult Function(_DeleteMessageStateLoading value)? loading,
    TResult Function(_DeleteMessageStateSuccess value)? success,
    TResult Function(_DeleteMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DeleteMessageStateInitial implements DeleteMessageState {
  const factory _DeleteMessageStateInitial() = _$_DeleteMessageStateInitial;
}

/// @nodoc
abstract class _$$_DeleteMessageStateLoadingCopyWith<$Res> {
  factory _$$_DeleteMessageStateLoadingCopyWith(
          _$_DeleteMessageStateLoading value,
          $Res Function(_$_DeleteMessageStateLoading) then) =
      __$$_DeleteMessageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteMessageStateLoadingCopyWithImpl<$Res>
    extends _$DeleteMessageStateCopyWithImpl<$Res, _$_DeleteMessageStateLoading>
    implements _$$_DeleteMessageStateLoadingCopyWith<$Res> {
  __$$_DeleteMessageStateLoadingCopyWithImpl(
      _$_DeleteMessageStateLoading _value,
      $Res Function(_$_DeleteMessageStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteMessageStateLoading implements _DeleteMessageStateLoading {
  const _$_DeleteMessageStateLoading();

  @override
  String toString() {
    return 'DeleteMessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteMessageStateLoading);
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
    required TResult Function(_DeleteMessageStateInitial value) initial,
    required TResult Function(_DeleteMessageStateLoading value) loading,
    required TResult Function(_DeleteMessageStateSuccess value) success,
    required TResult Function(_DeleteMessageStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteMessageStateInitial value)? initial,
    TResult? Function(_DeleteMessageStateLoading value)? loading,
    TResult? Function(_DeleteMessageStateSuccess value)? success,
    TResult? Function(_DeleteMessageStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteMessageStateInitial value)? initial,
    TResult Function(_DeleteMessageStateLoading value)? loading,
    TResult Function(_DeleteMessageStateSuccess value)? success,
    TResult Function(_DeleteMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DeleteMessageStateLoading implements DeleteMessageState {
  const factory _DeleteMessageStateLoading() = _$_DeleteMessageStateLoading;
}

/// @nodoc
abstract class _$$_DeleteMessageStateSuccessCopyWith<$Res> {
  factory _$$_DeleteMessageStateSuccessCopyWith(
          _$_DeleteMessageStateSuccess value,
          $Res Function(_$_DeleteMessageStateSuccess) then) =
      __$$_DeleteMessageStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_DeleteMessageStateSuccessCopyWithImpl<$Res>
    extends _$DeleteMessageStateCopyWithImpl<$Res, _$_DeleteMessageStateSuccess>
    implements _$$_DeleteMessageStateSuccessCopyWith<$Res> {
  __$$_DeleteMessageStateSuccessCopyWithImpl(
      _$_DeleteMessageStateSuccess _value,
      $Res Function(_$_DeleteMessageStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_DeleteMessageStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DeleteMessageStateSuccess implements _DeleteMessageStateSuccess {
  const _$_DeleteMessageStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'DeleteMessageState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteMessageStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteMessageStateSuccessCopyWith<_$_DeleteMessageStateSuccess>
      get copyWith => __$$_DeleteMessageStateSuccessCopyWithImpl<
          _$_DeleteMessageStateSuccess>(this, _$identity);

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
    required TResult Function(_DeleteMessageStateInitial value) initial,
    required TResult Function(_DeleteMessageStateLoading value) loading,
    required TResult Function(_DeleteMessageStateSuccess value) success,
    required TResult Function(_DeleteMessageStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteMessageStateInitial value)? initial,
    TResult? Function(_DeleteMessageStateLoading value)? loading,
    TResult? Function(_DeleteMessageStateSuccess value)? success,
    TResult? Function(_DeleteMessageStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteMessageStateInitial value)? initial,
    TResult Function(_DeleteMessageStateLoading value)? loading,
    TResult Function(_DeleteMessageStateSuccess value)? success,
    TResult Function(_DeleteMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DeleteMessageStateSuccess implements DeleteMessageState {
  const factory _DeleteMessageStateSuccess(final bool result) =
      _$_DeleteMessageStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_DeleteMessageStateSuccessCopyWith<_$_DeleteMessageStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteMessageStateFailureCopyWith<$Res> {
  factory _$$_DeleteMessageStateFailureCopyWith(
          _$_DeleteMessageStateFailure value,
          $Res Function(_$_DeleteMessageStateFailure) then) =
      __$$_DeleteMessageStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_DeleteMessageStateFailureCopyWithImpl<$Res>
    extends _$DeleteMessageStateCopyWithImpl<$Res, _$_DeleteMessageStateFailure>
    implements _$$_DeleteMessageStateFailureCopyWith<$Res> {
  __$$_DeleteMessageStateFailureCopyWithImpl(
      _$_DeleteMessageStateFailure _value,
      $Res Function(_$_DeleteMessageStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_DeleteMessageStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_DeleteMessageStateFailure implements _DeleteMessageStateFailure {
  const _$_DeleteMessageStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'DeleteMessageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteMessageStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteMessageStateFailureCopyWith<_$_DeleteMessageStateFailure>
      get copyWith => __$$_DeleteMessageStateFailureCopyWithImpl<
          _$_DeleteMessageStateFailure>(this, _$identity);

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
    required TResult Function(_DeleteMessageStateInitial value) initial,
    required TResult Function(_DeleteMessageStateLoading value) loading,
    required TResult Function(_DeleteMessageStateSuccess value) success,
    required TResult Function(_DeleteMessageStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteMessageStateInitial value)? initial,
    TResult? Function(_DeleteMessageStateLoading value)? loading,
    TResult? Function(_DeleteMessageStateSuccess value)? success,
    TResult? Function(_DeleteMessageStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteMessageStateInitial value)? initial,
    TResult Function(_DeleteMessageStateLoading value)? loading,
    TResult Function(_DeleteMessageStateSuccess value)? success,
    TResult Function(_DeleteMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DeleteMessageStateFailure implements DeleteMessageState {
  const factory _DeleteMessageStateFailure(final PeamanError error) =
      _$_DeleteMessageStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_DeleteMessageStateFailureCopyWith<_$_DeleteMessageStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UnsendMessageState {
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
    required TResult Function(_UnsendMessageStateInitial value) initial,
    required TResult Function(_UnsendMessageStateLoading value) loading,
    required TResult Function(_UnsendMessageStateSuccess value) success,
    required TResult Function(_UnsendMessageStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnsendMessageStateInitial value)? initial,
    TResult? Function(_UnsendMessageStateLoading value)? loading,
    TResult? Function(_UnsendMessageStateSuccess value)? success,
    TResult? Function(_UnsendMessageStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnsendMessageStateInitial value)? initial,
    TResult Function(_UnsendMessageStateLoading value)? loading,
    TResult Function(_UnsendMessageStateSuccess value)? success,
    TResult Function(_UnsendMessageStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsendMessageStateCopyWith<$Res> {
  factory $UnsendMessageStateCopyWith(
          UnsendMessageState value, $Res Function(UnsendMessageState) then) =
      _$UnsendMessageStateCopyWithImpl<$Res, UnsendMessageState>;
}

/// @nodoc
class _$UnsendMessageStateCopyWithImpl<$Res, $Val extends UnsendMessageState>
    implements $UnsendMessageStateCopyWith<$Res> {
  _$UnsendMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnsendMessageStateInitialCopyWith<$Res> {
  factory _$$_UnsendMessageStateInitialCopyWith(
          _$_UnsendMessageStateInitial value,
          $Res Function(_$_UnsendMessageStateInitial) then) =
      __$$_UnsendMessageStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnsendMessageStateInitialCopyWithImpl<$Res>
    extends _$UnsendMessageStateCopyWithImpl<$Res, _$_UnsendMessageStateInitial>
    implements _$$_UnsendMessageStateInitialCopyWith<$Res> {
  __$$_UnsendMessageStateInitialCopyWithImpl(
      _$_UnsendMessageStateInitial _value,
      $Res Function(_$_UnsendMessageStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnsendMessageStateInitial implements _UnsendMessageStateInitial {
  const _$_UnsendMessageStateInitial();

  @override
  String toString() {
    return 'UnsendMessageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsendMessageStateInitial);
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
    required TResult Function(_UnsendMessageStateInitial value) initial,
    required TResult Function(_UnsendMessageStateLoading value) loading,
    required TResult Function(_UnsendMessageStateSuccess value) success,
    required TResult Function(_UnsendMessageStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnsendMessageStateInitial value)? initial,
    TResult? Function(_UnsendMessageStateLoading value)? loading,
    TResult? Function(_UnsendMessageStateSuccess value)? success,
    TResult? Function(_UnsendMessageStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnsendMessageStateInitial value)? initial,
    TResult Function(_UnsendMessageStateLoading value)? loading,
    TResult Function(_UnsendMessageStateSuccess value)? success,
    TResult Function(_UnsendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UnsendMessageStateInitial implements UnsendMessageState {
  const factory _UnsendMessageStateInitial() = _$_UnsendMessageStateInitial;
}

/// @nodoc
abstract class _$$_UnsendMessageStateLoadingCopyWith<$Res> {
  factory _$$_UnsendMessageStateLoadingCopyWith(
          _$_UnsendMessageStateLoading value,
          $Res Function(_$_UnsendMessageStateLoading) then) =
      __$$_UnsendMessageStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnsendMessageStateLoadingCopyWithImpl<$Res>
    extends _$UnsendMessageStateCopyWithImpl<$Res, _$_UnsendMessageStateLoading>
    implements _$$_UnsendMessageStateLoadingCopyWith<$Res> {
  __$$_UnsendMessageStateLoadingCopyWithImpl(
      _$_UnsendMessageStateLoading _value,
      $Res Function(_$_UnsendMessageStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnsendMessageStateLoading implements _UnsendMessageStateLoading {
  const _$_UnsendMessageStateLoading();

  @override
  String toString() {
    return 'UnsendMessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsendMessageStateLoading);
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
    required TResult Function(_UnsendMessageStateInitial value) initial,
    required TResult Function(_UnsendMessageStateLoading value) loading,
    required TResult Function(_UnsendMessageStateSuccess value) success,
    required TResult Function(_UnsendMessageStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnsendMessageStateInitial value)? initial,
    TResult? Function(_UnsendMessageStateLoading value)? loading,
    TResult? Function(_UnsendMessageStateSuccess value)? success,
    TResult? Function(_UnsendMessageStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnsendMessageStateInitial value)? initial,
    TResult Function(_UnsendMessageStateLoading value)? loading,
    TResult Function(_UnsendMessageStateSuccess value)? success,
    TResult Function(_UnsendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UnsendMessageStateLoading implements UnsendMessageState {
  const factory _UnsendMessageStateLoading() = _$_UnsendMessageStateLoading;
}

/// @nodoc
abstract class _$$_UnsendMessageStateSuccessCopyWith<$Res> {
  factory _$$_UnsendMessageStateSuccessCopyWith(
          _$_UnsendMessageStateSuccess value,
          $Res Function(_$_UnsendMessageStateSuccess) then) =
      __$$_UnsendMessageStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_UnsendMessageStateSuccessCopyWithImpl<$Res>
    extends _$UnsendMessageStateCopyWithImpl<$Res, _$_UnsendMessageStateSuccess>
    implements _$$_UnsendMessageStateSuccessCopyWith<$Res> {
  __$$_UnsendMessageStateSuccessCopyWithImpl(
      _$_UnsendMessageStateSuccess _value,
      $Res Function(_$_UnsendMessageStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_UnsendMessageStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UnsendMessageStateSuccess implements _UnsendMessageStateSuccess {
  const _$_UnsendMessageStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'UnsendMessageState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsendMessageStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnsendMessageStateSuccessCopyWith<_$_UnsendMessageStateSuccess>
      get copyWith => __$$_UnsendMessageStateSuccessCopyWithImpl<
          _$_UnsendMessageStateSuccess>(this, _$identity);

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
    required TResult Function(_UnsendMessageStateInitial value) initial,
    required TResult Function(_UnsendMessageStateLoading value) loading,
    required TResult Function(_UnsendMessageStateSuccess value) success,
    required TResult Function(_UnsendMessageStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnsendMessageStateInitial value)? initial,
    TResult? Function(_UnsendMessageStateLoading value)? loading,
    TResult? Function(_UnsendMessageStateSuccess value)? success,
    TResult? Function(_UnsendMessageStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnsendMessageStateInitial value)? initial,
    TResult Function(_UnsendMessageStateLoading value)? loading,
    TResult Function(_UnsendMessageStateSuccess value)? success,
    TResult Function(_UnsendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _UnsendMessageStateSuccess implements UnsendMessageState {
  const factory _UnsendMessageStateSuccess(final bool result) =
      _$_UnsendMessageStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_UnsendMessageStateSuccessCopyWith<_$_UnsendMessageStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnsendMessageStateFailureCopyWith<$Res> {
  factory _$$_UnsendMessageStateFailureCopyWith(
          _$_UnsendMessageStateFailure value,
          $Res Function(_$_UnsendMessageStateFailure) then) =
      __$$_UnsendMessageStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_UnsendMessageStateFailureCopyWithImpl<$Res>
    extends _$UnsendMessageStateCopyWithImpl<$Res, _$_UnsendMessageStateFailure>
    implements _$$_UnsendMessageStateFailureCopyWith<$Res> {
  __$$_UnsendMessageStateFailureCopyWithImpl(
      _$_UnsendMessageStateFailure _value,
      $Res Function(_$_UnsendMessageStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UnsendMessageStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_UnsendMessageStateFailure implements _UnsendMessageStateFailure {
  const _$_UnsendMessageStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'UnsendMessageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsendMessageStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnsendMessageStateFailureCopyWith<_$_UnsendMessageStateFailure>
      get copyWith => __$$_UnsendMessageStateFailureCopyWithImpl<
          _$_UnsendMessageStateFailure>(this, _$identity);

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
    required TResult Function(_UnsendMessageStateInitial value) initial,
    required TResult Function(_UnsendMessageStateLoading value) loading,
    required TResult Function(_UnsendMessageStateSuccess value) success,
    required TResult Function(_UnsendMessageStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnsendMessageStateInitial value)? initial,
    TResult? Function(_UnsendMessageStateLoading value)? loading,
    TResult? Function(_UnsendMessageStateSuccess value)? success,
    TResult? Function(_UnsendMessageStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnsendMessageStateInitial value)? initial,
    TResult Function(_UnsendMessageStateLoading value)? loading,
    TResult Function(_UnsendMessageStateSuccess value)? success,
    TResult Function(_UnsendMessageStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UnsendMessageStateFailure implements UnsendMessageState {
  const factory _UnsendMessageStateFailure(final PeamanError error) =
      _$_UnsendMessageStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_UnsendMessageStateFailureCopyWith<_$_UnsendMessageStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReadChatState {
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
    required TResult Function(_ReadChatStateInitial value) initial,
    required TResult Function(_ReadChatStateLoading value) loading,
    required TResult Function(_ReadChatStateSuccess value) success,
    required TResult Function(_ReadChatStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReadChatStateInitial value)? initial,
    TResult? Function(_ReadChatStateLoading value)? loading,
    TResult? Function(_ReadChatStateSuccess value)? success,
    TResult? Function(_ReadChatStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadChatStateInitial value)? initial,
    TResult Function(_ReadChatStateLoading value)? loading,
    TResult Function(_ReadChatStateSuccess value)? success,
    TResult Function(_ReadChatStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadChatStateCopyWith<$Res> {
  factory $ReadChatStateCopyWith(
          ReadChatState value, $Res Function(ReadChatState) then) =
      _$ReadChatStateCopyWithImpl<$Res, ReadChatState>;
}

/// @nodoc
class _$ReadChatStateCopyWithImpl<$Res, $Val extends ReadChatState>
    implements $ReadChatStateCopyWith<$Res> {
  _$ReadChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ReadChatStateInitialCopyWith<$Res> {
  factory _$$_ReadChatStateInitialCopyWith(_$_ReadChatStateInitial value,
          $Res Function(_$_ReadChatStateInitial) then) =
      __$$_ReadChatStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReadChatStateInitialCopyWithImpl<$Res>
    extends _$ReadChatStateCopyWithImpl<$Res, _$_ReadChatStateInitial>
    implements _$$_ReadChatStateInitialCopyWith<$Res> {
  __$$_ReadChatStateInitialCopyWithImpl(_$_ReadChatStateInitial _value,
      $Res Function(_$_ReadChatStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReadChatStateInitial implements _ReadChatStateInitial {
  const _$_ReadChatStateInitial();

  @override
  String toString() {
    return 'ReadChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ReadChatStateInitial);
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
    required TResult Function(_ReadChatStateInitial value) initial,
    required TResult Function(_ReadChatStateLoading value) loading,
    required TResult Function(_ReadChatStateSuccess value) success,
    required TResult Function(_ReadChatStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReadChatStateInitial value)? initial,
    TResult? Function(_ReadChatStateLoading value)? loading,
    TResult? Function(_ReadChatStateSuccess value)? success,
    TResult? Function(_ReadChatStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadChatStateInitial value)? initial,
    TResult Function(_ReadChatStateLoading value)? loading,
    TResult Function(_ReadChatStateSuccess value)? success,
    TResult Function(_ReadChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ReadChatStateInitial implements ReadChatState {
  const factory _ReadChatStateInitial() = _$_ReadChatStateInitial;
}

/// @nodoc
abstract class _$$_ReadChatStateLoadingCopyWith<$Res> {
  factory _$$_ReadChatStateLoadingCopyWith(_$_ReadChatStateLoading value,
          $Res Function(_$_ReadChatStateLoading) then) =
      __$$_ReadChatStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReadChatStateLoadingCopyWithImpl<$Res>
    extends _$ReadChatStateCopyWithImpl<$Res, _$_ReadChatStateLoading>
    implements _$$_ReadChatStateLoadingCopyWith<$Res> {
  __$$_ReadChatStateLoadingCopyWithImpl(_$_ReadChatStateLoading _value,
      $Res Function(_$_ReadChatStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ReadChatStateLoading implements _ReadChatStateLoading {
  const _$_ReadChatStateLoading();

  @override
  String toString() {
    return 'ReadChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ReadChatStateLoading);
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
    required TResult Function(_ReadChatStateInitial value) initial,
    required TResult Function(_ReadChatStateLoading value) loading,
    required TResult Function(_ReadChatStateSuccess value) success,
    required TResult Function(_ReadChatStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReadChatStateInitial value)? initial,
    TResult? Function(_ReadChatStateLoading value)? loading,
    TResult? Function(_ReadChatStateSuccess value)? success,
    TResult? Function(_ReadChatStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadChatStateInitial value)? initial,
    TResult Function(_ReadChatStateLoading value)? loading,
    TResult Function(_ReadChatStateSuccess value)? success,
    TResult Function(_ReadChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ReadChatStateLoading implements ReadChatState {
  const factory _ReadChatStateLoading() = _$_ReadChatStateLoading;
}

/// @nodoc
abstract class _$$_ReadChatStateSuccessCopyWith<$Res> {
  factory _$$_ReadChatStateSuccessCopyWith(_$_ReadChatStateSuccess value,
          $Res Function(_$_ReadChatStateSuccess) then) =
      __$$_ReadChatStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_ReadChatStateSuccessCopyWithImpl<$Res>
    extends _$ReadChatStateCopyWithImpl<$Res, _$_ReadChatStateSuccess>
    implements _$$_ReadChatStateSuccessCopyWith<$Res> {
  __$$_ReadChatStateSuccessCopyWithImpl(_$_ReadChatStateSuccess _value,
      $Res Function(_$_ReadChatStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_ReadChatStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReadChatStateSuccess implements _ReadChatStateSuccess {
  const _$_ReadChatStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'ReadChatState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadChatStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadChatStateSuccessCopyWith<_$_ReadChatStateSuccess> get copyWith =>
      __$$_ReadChatStateSuccessCopyWithImpl<_$_ReadChatStateSuccess>(
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
    required TResult Function(_ReadChatStateInitial value) initial,
    required TResult Function(_ReadChatStateLoading value) loading,
    required TResult Function(_ReadChatStateSuccess value) success,
    required TResult Function(_ReadChatStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReadChatStateInitial value)? initial,
    TResult? Function(_ReadChatStateLoading value)? loading,
    TResult? Function(_ReadChatStateSuccess value)? success,
    TResult? Function(_ReadChatStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadChatStateInitial value)? initial,
    TResult Function(_ReadChatStateLoading value)? loading,
    TResult Function(_ReadChatStateSuccess value)? success,
    TResult Function(_ReadChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ReadChatStateSuccess implements ReadChatState {
  const factory _ReadChatStateSuccess(final bool result) =
      _$_ReadChatStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_ReadChatStateSuccessCopyWith<_$_ReadChatStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReadChatStateFailureCopyWith<$Res> {
  factory _$$_ReadChatStateFailureCopyWith(_$_ReadChatStateFailure value,
          $Res Function(_$_ReadChatStateFailure) then) =
      __$$_ReadChatStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_ReadChatStateFailureCopyWithImpl<$Res>
    extends _$ReadChatStateCopyWithImpl<$Res, _$_ReadChatStateFailure>
    implements _$$_ReadChatStateFailureCopyWith<$Res> {
  __$$_ReadChatStateFailureCopyWithImpl(_$_ReadChatStateFailure _value,
      $Res Function(_$_ReadChatStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ReadChatStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_ReadChatStateFailure implements _ReadChatStateFailure {
  const _$_ReadChatStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'ReadChatState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadChatStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadChatStateFailureCopyWith<_$_ReadChatStateFailure> get copyWith =>
      __$$_ReadChatStateFailureCopyWithImpl<_$_ReadChatStateFailure>(
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
    required TResult Function(_ReadChatStateInitial value) initial,
    required TResult Function(_ReadChatStateLoading value) loading,
    required TResult Function(_ReadChatStateSuccess value) success,
    required TResult Function(_ReadChatStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReadChatStateInitial value)? initial,
    TResult? Function(_ReadChatStateLoading value)? loading,
    TResult? Function(_ReadChatStateSuccess value)? success,
    TResult? Function(_ReadChatStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadChatStateInitial value)? initial,
    TResult Function(_ReadChatStateLoading value)? loading,
    TResult Function(_ReadChatStateSuccess value)? success,
    TResult Function(_ReadChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ReadChatStateFailure implements ReadChatState {
  const factory _ReadChatStateFailure(final PeamanError error) =
      _$_ReadChatStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_ReadChatStateFailureCopyWith<_$_ReadChatStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateChatState {
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
    required TResult Function(_UpdateChatStateInitial value) initial,
    required TResult Function(_UpdateChatStateLoading value) loading,
    required TResult Function(_UpdateChatStateSuccess value) success,
    required TResult Function(_UpdateChatStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateChatStateInitial value)? initial,
    TResult? Function(_UpdateChatStateLoading value)? loading,
    TResult? Function(_UpdateChatStateSuccess value)? success,
    TResult? Function(_UpdateChatStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateChatStateInitial value)? initial,
    TResult Function(_UpdateChatStateLoading value)? loading,
    TResult Function(_UpdateChatStateSuccess value)? success,
    TResult Function(_UpdateChatStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateChatStateCopyWith<$Res> {
  factory $UpdateChatStateCopyWith(
          UpdateChatState value, $Res Function(UpdateChatState) then) =
      _$UpdateChatStateCopyWithImpl<$Res, UpdateChatState>;
}

/// @nodoc
class _$UpdateChatStateCopyWithImpl<$Res, $Val extends UpdateChatState>
    implements $UpdateChatStateCopyWith<$Res> {
  _$UpdateChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UpdateChatStateInitialCopyWith<$Res> {
  factory _$$_UpdateChatStateInitialCopyWith(_$_UpdateChatStateInitial value,
          $Res Function(_$_UpdateChatStateInitial) then) =
      __$$_UpdateChatStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateChatStateInitialCopyWithImpl<$Res>
    extends _$UpdateChatStateCopyWithImpl<$Res, _$_UpdateChatStateInitial>
    implements _$$_UpdateChatStateInitialCopyWith<$Res> {
  __$$_UpdateChatStateInitialCopyWithImpl(_$_UpdateChatStateInitial _value,
      $Res Function(_$_UpdateChatStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateChatStateInitial implements _UpdateChatStateInitial {
  const _$_UpdateChatStateInitial();

  @override
  String toString() {
    return 'UpdateChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateChatStateInitial);
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
    required TResult Function(_UpdateChatStateInitial value) initial,
    required TResult Function(_UpdateChatStateLoading value) loading,
    required TResult Function(_UpdateChatStateSuccess value) success,
    required TResult Function(_UpdateChatStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateChatStateInitial value)? initial,
    TResult? Function(_UpdateChatStateLoading value)? loading,
    TResult? Function(_UpdateChatStateSuccess value)? success,
    TResult? Function(_UpdateChatStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateChatStateInitial value)? initial,
    TResult Function(_UpdateChatStateLoading value)? loading,
    TResult Function(_UpdateChatStateSuccess value)? success,
    TResult Function(_UpdateChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UpdateChatStateInitial implements UpdateChatState {
  const factory _UpdateChatStateInitial() = _$_UpdateChatStateInitial;
}

/// @nodoc
abstract class _$$_UpdateChatStateLoadingCopyWith<$Res> {
  factory _$$_UpdateChatStateLoadingCopyWith(_$_UpdateChatStateLoading value,
          $Res Function(_$_UpdateChatStateLoading) then) =
      __$$_UpdateChatStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateChatStateLoadingCopyWithImpl<$Res>
    extends _$UpdateChatStateCopyWithImpl<$Res, _$_UpdateChatStateLoading>
    implements _$$_UpdateChatStateLoadingCopyWith<$Res> {
  __$$_UpdateChatStateLoadingCopyWithImpl(_$_UpdateChatStateLoading _value,
      $Res Function(_$_UpdateChatStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateChatStateLoading implements _UpdateChatStateLoading {
  const _$_UpdateChatStateLoading();

  @override
  String toString() {
    return 'UpdateChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateChatStateLoading);
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
    required TResult Function(_UpdateChatStateInitial value) initial,
    required TResult Function(_UpdateChatStateLoading value) loading,
    required TResult Function(_UpdateChatStateSuccess value) success,
    required TResult Function(_UpdateChatStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateChatStateInitial value)? initial,
    TResult? Function(_UpdateChatStateLoading value)? loading,
    TResult? Function(_UpdateChatStateSuccess value)? success,
    TResult? Function(_UpdateChatStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateChatStateInitial value)? initial,
    TResult Function(_UpdateChatStateLoading value)? loading,
    TResult Function(_UpdateChatStateSuccess value)? success,
    TResult Function(_UpdateChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UpdateChatStateLoading implements UpdateChatState {
  const factory _UpdateChatStateLoading() = _$_UpdateChatStateLoading;
}

/// @nodoc
abstract class _$$_UpdateChatStateSuccessCopyWith<$Res> {
  factory _$$_UpdateChatStateSuccessCopyWith(_$_UpdateChatStateSuccess value,
          $Res Function(_$_UpdateChatStateSuccess) then) =
      __$$_UpdateChatStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_UpdateChatStateSuccessCopyWithImpl<$Res>
    extends _$UpdateChatStateCopyWithImpl<$Res, _$_UpdateChatStateSuccess>
    implements _$$_UpdateChatStateSuccessCopyWith<$Res> {
  __$$_UpdateChatStateSuccessCopyWithImpl(_$_UpdateChatStateSuccess _value,
      $Res Function(_$_UpdateChatStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_UpdateChatStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateChatStateSuccess implements _UpdateChatStateSuccess {
  const _$_UpdateChatStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'UpdateChatState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateChatStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateChatStateSuccessCopyWith<_$_UpdateChatStateSuccess> get copyWith =>
      __$$_UpdateChatStateSuccessCopyWithImpl<_$_UpdateChatStateSuccess>(
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
    required TResult Function(_UpdateChatStateInitial value) initial,
    required TResult Function(_UpdateChatStateLoading value) loading,
    required TResult Function(_UpdateChatStateSuccess value) success,
    required TResult Function(_UpdateChatStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateChatStateInitial value)? initial,
    TResult? Function(_UpdateChatStateLoading value)? loading,
    TResult? Function(_UpdateChatStateSuccess value)? success,
    TResult? Function(_UpdateChatStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateChatStateInitial value)? initial,
    TResult Function(_UpdateChatStateLoading value)? loading,
    TResult Function(_UpdateChatStateSuccess value)? success,
    TResult Function(_UpdateChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _UpdateChatStateSuccess implements UpdateChatState {
  const factory _UpdateChatStateSuccess(final bool result) =
      _$_UpdateChatStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_UpdateChatStateSuccessCopyWith<_$_UpdateChatStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateChatStateFailureCopyWith<$Res> {
  factory _$$_UpdateChatStateFailureCopyWith(_$_UpdateChatStateFailure value,
          $Res Function(_$_UpdateChatStateFailure) then) =
      __$$_UpdateChatStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_UpdateChatStateFailureCopyWithImpl<$Res>
    extends _$UpdateChatStateCopyWithImpl<$Res, _$_UpdateChatStateFailure>
    implements _$$_UpdateChatStateFailureCopyWith<$Res> {
  __$$_UpdateChatStateFailureCopyWithImpl(_$_UpdateChatStateFailure _value,
      $Res Function(_$_UpdateChatStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_UpdateChatStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_UpdateChatStateFailure implements _UpdateChatStateFailure {
  const _$_UpdateChatStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'UpdateChatState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateChatStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateChatStateFailureCopyWith<_$_UpdateChatStateFailure> get copyWith =>
      __$$_UpdateChatStateFailureCopyWithImpl<_$_UpdateChatStateFailure>(
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
    required TResult Function(_UpdateChatStateInitial value) initial,
    required TResult Function(_UpdateChatStateLoading value) loading,
    required TResult Function(_UpdateChatStateSuccess value) success,
    required TResult Function(_UpdateChatStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateChatStateInitial value)? initial,
    TResult? Function(_UpdateChatStateLoading value)? loading,
    TResult? Function(_UpdateChatStateSuccess value)? success,
    TResult? Function(_UpdateChatStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateChatStateInitial value)? initial,
    TResult Function(_UpdateChatStateLoading value)? loading,
    TResult Function(_UpdateChatStateSuccess value)? success,
    TResult Function(_UpdateChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UpdateChatStateFailure implements UpdateChatState {
  const factory _UpdateChatStateFailure(final PeamanError error) =
      _$_UpdateChatStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_UpdateChatStateFailureCopyWith<_$_UpdateChatStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeleteChatState {
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
    required TResult Function(_DeleteChatStateInitial value) initial,
    required TResult Function(_DeleteChatStateLoading value) loading,
    required TResult Function(_DeleteChatStateSuccess value) success,
    required TResult Function(_DeleteChatStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteChatStateInitial value)? initial,
    TResult? Function(_DeleteChatStateLoading value)? loading,
    TResult? Function(_DeleteChatStateSuccess value)? success,
    TResult? Function(_DeleteChatStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteChatStateInitial value)? initial,
    TResult Function(_DeleteChatStateLoading value)? loading,
    TResult Function(_DeleteChatStateSuccess value)? success,
    TResult Function(_DeleteChatStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteChatStateCopyWith<$Res> {
  factory $DeleteChatStateCopyWith(
          DeleteChatState value, $Res Function(DeleteChatState) then) =
      _$DeleteChatStateCopyWithImpl<$Res, DeleteChatState>;
}

/// @nodoc
class _$DeleteChatStateCopyWithImpl<$Res, $Val extends DeleteChatState>
    implements $DeleteChatStateCopyWith<$Res> {
  _$DeleteChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DeleteChatStateInitialCopyWith<$Res> {
  factory _$$_DeleteChatStateInitialCopyWith(_$_DeleteChatStateInitial value,
          $Res Function(_$_DeleteChatStateInitial) then) =
      __$$_DeleteChatStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteChatStateInitialCopyWithImpl<$Res>
    extends _$DeleteChatStateCopyWithImpl<$Res, _$_DeleteChatStateInitial>
    implements _$$_DeleteChatStateInitialCopyWith<$Res> {
  __$$_DeleteChatStateInitialCopyWithImpl(_$_DeleteChatStateInitial _value,
      $Res Function(_$_DeleteChatStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteChatStateInitial implements _DeleteChatStateInitial {
  const _$_DeleteChatStateInitial();

  @override
  String toString() {
    return 'DeleteChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteChatStateInitial);
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
    required TResult Function(_DeleteChatStateInitial value) initial,
    required TResult Function(_DeleteChatStateLoading value) loading,
    required TResult Function(_DeleteChatStateSuccess value) success,
    required TResult Function(_DeleteChatStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteChatStateInitial value)? initial,
    TResult? Function(_DeleteChatStateLoading value)? loading,
    TResult? Function(_DeleteChatStateSuccess value)? success,
    TResult? Function(_DeleteChatStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteChatStateInitial value)? initial,
    TResult Function(_DeleteChatStateLoading value)? loading,
    TResult Function(_DeleteChatStateSuccess value)? success,
    TResult Function(_DeleteChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _DeleteChatStateInitial implements DeleteChatState {
  const factory _DeleteChatStateInitial() = _$_DeleteChatStateInitial;
}

/// @nodoc
abstract class _$$_DeleteChatStateLoadingCopyWith<$Res> {
  factory _$$_DeleteChatStateLoadingCopyWith(_$_DeleteChatStateLoading value,
          $Res Function(_$_DeleteChatStateLoading) then) =
      __$$_DeleteChatStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteChatStateLoadingCopyWithImpl<$Res>
    extends _$DeleteChatStateCopyWithImpl<$Res, _$_DeleteChatStateLoading>
    implements _$$_DeleteChatStateLoadingCopyWith<$Res> {
  __$$_DeleteChatStateLoadingCopyWithImpl(_$_DeleteChatStateLoading _value,
      $Res Function(_$_DeleteChatStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteChatStateLoading implements _DeleteChatStateLoading {
  const _$_DeleteChatStateLoading();

  @override
  String toString() {
    return 'DeleteChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteChatStateLoading);
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
    required TResult Function(_DeleteChatStateInitial value) initial,
    required TResult Function(_DeleteChatStateLoading value) loading,
    required TResult Function(_DeleteChatStateSuccess value) success,
    required TResult Function(_DeleteChatStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteChatStateInitial value)? initial,
    TResult? Function(_DeleteChatStateLoading value)? loading,
    TResult? Function(_DeleteChatStateSuccess value)? success,
    TResult? Function(_DeleteChatStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteChatStateInitial value)? initial,
    TResult Function(_DeleteChatStateLoading value)? loading,
    TResult Function(_DeleteChatStateSuccess value)? success,
    TResult Function(_DeleteChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DeleteChatStateLoading implements DeleteChatState {
  const factory _DeleteChatStateLoading() = _$_DeleteChatStateLoading;
}

/// @nodoc
abstract class _$$_DeleteChatStateSuccessCopyWith<$Res> {
  factory _$$_DeleteChatStateSuccessCopyWith(_$_DeleteChatStateSuccess value,
          $Res Function(_$_DeleteChatStateSuccess) then) =
      __$$_DeleteChatStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_DeleteChatStateSuccessCopyWithImpl<$Res>
    extends _$DeleteChatStateCopyWithImpl<$Res, _$_DeleteChatStateSuccess>
    implements _$$_DeleteChatStateSuccessCopyWith<$Res> {
  __$$_DeleteChatStateSuccessCopyWithImpl(_$_DeleteChatStateSuccess _value,
      $Res Function(_$_DeleteChatStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_DeleteChatStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DeleteChatStateSuccess implements _DeleteChatStateSuccess {
  const _$_DeleteChatStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'DeleteChatState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteChatStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteChatStateSuccessCopyWith<_$_DeleteChatStateSuccess> get copyWith =>
      __$$_DeleteChatStateSuccessCopyWithImpl<_$_DeleteChatStateSuccess>(
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
    required TResult Function(_DeleteChatStateInitial value) initial,
    required TResult Function(_DeleteChatStateLoading value) loading,
    required TResult Function(_DeleteChatStateSuccess value) success,
    required TResult Function(_DeleteChatStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteChatStateInitial value)? initial,
    TResult? Function(_DeleteChatStateLoading value)? loading,
    TResult? Function(_DeleteChatStateSuccess value)? success,
    TResult? Function(_DeleteChatStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteChatStateInitial value)? initial,
    TResult Function(_DeleteChatStateLoading value)? loading,
    TResult Function(_DeleteChatStateSuccess value)? success,
    TResult Function(_DeleteChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _DeleteChatStateSuccess implements DeleteChatState {
  const factory _DeleteChatStateSuccess(final bool result) =
      _$_DeleteChatStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_DeleteChatStateSuccessCopyWith<_$_DeleteChatStateSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteChatStateFailureCopyWith<$Res> {
  factory _$$_DeleteChatStateFailureCopyWith(_$_DeleteChatStateFailure value,
          $Res Function(_$_DeleteChatStateFailure) then) =
      __$$_DeleteChatStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_DeleteChatStateFailureCopyWithImpl<$Res>
    extends _$DeleteChatStateCopyWithImpl<$Res, _$_DeleteChatStateFailure>
    implements _$$_DeleteChatStateFailureCopyWith<$Res> {
  __$$_DeleteChatStateFailureCopyWithImpl(_$_DeleteChatStateFailure _value,
      $Res Function(_$_DeleteChatStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_DeleteChatStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_DeleteChatStateFailure implements _DeleteChatStateFailure {
  const _$_DeleteChatStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'DeleteChatState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteChatStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteChatStateFailureCopyWith<_$_DeleteChatStateFailure> get copyWith =>
      __$$_DeleteChatStateFailureCopyWithImpl<_$_DeleteChatStateFailure>(
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
    required TResult Function(_DeleteChatStateInitial value) initial,
    required TResult Function(_DeleteChatStateLoading value) loading,
    required TResult Function(_DeleteChatStateSuccess value) success,
    required TResult Function(_DeleteChatStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteChatStateInitial value)? initial,
    TResult? Function(_DeleteChatStateLoading value)? loading,
    TResult? Function(_DeleteChatStateSuccess value)? success,
    TResult? Function(_DeleteChatStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteChatStateInitial value)? initial,
    TResult Function(_DeleteChatStateLoading value)? loading,
    TResult Function(_DeleteChatStateSuccess value)? success,
    TResult Function(_DeleteChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _DeleteChatStateFailure implements DeleteChatState {
  const factory _DeleteChatStateFailure(final PeamanError error) =
      _$_DeleteChatStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_DeleteChatStateFailureCopyWith<_$_DeleteChatStateFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArchiveChatState {
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
    required TResult Function(_ArchiveChatStateInitial value) initial,
    required TResult Function(_ArchiveChatStateLoading value) loading,
    required TResult Function(_ArchiveChatStateSuccess value) success,
    required TResult Function(_ArchiveChatStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ArchiveChatStateInitial value)? initial,
    TResult? Function(_ArchiveChatStateLoading value)? loading,
    TResult? Function(_ArchiveChatStateSuccess value)? success,
    TResult? Function(_ArchiveChatStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ArchiveChatStateInitial value)? initial,
    TResult Function(_ArchiveChatStateLoading value)? loading,
    TResult Function(_ArchiveChatStateSuccess value)? success,
    TResult Function(_ArchiveChatStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArchiveChatStateCopyWith<$Res> {
  factory $ArchiveChatStateCopyWith(
          ArchiveChatState value, $Res Function(ArchiveChatState) then) =
      _$ArchiveChatStateCopyWithImpl<$Res, ArchiveChatState>;
}

/// @nodoc
class _$ArchiveChatStateCopyWithImpl<$Res, $Val extends ArchiveChatState>
    implements $ArchiveChatStateCopyWith<$Res> {
  _$ArchiveChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ArchiveChatStateInitialCopyWith<$Res> {
  factory _$$_ArchiveChatStateInitialCopyWith(_$_ArchiveChatStateInitial value,
          $Res Function(_$_ArchiveChatStateInitial) then) =
      __$$_ArchiveChatStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ArchiveChatStateInitialCopyWithImpl<$Res>
    extends _$ArchiveChatStateCopyWithImpl<$Res, _$_ArchiveChatStateInitial>
    implements _$$_ArchiveChatStateInitialCopyWith<$Res> {
  __$$_ArchiveChatStateInitialCopyWithImpl(_$_ArchiveChatStateInitial _value,
      $Res Function(_$_ArchiveChatStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ArchiveChatStateInitial implements _ArchiveChatStateInitial {
  const _$_ArchiveChatStateInitial();

  @override
  String toString() {
    return 'ArchiveChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveChatStateInitial);
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
    required TResult Function(_ArchiveChatStateInitial value) initial,
    required TResult Function(_ArchiveChatStateLoading value) loading,
    required TResult Function(_ArchiveChatStateSuccess value) success,
    required TResult Function(_ArchiveChatStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ArchiveChatStateInitial value)? initial,
    TResult? Function(_ArchiveChatStateLoading value)? loading,
    TResult? Function(_ArchiveChatStateSuccess value)? success,
    TResult? Function(_ArchiveChatStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ArchiveChatStateInitial value)? initial,
    TResult Function(_ArchiveChatStateLoading value)? loading,
    TResult Function(_ArchiveChatStateSuccess value)? success,
    TResult Function(_ArchiveChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ArchiveChatStateInitial implements ArchiveChatState {
  const factory _ArchiveChatStateInitial() = _$_ArchiveChatStateInitial;
}

/// @nodoc
abstract class _$$_ArchiveChatStateLoadingCopyWith<$Res> {
  factory _$$_ArchiveChatStateLoadingCopyWith(_$_ArchiveChatStateLoading value,
          $Res Function(_$_ArchiveChatStateLoading) then) =
      __$$_ArchiveChatStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ArchiveChatStateLoadingCopyWithImpl<$Res>
    extends _$ArchiveChatStateCopyWithImpl<$Res, _$_ArchiveChatStateLoading>
    implements _$$_ArchiveChatStateLoadingCopyWith<$Res> {
  __$$_ArchiveChatStateLoadingCopyWithImpl(_$_ArchiveChatStateLoading _value,
      $Res Function(_$_ArchiveChatStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ArchiveChatStateLoading implements _ArchiveChatStateLoading {
  const _$_ArchiveChatStateLoading();

  @override
  String toString() {
    return 'ArchiveChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveChatStateLoading);
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
    required TResult Function(_ArchiveChatStateInitial value) initial,
    required TResult Function(_ArchiveChatStateLoading value) loading,
    required TResult Function(_ArchiveChatStateSuccess value) success,
    required TResult Function(_ArchiveChatStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ArchiveChatStateInitial value)? initial,
    TResult? Function(_ArchiveChatStateLoading value)? loading,
    TResult? Function(_ArchiveChatStateSuccess value)? success,
    TResult? Function(_ArchiveChatStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ArchiveChatStateInitial value)? initial,
    TResult Function(_ArchiveChatStateLoading value)? loading,
    TResult Function(_ArchiveChatStateSuccess value)? success,
    TResult Function(_ArchiveChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ArchiveChatStateLoading implements ArchiveChatState {
  const factory _ArchiveChatStateLoading() = _$_ArchiveChatStateLoading;
}

/// @nodoc
abstract class _$$_ArchiveChatStateSuccessCopyWith<$Res> {
  factory _$$_ArchiveChatStateSuccessCopyWith(_$_ArchiveChatStateSuccess value,
          $Res Function(_$_ArchiveChatStateSuccess) then) =
      __$$_ArchiveChatStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_ArchiveChatStateSuccessCopyWithImpl<$Res>
    extends _$ArchiveChatStateCopyWithImpl<$Res, _$_ArchiveChatStateSuccess>
    implements _$$_ArchiveChatStateSuccessCopyWith<$Res> {
  __$$_ArchiveChatStateSuccessCopyWithImpl(_$_ArchiveChatStateSuccess _value,
      $Res Function(_$_ArchiveChatStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_ArchiveChatStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ArchiveChatStateSuccess implements _ArchiveChatStateSuccess {
  const _$_ArchiveChatStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'ArchiveChatState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveChatStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArchiveChatStateSuccessCopyWith<_$_ArchiveChatStateSuccess>
      get copyWith =>
          __$$_ArchiveChatStateSuccessCopyWithImpl<_$_ArchiveChatStateSuccess>(
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
    required TResult Function(_ArchiveChatStateInitial value) initial,
    required TResult Function(_ArchiveChatStateLoading value) loading,
    required TResult Function(_ArchiveChatStateSuccess value) success,
    required TResult Function(_ArchiveChatStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ArchiveChatStateInitial value)? initial,
    TResult? Function(_ArchiveChatStateLoading value)? loading,
    TResult? Function(_ArchiveChatStateSuccess value)? success,
    TResult? Function(_ArchiveChatStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ArchiveChatStateInitial value)? initial,
    TResult Function(_ArchiveChatStateLoading value)? loading,
    TResult Function(_ArchiveChatStateSuccess value)? success,
    TResult Function(_ArchiveChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ArchiveChatStateSuccess implements ArchiveChatState {
  const factory _ArchiveChatStateSuccess(final bool result) =
      _$_ArchiveChatStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_ArchiveChatStateSuccessCopyWith<_$_ArchiveChatStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ArchiveChatStateFailureCopyWith<$Res> {
  factory _$$_ArchiveChatStateFailureCopyWith(_$_ArchiveChatStateFailure value,
          $Res Function(_$_ArchiveChatStateFailure) then) =
      __$$_ArchiveChatStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_ArchiveChatStateFailureCopyWithImpl<$Res>
    extends _$ArchiveChatStateCopyWithImpl<$Res, _$_ArchiveChatStateFailure>
    implements _$$_ArchiveChatStateFailureCopyWith<$Res> {
  __$$_ArchiveChatStateFailureCopyWithImpl(_$_ArchiveChatStateFailure _value,
      $Res Function(_$_ArchiveChatStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ArchiveChatStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_ArchiveChatStateFailure implements _ArchiveChatStateFailure {
  const _$_ArchiveChatStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'ArchiveChatState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArchiveChatStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArchiveChatStateFailureCopyWith<_$_ArchiveChatStateFailure>
      get copyWith =>
          __$$_ArchiveChatStateFailureCopyWithImpl<_$_ArchiveChatStateFailure>(
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
    required TResult Function(_ArchiveChatStateInitial value) initial,
    required TResult Function(_ArchiveChatStateLoading value) loading,
    required TResult Function(_ArchiveChatStateSuccess value) success,
    required TResult Function(_ArchiveChatStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ArchiveChatStateInitial value)? initial,
    TResult? Function(_ArchiveChatStateLoading value)? loading,
    TResult? Function(_ArchiveChatStateSuccess value)? success,
    TResult? Function(_ArchiveChatStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ArchiveChatStateInitial value)? initial,
    TResult Function(_ArchiveChatStateLoading value)? loading,
    TResult Function(_ArchiveChatStateSuccess value)? success,
    TResult Function(_ArchiveChatStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ArchiveChatStateFailure implements ArchiveChatState {
  const factory _ArchiveChatStateFailure(final PeamanError error) =
      _$_ArchiveChatStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_ArchiveChatStateFailureCopyWith<_$_ArchiveChatStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SetTypingStatusState {
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
    required TResult Function(_SetTypingStatusStateInitial value) initial,
    required TResult Function(_SetTypingStatusStateLoading value) loading,
    required TResult Function(_SetTypingStatusStateSuccess value) success,
    required TResult Function(_SetTypingStatusStateFailure value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetTypingStatusStateInitial value)? initial,
    TResult? Function(_SetTypingStatusStateLoading value)? loading,
    TResult? Function(_SetTypingStatusStateSuccess value)? success,
    TResult? Function(_SetTypingStatusStateFailure value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTypingStatusStateInitial value)? initial,
    TResult Function(_SetTypingStatusStateLoading value)? loading,
    TResult Function(_SetTypingStatusStateSuccess value)? success,
    TResult Function(_SetTypingStatusStateFailure value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetTypingStatusStateCopyWith<$Res> {
  factory $SetTypingStatusStateCopyWith(SetTypingStatusState value,
          $Res Function(SetTypingStatusState) then) =
      _$SetTypingStatusStateCopyWithImpl<$Res, SetTypingStatusState>;
}

/// @nodoc
class _$SetTypingStatusStateCopyWithImpl<$Res,
        $Val extends SetTypingStatusState>
    implements $SetTypingStatusStateCopyWith<$Res> {
  _$SetTypingStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SetTypingStatusStateInitialCopyWith<$Res> {
  factory _$$_SetTypingStatusStateInitialCopyWith(
          _$_SetTypingStatusStateInitial value,
          $Res Function(_$_SetTypingStatusStateInitial) then) =
      __$$_SetTypingStatusStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetTypingStatusStateInitialCopyWithImpl<$Res>
    extends _$SetTypingStatusStateCopyWithImpl<$Res,
        _$_SetTypingStatusStateInitial>
    implements _$$_SetTypingStatusStateInitialCopyWith<$Res> {
  __$$_SetTypingStatusStateInitialCopyWithImpl(
      _$_SetTypingStatusStateInitial _value,
      $Res Function(_$_SetTypingStatusStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetTypingStatusStateInitial implements _SetTypingStatusStateInitial {
  const _$_SetTypingStatusStateInitial();

  @override
  String toString() {
    return 'SetTypingStatusState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTypingStatusStateInitial);
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
    required TResult Function(_SetTypingStatusStateInitial value) initial,
    required TResult Function(_SetTypingStatusStateLoading value) loading,
    required TResult Function(_SetTypingStatusStateSuccess value) success,
    required TResult Function(_SetTypingStatusStateFailure value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetTypingStatusStateInitial value)? initial,
    TResult? Function(_SetTypingStatusStateLoading value)? loading,
    TResult? Function(_SetTypingStatusStateSuccess value)? success,
    TResult? Function(_SetTypingStatusStateFailure value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTypingStatusStateInitial value)? initial,
    TResult Function(_SetTypingStatusStateLoading value)? loading,
    TResult Function(_SetTypingStatusStateSuccess value)? success,
    TResult Function(_SetTypingStatusStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SetTypingStatusStateInitial implements SetTypingStatusState {
  const factory _SetTypingStatusStateInitial() = _$_SetTypingStatusStateInitial;
}

/// @nodoc
abstract class _$$_SetTypingStatusStateLoadingCopyWith<$Res> {
  factory _$$_SetTypingStatusStateLoadingCopyWith(
          _$_SetTypingStatusStateLoading value,
          $Res Function(_$_SetTypingStatusStateLoading) then) =
      __$$_SetTypingStatusStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetTypingStatusStateLoadingCopyWithImpl<$Res>
    extends _$SetTypingStatusStateCopyWithImpl<$Res,
        _$_SetTypingStatusStateLoading>
    implements _$$_SetTypingStatusStateLoadingCopyWith<$Res> {
  __$$_SetTypingStatusStateLoadingCopyWithImpl(
      _$_SetTypingStatusStateLoading _value,
      $Res Function(_$_SetTypingStatusStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetTypingStatusStateLoading implements _SetTypingStatusStateLoading {
  const _$_SetTypingStatusStateLoading();

  @override
  String toString() {
    return 'SetTypingStatusState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTypingStatusStateLoading);
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
    required TResult Function(_SetTypingStatusStateInitial value) initial,
    required TResult Function(_SetTypingStatusStateLoading value) loading,
    required TResult Function(_SetTypingStatusStateSuccess value) success,
    required TResult Function(_SetTypingStatusStateFailure value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetTypingStatusStateInitial value)? initial,
    TResult? Function(_SetTypingStatusStateLoading value)? loading,
    TResult? Function(_SetTypingStatusStateSuccess value)? success,
    TResult? Function(_SetTypingStatusStateFailure value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTypingStatusStateInitial value)? initial,
    TResult Function(_SetTypingStatusStateLoading value)? loading,
    TResult Function(_SetTypingStatusStateSuccess value)? success,
    TResult Function(_SetTypingStatusStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SetTypingStatusStateLoading implements SetTypingStatusState {
  const factory _SetTypingStatusStateLoading() = _$_SetTypingStatusStateLoading;
}

/// @nodoc
abstract class _$$_SetTypingStatusStateSuccessCopyWith<$Res> {
  factory _$$_SetTypingStatusStateSuccessCopyWith(
          _$_SetTypingStatusStateSuccess value,
          $Res Function(_$_SetTypingStatusStateSuccess) then) =
      __$$_SetTypingStatusStateSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$_SetTypingStatusStateSuccessCopyWithImpl<$Res>
    extends _$SetTypingStatusStateCopyWithImpl<$Res,
        _$_SetTypingStatusStateSuccess>
    implements _$$_SetTypingStatusStateSuccessCopyWith<$Res> {
  __$$_SetTypingStatusStateSuccessCopyWithImpl(
      _$_SetTypingStatusStateSuccess _value,
      $Res Function(_$_SetTypingStatusStateSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_SetTypingStatusStateSuccess(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SetTypingStatusStateSuccess implements _SetTypingStatusStateSuccess {
  const _$_SetTypingStatusStateSuccess(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'SetTypingStatusState.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTypingStatusStateSuccess &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetTypingStatusStateSuccessCopyWith<_$_SetTypingStatusStateSuccess>
      get copyWith => __$$_SetTypingStatusStateSuccessCopyWithImpl<
          _$_SetTypingStatusStateSuccess>(this, _$identity);

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
    required TResult Function(_SetTypingStatusStateInitial value) initial,
    required TResult Function(_SetTypingStatusStateLoading value) loading,
    required TResult Function(_SetTypingStatusStateSuccess value) success,
    required TResult Function(_SetTypingStatusStateFailure value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetTypingStatusStateInitial value)? initial,
    TResult? Function(_SetTypingStatusStateLoading value)? loading,
    TResult? Function(_SetTypingStatusStateSuccess value)? success,
    TResult? Function(_SetTypingStatusStateFailure value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTypingStatusStateInitial value)? initial,
    TResult Function(_SetTypingStatusStateLoading value)? loading,
    TResult Function(_SetTypingStatusStateSuccess value)? success,
    TResult Function(_SetTypingStatusStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SetTypingStatusStateSuccess implements SetTypingStatusState {
  const factory _SetTypingStatusStateSuccess(final bool result) =
      _$_SetTypingStatusStateSuccess;

  bool get result;
  @JsonKey(ignore: true)
  _$$_SetTypingStatusStateSuccessCopyWith<_$_SetTypingStatusStateSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetTypingStatusStateFailureCopyWith<$Res> {
  factory _$$_SetTypingStatusStateFailureCopyWith(
          _$_SetTypingStatusStateFailure value,
          $Res Function(_$_SetTypingStatusStateFailure) then) =
      __$$_SetTypingStatusStateFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});
}

/// @nodoc
class __$$_SetTypingStatusStateFailureCopyWithImpl<$Res>
    extends _$SetTypingStatusStateCopyWithImpl<$Res,
        _$_SetTypingStatusStateFailure>
    implements _$$_SetTypingStatusStateFailureCopyWith<$Res> {
  __$$_SetTypingStatusStateFailureCopyWithImpl(
      _$_SetTypingStatusStateFailure _value,
      $Res Function(_$_SetTypingStatusStateFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_SetTypingStatusStateFailure(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as PeamanError,
    ));
  }
}

/// @nodoc

class _$_SetTypingStatusStateFailure implements _SetTypingStatusStateFailure {
  const _$_SetTypingStatusStateFailure(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'SetTypingStatusState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTypingStatusStateFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetTypingStatusStateFailureCopyWith<_$_SetTypingStatusStateFailure>
      get copyWith => __$$_SetTypingStatusStateFailureCopyWithImpl<
          _$_SetTypingStatusStateFailure>(this, _$identity);

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
    required TResult Function(_SetTypingStatusStateInitial value) initial,
    required TResult Function(_SetTypingStatusStateLoading value) loading,
    required TResult Function(_SetTypingStatusStateSuccess value) success,
    required TResult Function(_SetTypingStatusStateFailure value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetTypingStatusStateInitial value)? initial,
    TResult? Function(_SetTypingStatusStateLoading value)? loading,
    TResult? Function(_SetTypingStatusStateSuccess value)? success,
    TResult? Function(_SetTypingStatusStateFailure value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetTypingStatusStateInitial value)? initial,
    TResult Function(_SetTypingStatusStateLoading value)? loading,
    TResult Function(_SetTypingStatusStateSuccess value)? success,
    TResult Function(_SetTypingStatusStateFailure value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SetTypingStatusStateFailure implements SetTypingStatusState {
  const factory _SetTypingStatusStateFailure(final PeamanError error) =
      _$_SetTypingStatusStateFailure;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$_SetTypingStatusStateFailureCopyWith<_$_SetTypingStatusStateFailure>
      get copyWith => throw _privateConstructorUsedError;
}
