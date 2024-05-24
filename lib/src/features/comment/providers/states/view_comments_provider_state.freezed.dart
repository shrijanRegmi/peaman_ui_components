// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_comments_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewCommentsProviderState {
  /// The state of fetching the comments for the feed.
  FetchFeedCommentsState get fetchFeedCommentsState =>
      throw _privateConstructorUsedError;

  /// The state of commenting on the feed.
  PostFeedCommentState get postFeedCommentState =>
      throw _privateConstructorUsedError;

  /// The state of reply to a comment.
  PostCommentReplyState get postCommentReplyState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewCommentsProviderStateCopyWith<ViewCommentsProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewCommentsProviderStateCopyWith<$Res> {
  factory $ViewCommentsProviderStateCopyWith(ViewCommentsProviderState value,
          $Res Function(ViewCommentsProviderState) then) =
      _$ViewCommentsProviderStateCopyWithImpl<$Res, ViewCommentsProviderState>;
  @useResult
  $Res call(
      {FetchFeedCommentsState fetchFeedCommentsState,
      PostFeedCommentState postFeedCommentState,
      PostCommentReplyState postCommentReplyState});

  $FetchFeedCommentsStateCopyWith<$Res> get fetchFeedCommentsState;
  $PostFeedCommentStateCopyWith<$Res> get postFeedCommentState;
  $PostCommentReplyStateCopyWith<$Res> get postCommentReplyState;
}

/// @nodoc
class _$ViewCommentsProviderStateCopyWithImpl<$Res,
        $Val extends ViewCommentsProviderState>
    implements $ViewCommentsProviderStateCopyWith<$Res> {
  _$ViewCommentsProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchFeedCommentsState = null,
    Object? postFeedCommentState = null,
    Object? postCommentReplyState = null,
  }) {
    return _then(_value.copyWith(
      fetchFeedCommentsState: null == fetchFeedCommentsState
          ? _value.fetchFeedCommentsState
          : fetchFeedCommentsState // ignore: cast_nullable_to_non_nullable
              as FetchFeedCommentsState,
      postFeedCommentState: null == postFeedCommentState
          ? _value.postFeedCommentState
          : postFeedCommentState // ignore: cast_nullable_to_non_nullable
              as PostFeedCommentState,
      postCommentReplyState: null == postCommentReplyState
          ? _value.postCommentReplyState
          : postCommentReplyState // ignore: cast_nullable_to_non_nullable
              as PostCommentReplyState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FetchFeedCommentsStateCopyWith<$Res> get fetchFeedCommentsState {
    return $FetchFeedCommentsStateCopyWith<$Res>(_value.fetchFeedCommentsState,
        (value) {
      return _then(_value.copyWith(fetchFeedCommentsState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostFeedCommentStateCopyWith<$Res> get postFeedCommentState {
    return $PostFeedCommentStateCopyWith<$Res>(_value.postFeedCommentState,
        (value) {
      return _then(_value.copyWith(postFeedCommentState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PostCommentReplyStateCopyWith<$Res> get postCommentReplyState {
    return $PostCommentReplyStateCopyWith<$Res>(_value.postCommentReplyState,
        (value) {
      return _then(_value.copyWith(postCommentReplyState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewCommentsProviderStateImplCopyWith<$Res>
    implements $ViewCommentsProviderStateCopyWith<$Res> {
  factory _$$ViewCommentsProviderStateImplCopyWith(
          _$ViewCommentsProviderStateImpl value,
          $Res Function(_$ViewCommentsProviderStateImpl) then) =
      __$$ViewCommentsProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchFeedCommentsState fetchFeedCommentsState,
      PostFeedCommentState postFeedCommentState,
      PostCommentReplyState postCommentReplyState});

  @override
  $FetchFeedCommentsStateCopyWith<$Res> get fetchFeedCommentsState;
  @override
  $PostFeedCommentStateCopyWith<$Res> get postFeedCommentState;
  @override
  $PostCommentReplyStateCopyWith<$Res> get postCommentReplyState;
}

/// @nodoc
class __$$ViewCommentsProviderStateImplCopyWithImpl<$Res>
    extends _$ViewCommentsProviderStateCopyWithImpl<$Res,
        _$ViewCommentsProviderStateImpl>
    implements _$$ViewCommentsProviderStateImplCopyWith<$Res> {
  __$$ViewCommentsProviderStateImplCopyWithImpl(
      _$ViewCommentsProviderStateImpl _value,
      $Res Function(_$ViewCommentsProviderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchFeedCommentsState = null,
    Object? postFeedCommentState = null,
    Object? postCommentReplyState = null,
  }) {
    return _then(_$ViewCommentsProviderStateImpl(
      fetchFeedCommentsState: null == fetchFeedCommentsState
          ? _value.fetchFeedCommentsState
          : fetchFeedCommentsState // ignore: cast_nullable_to_non_nullable
              as FetchFeedCommentsState,
      postFeedCommentState: null == postFeedCommentState
          ? _value.postFeedCommentState
          : postFeedCommentState // ignore: cast_nullable_to_non_nullable
              as PostFeedCommentState,
      postCommentReplyState: null == postCommentReplyState
          ? _value.postCommentReplyState
          : postCommentReplyState // ignore: cast_nullable_to_non_nullable
              as PostCommentReplyState,
    ));
  }
}

/// @nodoc

class _$ViewCommentsProviderStateImpl implements _ViewCommentsProviderState {
  const _$ViewCommentsProviderStateImpl(
      {this.fetchFeedCommentsState = const FetchFeedCommentsState.initial(),
      this.postFeedCommentState = const PostFeedCommentState.initial(),
      this.postCommentReplyState = const PostCommentReplyState.initial()});

  /// The state of fetching the comments for the feed.
  @override
  @JsonKey()
  final FetchFeedCommentsState fetchFeedCommentsState;

  /// The state of commenting on the feed.
  @override
  @JsonKey()
  final PostFeedCommentState postFeedCommentState;

  /// The state of reply to a comment.
  @override
  @JsonKey()
  final PostCommentReplyState postCommentReplyState;

  @override
  String toString() {
    return 'ViewCommentsProviderState(fetchFeedCommentsState: $fetchFeedCommentsState, postFeedCommentState: $postFeedCommentState, postCommentReplyState: $postCommentReplyState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewCommentsProviderStateImpl &&
            (identical(other.fetchFeedCommentsState, fetchFeedCommentsState) ||
                other.fetchFeedCommentsState == fetchFeedCommentsState) &&
            (identical(other.postFeedCommentState, postFeedCommentState) ||
                other.postFeedCommentState == postFeedCommentState) &&
            (identical(other.postCommentReplyState, postCommentReplyState) ||
                other.postCommentReplyState == postCommentReplyState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchFeedCommentsState,
      postFeedCommentState, postCommentReplyState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewCommentsProviderStateImplCopyWith<_$ViewCommentsProviderStateImpl>
      get copyWith => __$$ViewCommentsProviderStateImplCopyWithImpl<
          _$ViewCommentsProviderStateImpl>(this, _$identity);
}

abstract class _ViewCommentsProviderState implements ViewCommentsProviderState {
  const factory _ViewCommentsProviderState(
          {final FetchFeedCommentsState fetchFeedCommentsState,
          final PostFeedCommentState postFeedCommentState,
          final PostCommentReplyState postCommentReplyState}) =
      _$ViewCommentsProviderStateImpl;

  @override

  /// The state of fetching the comments for the feed.
  FetchFeedCommentsState get fetchFeedCommentsState;
  @override

  /// The state of commenting on the feed.
  PostFeedCommentState get postFeedCommentState;
  @override

  /// The state of reply to a comment.
  PostCommentReplyState get postCommentReplyState;
  @override
  @JsonKey(ignore: true)
  _$$ViewCommentsProviderStateImplCopyWith<_$ViewCommentsProviderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FetchFeedCommentsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PeamanComment> result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PeamanComment> result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PeamanComment> result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFeedCommentsStateInitial value) initial,
    required TResult Function(_FetchFeedCommentsStateLoading value) loading,
    required TResult Function(_FetchFeedCommentsStateSuccess value) success,
    required TResult Function(_FetchFeedCommentsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult? Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult? Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult? Function(_FetchFeedCommentsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult Function(_FetchFeedCommentsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchFeedCommentsStateCopyWith<$Res> {
  factory $FetchFeedCommentsStateCopyWith(FetchFeedCommentsState value,
          $Res Function(FetchFeedCommentsState) then) =
      _$FetchFeedCommentsStateCopyWithImpl<$Res, FetchFeedCommentsState>;
}

/// @nodoc
class _$FetchFeedCommentsStateCopyWithImpl<$Res,
        $Val extends FetchFeedCommentsState>
    implements $FetchFeedCommentsStateCopyWith<$Res> {
  _$FetchFeedCommentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchFeedCommentsStateInitialImplCopyWith<$Res> {
  factory _$$FetchFeedCommentsStateInitialImplCopyWith(
          _$FetchFeedCommentsStateInitialImpl value,
          $Res Function(_$FetchFeedCommentsStateInitialImpl) then) =
      __$$FetchFeedCommentsStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchFeedCommentsStateInitialImplCopyWithImpl<$Res>
    extends _$FetchFeedCommentsStateCopyWithImpl<$Res,
        _$FetchFeedCommentsStateInitialImpl>
    implements _$$FetchFeedCommentsStateInitialImplCopyWith<$Res> {
  __$$FetchFeedCommentsStateInitialImplCopyWithImpl(
      _$FetchFeedCommentsStateInitialImpl _value,
      $Res Function(_$FetchFeedCommentsStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchFeedCommentsStateInitialImpl
    implements _FetchFeedCommentsStateInitial {
  const _$FetchFeedCommentsStateInitialImpl();

  @override
  String toString() {
    return 'FetchFeedCommentsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFeedCommentsStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PeamanComment> result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PeamanComment> result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PeamanComment> result)? success,
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
    required TResult Function(_FetchFeedCommentsStateInitial value) initial,
    required TResult Function(_FetchFeedCommentsStateLoading value) loading,
    required TResult Function(_FetchFeedCommentsStateSuccess value) success,
    required TResult Function(_FetchFeedCommentsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult? Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult? Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult? Function(_FetchFeedCommentsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult Function(_FetchFeedCommentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _FetchFeedCommentsStateInitial
    implements FetchFeedCommentsState {
  const factory _FetchFeedCommentsStateInitial() =
      _$FetchFeedCommentsStateInitialImpl;
}

/// @nodoc
abstract class _$$FetchFeedCommentsStateLoadingImplCopyWith<$Res> {
  factory _$$FetchFeedCommentsStateLoadingImplCopyWith(
          _$FetchFeedCommentsStateLoadingImpl value,
          $Res Function(_$FetchFeedCommentsStateLoadingImpl) then) =
      __$$FetchFeedCommentsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchFeedCommentsStateLoadingImplCopyWithImpl<$Res>
    extends _$FetchFeedCommentsStateCopyWithImpl<$Res,
        _$FetchFeedCommentsStateLoadingImpl>
    implements _$$FetchFeedCommentsStateLoadingImplCopyWith<$Res> {
  __$$FetchFeedCommentsStateLoadingImplCopyWithImpl(
      _$FetchFeedCommentsStateLoadingImpl _value,
      $Res Function(_$FetchFeedCommentsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchFeedCommentsStateLoadingImpl
    implements _FetchFeedCommentsStateLoading {
  const _$FetchFeedCommentsStateLoadingImpl();

  @override
  String toString() {
    return 'FetchFeedCommentsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFeedCommentsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PeamanComment> result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PeamanComment> result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PeamanComment> result)? success,
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
    required TResult Function(_FetchFeedCommentsStateInitial value) initial,
    required TResult Function(_FetchFeedCommentsStateLoading value) loading,
    required TResult Function(_FetchFeedCommentsStateSuccess value) success,
    required TResult Function(_FetchFeedCommentsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult? Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult? Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult? Function(_FetchFeedCommentsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult Function(_FetchFeedCommentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _FetchFeedCommentsStateLoading
    implements FetchFeedCommentsState {
  const factory _FetchFeedCommentsStateLoading() =
      _$FetchFeedCommentsStateLoadingImpl;
}

/// @nodoc
abstract class _$$FetchFeedCommentsStateSuccessImplCopyWith<$Res> {
  factory _$$FetchFeedCommentsStateSuccessImplCopyWith(
          _$FetchFeedCommentsStateSuccessImpl value,
          $Res Function(_$FetchFeedCommentsStateSuccessImpl) then) =
      __$$FetchFeedCommentsStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PeamanComment> result});
}

/// @nodoc
class __$$FetchFeedCommentsStateSuccessImplCopyWithImpl<$Res>
    extends _$FetchFeedCommentsStateCopyWithImpl<$Res,
        _$FetchFeedCommentsStateSuccessImpl>
    implements _$$FetchFeedCommentsStateSuccessImplCopyWith<$Res> {
  __$$FetchFeedCommentsStateSuccessImplCopyWithImpl(
      _$FetchFeedCommentsStateSuccessImpl _value,
      $Res Function(_$FetchFeedCommentsStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$FetchFeedCommentsStateSuccessImpl(
      null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<PeamanComment>,
    ));
  }
}

/// @nodoc

class _$FetchFeedCommentsStateSuccessImpl
    implements _FetchFeedCommentsStateSuccess {
  const _$FetchFeedCommentsStateSuccessImpl(final List<PeamanComment> result)
      : _result = result;

  final List<PeamanComment> _result;
  @override
  List<PeamanComment> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'FetchFeedCommentsState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFeedCommentsStateSuccessImpl &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFeedCommentsStateSuccessImplCopyWith<
          _$FetchFeedCommentsStateSuccessImpl>
      get copyWith => __$$FetchFeedCommentsStateSuccessImplCopyWithImpl<
          _$FetchFeedCommentsStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PeamanComment> result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PeamanComment> result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PeamanComment> result)? success,
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
    required TResult Function(_FetchFeedCommentsStateInitial value) initial,
    required TResult Function(_FetchFeedCommentsStateLoading value) loading,
    required TResult Function(_FetchFeedCommentsStateSuccess value) success,
    required TResult Function(_FetchFeedCommentsStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult? Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult? Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult? Function(_FetchFeedCommentsStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult Function(_FetchFeedCommentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _FetchFeedCommentsStateSuccess
    implements FetchFeedCommentsState {
  const factory _FetchFeedCommentsStateSuccess(
      final List<PeamanComment> result) = _$FetchFeedCommentsStateSuccessImpl;

  List<PeamanComment> get result;
  @JsonKey(ignore: true)
  _$$FetchFeedCommentsStateSuccessImplCopyWith<
          _$FetchFeedCommentsStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchFeedCommentsStateErrorImplCopyWith<$Res> {
  factory _$$FetchFeedCommentsStateErrorImplCopyWith(
          _$FetchFeedCommentsStateErrorImpl value,
          $Res Function(_$FetchFeedCommentsStateErrorImpl) then) =
      __$$FetchFeedCommentsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$FetchFeedCommentsStateErrorImplCopyWithImpl<$Res>
    extends _$FetchFeedCommentsStateCopyWithImpl<$Res,
        _$FetchFeedCommentsStateErrorImpl>
    implements _$$FetchFeedCommentsStateErrorImplCopyWith<$Res> {
  __$$FetchFeedCommentsStateErrorImplCopyWithImpl(
      _$FetchFeedCommentsStateErrorImpl _value,
      $Res Function(_$FetchFeedCommentsStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FetchFeedCommentsStateErrorImpl(
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

class _$FetchFeedCommentsStateErrorImpl
    implements _FetchFeedCommentsStateError {
  const _$FetchFeedCommentsStateErrorImpl(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'FetchFeedCommentsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFeedCommentsStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFeedCommentsStateErrorImplCopyWith<_$FetchFeedCommentsStateErrorImpl>
      get copyWith => __$$FetchFeedCommentsStateErrorImplCopyWithImpl<
          _$FetchFeedCommentsStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PeamanComment> result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PeamanComment> result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PeamanComment> result)? success,
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
    required TResult Function(_FetchFeedCommentsStateInitial value) initial,
    required TResult Function(_FetchFeedCommentsStateLoading value) loading,
    required TResult Function(_FetchFeedCommentsStateSuccess value) success,
    required TResult Function(_FetchFeedCommentsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult? Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult? Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult? Function(_FetchFeedCommentsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFeedCommentsStateInitial value)? initial,
    TResult Function(_FetchFeedCommentsStateLoading value)? loading,
    TResult Function(_FetchFeedCommentsStateSuccess value)? success,
    TResult Function(_FetchFeedCommentsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _FetchFeedCommentsStateError implements FetchFeedCommentsState {
  const factory _FetchFeedCommentsStateError(final PeamanError error) =
      _$FetchFeedCommentsStateErrorImpl;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$FetchFeedCommentsStateErrorImplCopyWith<_$FetchFeedCommentsStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostFeedCommentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostFeedCommentStateInitial value) initial,
    required TResult Function(_PostFeedCommentStateLoading value) loading,
    required TResult Function(_PostFeedCommentStateSuccess value) success,
    required TResult Function(_PostFeedCommentStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostFeedCommentStateInitial value)? initial,
    TResult? Function(_PostFeedCommentStateLoading value)? loading,
    TResult? Function(_PostFeedCommentStateSuccess value)? success,
    TResult? Function(_PostFeedCommentStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostFeedCommentStateInitial value)? initial,
    TResult Function(_PostFeedCommentStateLoading value)? loading,
    TResult Function(_PostFeedCommentStateSuccess value)? success,
    TResult Function(_PostFeedCommentStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostFeedCommentStateCopyWith<$Res> {
  factory $PostFeedCommentStateCopyWith(PostFeedCommentState value,
          $Res Function(PostFeedCommentState) then) =
      _$PostFeedCommentStateCopyWithImpl<$Res, PostFeedCommentState>;
}

/// @nodoc
class _$PostFeedCommentStateCopyWithImpl<$Res,
        $Val extends PostFeedCommentState>
    implements $PostFeedCommentStateCopyWith<$Res> {
  _$PostFeedCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PostFeedCommentStateInitialImplCopyWith<$Res> {
  factory _$$PostFeedCommentStateInitialImplCopyWith(
          _$PostFeedCommentStateInitialImpl value,
          $Res Function(_$PostFeedCommentStateInitialImpl) then) =
      __$$PostFeedCommentStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostFeedCommentStateInitialImplCopyWithImpl<$Res>
    extends _$PostFeedCommentStateCopyWithImpl<$Res,
        _$PostFeedCommentStateInitialImpl>
    implements _$$PostFeedCommentStateInitialImplCopyWith<$Res> {
  __$$PostFeedCommentStateInitialImplCopyWithImpl(
      _$PostFeedCommentStateInitialImpl _value,
      $Res Function(_$PostFeedCommentStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostFeedCommentStateInitialImpl
    implements _PostFeedCommentStateInitial {
  const _$PostFeedCommentStateInitialImpl();

  @override
  String toString() {
    return 'PostFeedCommentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedCommentStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostFeedCommentStateInitial value) initial,
    required TResult Function(_PostFeedCommentStateLoading value) loading,
    required TResult Function(_PostFeedCommentStateSuccess value) success,
    required TResult Function(_PostFeedCommentStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostFeedCommentStateInitial value)? initial,
    TResult? Function(_PostFeedCommentStateLoading value)? loading,
    TResult? Function(_PostFeedCommentStateSuccess value)? success,
    TResult? Function(_PostFeedCommentStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostFeedCommentStateInitial value)? initial,
    TResult Function(_PostFeedCommentStateLoading value)? loading,
    TResult Function(_PostFeedCommentStateSuccess value)? success,
    TResult Function(_PostFeedCommentStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PostFeedCommentStateInitial implements PostFeedCommentState {
  const factory _PostFeedCommentStateInitial() =
      _$PostFeedCommentStateInitialImpl;
}

/// @nodoc
abstract class _$$PostFeedCommentStateLoadingImplCopyWith<$Res> {
  factory _$$PostFeedCommentStateLoadingImplCopyWith(
          _$PostFeedCommentStateLoadingImpl value,
          $Res Function(_$PostFeedCommentStateLoadingImpl) then) =
      __$$PostFeedCommentStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostFeedCommentStateLoadingImplCopyWithImpl<$Res>
    extends _$PostFeedCommentStateCopyWithImpl<$Res,
        _$PostFeedCommentStateLoadingImpl>
    implements _$$PostFeedCommentStateLoadingImplCopyWith<$Res> {
  __$$PostFeedCommentStateLoadingImplCopyWithImpl(
      _$PostFeedCommentStateLoadingImpl _value,
      $Res Function(_$PostFeedCommentStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostFeedCommentStateLoadingImpl
    implements _PostFeedCommentStateLoading {
  const _$PostFeedCommentStateLoadingImpl();

  @override
  String toString() {
    return 'PostFeedCommentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedCommentStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostFeedCommentStateInitial value) initial,
    required TResult Function(_PostFeedCommentStateLoading value) loading,
    required TResult Function(_PostFeedCommentStateSuccess value) success,
    required TResult Function(_PostFeedCommentStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostFeedCommentStateInitial value)? initial,
    TResult? Function(_PostFeedCommentStateLoading value)? loading,
    TResult? Function(_PostFeedCommentStateSuccess value)? success,
    TResult? Function(_PostFeedCommentStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostFeedCommentStateInitial value)? initial,
    TResult Function(_PostFeedCommentStateLoading value)? loading,
    TResult Function(_PostFeedCommentStateSuccess value)? success,
    TResult Function(_PostFeedCommentStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PostFeedCommentStateLoading implements PostFeedCommentState {
  const factory _PostFeedCommentStateLoading() =
      _$PostFeedCommentStateLoadingImpl;
}

/// @nodoc
abstract class _$$PostFeedCommentStateSuccessImplCopyWith<$Res> {
  factory _$$PostFeedCommentStateSuccessImplCopyWith(
          _$PostFeedCommentStateSuccessImpl value,
          $Res Function(_$PostFeedCommentStateSuccessImpl) then) =
      __$$PostFeedCommentStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanComment result});

  $PeamanCommentCopyWith<$Res> get result;
}

/// @nodoc
class __$$PostFeedCommentStateSuccessImplCopyWithImpl<$Res>
    extends _$PostFeedCommentStateCopyWithImpl<$Res,
        _$PostFeedCommentStateSuccessImpl>
    implements _$$PostFeedCommentStateSuccessImplCopyWith<$Res> {
  __$$PostFeedCommentStateSuccessImplCopyWithImpl(
      _$PostFeedCommentStateSuccessImpl _value,
      $Res Function(_$PostFeedCommentStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$PostFeedCommentStateSuccessImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PeamanComment,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanCommentCopyWith<$Res> get result {
    return $PeamanCommentCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$PostFeedCommentStateSuccessImpl
    implements _PostFeedCommentStateSuccess {
  const _$PostFeedCommentStateSuccessImpl(this.result);

  @override
  final PeamanComment result;

  @override
  String toString() {
    return 'PostFeedCommentState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedCommentStateSuccessImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFeedCommentStateSuccessImplCopyWith<_$PostFeedCommentStateSuccessImpl>
      get copyWith => __$$PostFeedCommentStateSuccessImplCopyWithImpl<
          _$PostFeedCommentStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostFeedCommentStateInitial value) initial,
    required TResult Function(_PostFeedCommentStateLoading value) loading,
    required TResult Function(_PostFeedCommentStateSuccess value) success,
    required TResult Function(_PostFeedCommentStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostFeedCommentStateInitial value)? initial,
    TResult? Function(_PostFeedCommentStateLoading value)? loading,
    TResult? Function(_PostFeedCommentStateSuccess value)? success,
    TResult? Function(_PostFeedCommentStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostFeedCommentStateInitial value)? initial,
    TResult Function(_PostFeedCommentStateLoading value)? loading,
    TResult Function(_PostFeedCommentStateSuccess value)? success,
    TResult Function(_PostFeedCommentStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _PostFeedCommentStateSuccess implements PostFeedCommentState {
  const factory _PostFeedCommentStateSuccess(final PeamanComment result) =
      _$PostFeedCommentStateSuccessImpl;

  PeamanComment get result;
  @JsonKey(ignore: true)
  _$$PostFeedCommentStateSuccessImplCopyWith<_$PostFeedCommentStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostFeedCommentStateErrorImplCopyWith<$Res> {
  factory _$$PostFeedCommentStateErrorImplCopyWith(
          _$PostFeedCommentStateErrorImpl value,
          $Res Function(_$PostFeedCommentStateErrorImpl) then) =
      __$$PostFeedCommentStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$PostFeedCommentStateErrorImplCopyWithImpl<$Res>
    extends _$PostFeedCommentStateCopyWithImpl<$Res,
        _$PostFeedCommentStateErrorImpl>
    implements _$$PostFeedCommentStateErrorImplCopyWith<$Res> {
  __$$PostFeedCommentStateErrorImplCopyWithImpl(
      _$PostFeedCommentStateErrorImpl _value,
      $Res Function(_$PostFeedCommentStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PostFeedCommentStateErrorImpl(
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

class _$PostFeedCommentStateErrorImpl implements _PostFeedCommentStateError {
  const _$PostFeedCommentStateErrorImpl(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'PostFeedCommentState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedCommentStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFeedCommentStateErrorImplCopyWith<_$PostFeedCommentStateErrorImpl>
      get copyWith => __$$PostFeedCommentStateErrorImplCopyWithImpl<
          _$PostFeedCommentStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostFeedCommentStateInitial value) initial,
    required TResult Function(_PostFeedCommentStateLoading value) loading,
    required TResult Function(_PostFeedCommentStateSuccess value) success,
    required TResult Function(_PostFeedCommentStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostFeedCommentStateInitial value)? initial,
    TResult? Function(_PostFeedCommentStateLoading value)? loading,
    TResult? Function(_PostFeedCommentStateSuccess value)? success,
    TResult? Function(_PostFeedCommentStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostFeedCommentStateInitial value)? initial,
    TResult Function(_PostFeedCommentStateLoading value)? loading,
    TResult Function(_PostFeedCommentStateSuccess value)? success,
    TResult Function(_PostFeedCommentStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PostFeedCommentStateError implements PostFeedCommentState {
  const factory _PostFeedCommentStateError(final PeamanError error) =
      _$PostFeedCommentStateErrorImpl;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$PostFeedCommentStateErrorImplCopyWith<_$PostFeedCommentStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostCommentReplyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
    TResult Function(PeamanError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostCommentReplyStateInitial value) initial,
    required TResult Function(_PostCommentReplyStateLoading value) loading,
    required TResult Function(_PostCommentReplyStateSuccess value) success,
    required TResult Function(_PostCommentReplyStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCommentReplyStateInitial value)? initial,
    TResult? Function(_PostCommentReplyStateLoading value)? loading,
    TResult? Function(_PostCommentReplyStateSuccess value)? success,
    TResult? Function(_PostCommentReplyStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCommentReplyStateInitial value)? initial,
    TResult Function(_PostCommentReplyStateLoading value)? loading,
    TResult Function(_PostCommentReplyStateSuccess value)? success,
    TResult Function(_PostCommentReplyStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentReplyStateCopyWith<$Res> {
  factory $PostCommentReplyStateCopyWith(PostCommentReplyState value,
          $Res Function(PostCommentReplyState) then) =
      _$PostCommentReplyStateCopyWithImpl<$Res, PostCommentReplyState>;
}

/// @nodoc
class _$PostCommentReplyStateCopyWithImpl<$Res,
        $Val extends PostCommentReplyState>
    implements $PostCommentReplyStateCopyWith<$Res> {
  _$PostCommentReplyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PostCommentReplyStateInitialImplCopyWith<$Res> {
  factory _$$PostCommentReplyStateInitialImplCopyWith(
          _$PostCommentReplyStateInitialImpl value,
          $Res Function(_$PostCommentReplyStateInitialImpl) then) =
      __$$PostCommentReplyStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostCommentReplyStateInitialImplCopyWithImpl<$Res>
    extends _$PostCommentReplyStateCopyWithImpl<$Res,
        _$PostCommentReplyStateInitialImpl>
    implements _$$PostCommentReplyStateInitialImplCopyWith<$Res> {
  __$$PostCommentReplyStateInitialImplCopyWithImpl(
      _$PostCommentReplyStateInitialImpl _value,
      $Res Function(_$PostCommentReplyStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostCommentReplyStateInitialImpl
    implements _PostCommentReplyStateInitial {
  const _$PostCommentReplyStateInitialImpl();

  @override
  String toString() {
    return 'PostCommentReplyState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentReplyStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostCommentReplyStateInitial value) initial,
    required TResult Function(_PostCommentReplyStateLoading value) loading,
    required TResult Function(_PostCommentReplyStateSuccess value) success,
    required TResult Function(_PostCommentReplyStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCommentReplyStateInitial value)? initial,
    TResult? Function(_PostCommentReplyStateLoading value)? loading,
    TResult? Function(_PostCommentReplyStateSuccess value)? success,
    TResult? Function(_PostCommentReplyStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCommentReplyStateInitial value)? initial,
    TResult Function(_PostCommentReplyStateLoading value)? loading,
    TResult Function(_PostCommentReplyStateSuccess value)? success,
    TResult Function(_PostCommentReplyStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _PostCommentReplyStateInitial implements PostCommentReplyState {
  const factory _PostCommentReplyStateInitial() =
      _$PostCommentReplyStateInitialImpl;
}

/// @nodoc
abstract class _$$PostCommentReplyStateLoadingImplCopyWith<$Res> {
  factory _$$PostCommentReplyStateLoadingImplCopyWith(
          _$PostCommentReplyStateLoadingImpl value,
          $Res Function(_$PostCommentReplyStateLoadingImpl) then) =
      __$$PostCommentReplyStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostCommentReplyStateLoadingImplCopyWithImpl<$Res>
    extends _$PostCommentReplyStateCopyWithImpl<$Res,
        _$PostCommentReplyStateLoadingImpl>
    implements _$$PostCommentReplyStateLoadingImplCopyWith<$Res> {
  __$$PostCommentReplyStateLoadingImplCopyWithImpl(
      _$PostCommentReplyStateLoadingImpl _value,
      $Res Function(_$PostCommentReplyStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostCommentReplyStateLoadingImpl
    implements _PostCommentReplyStateLoading {
  const _$PostCommentReplyStateLoadingImpl();

  @override
  String toString() {
    return 'PostCommentReplyState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentReplyStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostCommentReplyStateInitial value) initial,
    required TResult Function(_PostCommentReplyStateLoading value) loading,
    required TResult Function(_PostCommentReplyStateSuccess value) success,
    required TResult Function(_PostCommentReplyStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCommentReplyStateInitial value)? initial,
    TResult? Function(_PostCommentReplyStateLoading value)? loading,
    TResult? Function(_PostCommentReplyStateSuccess value)? success,
    TResult? Function(_PostCommentReplyStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCommentReplyStateInitial value)? initial,
    TResult Function(_PostCommentReplyStateLoading value)? loading,
    TResult Function(_PostCommentReplyStateSuccess value)? success,
    TResult Function(_PostCommentReplyStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PostCommentReplyStateLoading implements PostCommentReplyState {
  const factory _PostCommentReplyStateLoading() =
      _$PostCommentReplyStateLoadingImpl;
}

/// @nodoc
abstract class _$$PostCommentReplyStateSuccessImplCopyWith<$Res> {
  factory _$$PostCommentReplyStateSuccessImplCopyWith(
          _$PostCommentReplyStateSuccessImpl value,
          $Res Function(_$PostCommentReplyStateSuccessImpl) then) =
      __$$PostCommentReplyStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanComment result});

  $PeamanCommentCopyWith<$Res> get result;
}

/// @nodoc
class __$$PostCommentReplyStateSuccessImplCopyWithImpl<$Res>
    extends _$PostCommentReplyStateCopyWithImpl<$Res,
        _$PostCommentReplyStateSuccessImpl>
    implements _$$PostCommentReplyStateSuccessImplCopyWith<$Res> {
  __$$PostCommentReplyStateSuccessImplCopyWithImpl(
      _$PostCommentReplyStateSuccessImpl _value,
      $Res Function(_$PostCommentReplyStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$PostCommentReplyStateSuccessImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PeamanComment,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanCommentCopyWith<$Res> get result {
    return $PeamanCommentCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$PostCommentReplyStateSuccessImpl
    implements _PostCommentReplyStateSuccess {
  const _$PostCommentReplyStateSuccessImpl(this.result);

  @override
  final PeamanComment result;

  @override
  String toString() {
    return 'PostCommentReplyState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentReplyStateSuccessImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCommentReplyStateSuccessImplCopyWith<
          _$PostCommentReplyStateSuccessImpl>
      get copyWith => __$$PostCommentReplyStateSuccessImplCopyWithImpl<
          _$PostCommentReplyStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostCommentReplyStateInitial value) initial,
    required TResult Function(_PostCommentReplyStateLoading value) loading,
    required TResult Function(_PostCommentReplyStateSuccess value) success,
    required TResult Function(_PostCommentReplyStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCommentReplyStateInitial value)? initial,
    TResult? Function(_PostCommentReplyStateLoading value)? loading,
    TResult? Function(_PostCommentReplyStateSuccess value)? success,
    TResult? Function(_PostCommentReplyStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCommentReplyStateInitial value)? initial,
    TResult Function(_PostCommentReplyStateLoading value)? loading,
    TResult Function(_PostCommentReplyStateSuccess value)? success,
    TResult Function(_PostCommentReplyStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _PostCommentReplyStateSuccess implements PostCommentReplyState {
  const factory _PostCommentReplyStateSuccess(final PeamanComment result) =
      _$PostCommentReplyStateSuccessImpl;

  PeamanComment get result;
  @JsonKey(ignore: true)
  _$$PostCommentReplyStateSuccessImplCopyWith<
          _$PostCommentReplyStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostCommentReplyStateErrorImplCopyWith<$Res> {
  factory _$$PostCommentReplyStateErrorImplCopyWith(
          _$PostCommentReplyStateErrorImpl value,
          $Res Function(_$PostCommentReplyStateErrorImpl) then) =
      __$$PostCommentReplyStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PeamanError error});

  $PeamanErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$PostCommentReplyStateErrorImplCopyWithImpl<$Res>
    extends _$PostCommentReplyStateCopyWithImpl<$Res,
        _$PostCommentReplyStateErrorImpl>
    implements _$$PostCommentReplyStateErrorImplCopyWith<$Res> {
  __$$PostCommentReplyStateErrorImplCopyWithImpl(
      _$PostCommentReplyStateErrorImpl _value,
      $Res Function(_$PostCommentReplyStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PostCommentReplyStateErrorImpl(
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

class _$PostCommentReplyStateErrorImpl implements _PostCommentReplyStateError {
  const _$PostCommentReplyStateErrorImpl(this.error);

  @override
  final PeamanError error;

  @override
  String toString() {
    return 'PostCommentReplyState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentReplyStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCommentReplyStateErrorImplCopyWith<_$PostCommentReplyStateErrorImpl>
      get copyWith => __$$PostCommentReplyStateErrorImplCopyWithImpl<
          _$PostCommentReplyStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PeamanComment result) success,
    required TResult Function(PeamanError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PeamanComment result)? success,
    TResult? Function(PeamanError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PeamanComment result)? success,
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
    required TResult Function(_PostCommentReplyStateInitial value) initial,
    required TResult Function(_PostCommentReplyStateLoading value) loading,
    required TResult Function(_PostCommentReplyStateSuccess value) success,
    required TResult Function(_PostCommentReplyStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostCommentReplyStateInitial value)? initial,
    TResult? Function(_PostCommentReplyStateLoading value)? loading,
    TResult? Function(_PostCommentReplyStateSuccess value)? success,
    TResult? Function(_PostCommentReplyStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostCommentReplyStateInitial value)? initial,
    TResult Function(_PostCommentReplyStateLoading value)? loading,
    TResult Function(_PostCommentReplyStateSuccess value)? success,
    TResult Function(_PostCommentReplyStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PostCommentReplyStateError implements PostCommentReplyState {
  const factory _PostCommentReplyStateError(final PeamanError error) =
      _$PostCommentReplyStateErrorImpl;

  PeamanError get error;
  @JsonKey(ignore: true)
  _$$PostCommentReplyStateErrorImplCopyWith<_$PostCommentReplyStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
