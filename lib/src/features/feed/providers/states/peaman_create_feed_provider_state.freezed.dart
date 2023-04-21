// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_create_feed_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanCreateFeedProviderState {
  PeamanUser? get feedOwner => throw _privateConstructorUsedError;
  PeamanFeed? get feedToEdit => throw _privateConstructorUsedError;
  TextEditingController get captionController =>
      throw _privateConstructorUsedError;
  TextEditingController get pollQuestionController =>
      throw _privateConstructorUsedError;
  TextEditingController get youtubeLinkController =>
      throw _privateConstructorUsedError;
  List<PeamanPollOption> get pollOptions => throw _privateConstructorUsedError;
  List<PeamanFileUrlExtended> get files => throw _privateConstructorUsedError;
  PeamanFeedType get feedType => throw _privateConstructorUsedError;
  bool get isYoutubeLinkValid => throw _privateConstructorUsedError;
  CreateFeedState get createFeedState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanCreateFeedProviderStateCopyWith<PeamanCreateFeedProviderState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanCreateFeedProviderStateCopyWith<$Res> {
  factory $PeamanCreateFeedProviderStateCopyWith(
          PeamanCreateFeedProviderState value,
          $Res Function(PeamanCreateFeedProviderState) then) =
      _$PeamanCreateFeedProviderStateCopyWithImpl<$Res,
          PeamanCreateFeedProviderState>;
  @useResult
  $Res call(
      {PeamanUser? feedOwner,
      PeamanFeed? feedToEdit,
      TextEditingController captionController,
      TextEditingController pollQuestionController,
      TextEditingController youtubeLinkController,
      List<PeamanPollOption> pollOptions,
      List<PeamanFileUrlExtended> files,
      PeamanFeedType feedType,
      bool isYoutubeLinkValid,
      CreateFeedState createFeedState});

  $PeamanUserCopyWith<$Res>? get feedOwner;
  $PeamanFeedCopyWith<$Res>? get feedToEdit;
  $CreateFeedStateCopyWith<$Res> get createFeedState;
}

/// @nodoc
class _$PeamanCreateFeedProviderStateCopyWithImpl<$Res,
        $Val extends PeamanCreateFeedProviderState>
    implements $PeamanCreateFeedProviderStateCopyWith<$Res> {
  _$PeamanCreateFeedProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedOwner = freezed,
    Object? feedToEdit = freezed,
    Object? captionController = null,
    Object? pollQuestionController = null,
    Object? youtubeLinkController = null,
    Object? pollOptions = null,
    Object? files = null,
    Object? feedType = null,
    Object? isYoutubeLinkValid = null,
    Object? createFeedState = null,
  }) {
    return _then(_value.copyWith(
      feedOwner: freezed == feedOwner
          ? _value.feedOwner
          : feedOwner // ignore: cast_nullable_to_non_nullable
              as PeamanUser?,
      feedToEdit: freezed == feedToEdit
          ? _value.feedToEdit
          : feedToEdit // ignore: cast_nullable_to_non_nullable
              as PeamanFeed?,
      captionController: null == captionController
          ? _value.captionController
          : captionController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      pollQuestionController: null == pollQuestionController
          ? _value.pollQuestionController
          : pollQuestionController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      youtubeLinkController: null == youtubeLinkController
          ? _value.youtubeLinkController
          : youtubeLinkController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      pollOptions: null == pollOptions
          ? _value.pollOptions
          : pollOptions // ignore: cast_nullable_to_non_nullable
              as List<PeamanPollOption>,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrlExtended>,
      feedType: null == feedType
          ? _value.feedType
          : feedType // ignore: cast_nullable_to_non_nullable
              as PeamanFeedType,
      isYoutubeLinkValid: null == isYoutubeLinkValid
          ? _value.isYoutubeLinkValid
          : isYoutubeLinkValid // ignore: cast_nullable_to_non_nullable
              as bool,
      createFeedState: null == createFeedState
          ? _value.createFeedState
          : createFeedState // ignore: cast_nullable_to_non_nullable
              as CreateFeedState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanUserCopyWith<$Res>? get feedOwner {
    if (_value.feedOwner == null) {
      return null;
    }

    return $PeamanUserCopyWith<$Res>(_value.feedOwner!, (value) {
      return _then(_value.copyWith(feedOwner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeamanFeedCopyWith<$Res>? get feedToEdit {
    if (_value.feedToEdit == null) {
      return null;
    }

    return $PeamanFeedCopyWith<$Res>(_value.feedToEdit!, (value) {
      return _then(_value.copyWith(feedToEdit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateFeedStateCopyWith<$Res> get createFeedState {
    return $CreateFeedStateCopyWith<$Res>(_value.createFeedState, (value) {
      return _then(_value.copyWith(createFeedState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PeamanCreateFeedProviderStateCopyWith<$Res>
    implements $PeamanCreateFeedProviderStateCopyWith<$Res> {
  factory _$$_PeamanCreateFeedProviderStateCopyWith(
          _$_PeamanCreateFeedProviderState value,
          $Res Function(_$_PeamanCreateFeedProviderState) then) =
      __$$_PeamanCreateFeedProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PeamanUser? feedOwner,
      PeamanFeed? feedToEdit,
      TextEditingController captionController,
      TextEditingController pollQuestionController,
      TextEditingController youtubeLinkController,
      List<PeamanPollOption> pollOptions,
      List<PeamanFileUrlExtended> files,
      PeamanFeedType feedType,
      bool isYoutubeLinkValid,
      CreateFeedState createFeedState});

  @override
  $PeamanUserCopyWith<$Res>? get feedOwner;
  @override
  $PeamanFeedCopyWith<$Res>? get feedToEdit;
  @override
  $CreateFeedStateCopyWith<$Res> get createFeedState;
}

/// @nodoc
class __$$_PeamanCreateFeedProviderStateCopyWithImpl<$Res>
    extends _$PeamanCreateFeedProviderStateCopyWithImpl<$Res,
        _$_PeamanCreateFeedProviderState>
    implements _$$_PeamanCreateFeedProviderStateCopyWith<$Res> {
  __$$_PeamanCreateFeedProviderStateCopyWithImpl(
      _$_PeamanCreateFeedProviderState _value,
      $Res Function(_$_PeamanCreateFeedProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedOwner = freezed,
    Object? feedToEdit = freezed,
    Object? captionController = null,
    Object? pollQuestionController = null,
    Object? youtubeLinkController = null,
    Object? pollOptions = null,
    Object? files = null,
    Object? feedType = null,
    Object? isYoutubeLinkValid = null,
    Object? createFeedState = null,
  }) {
    return _then(_$_PeamanCreateFeedProviderState(
      feedOwner: freezed == feedOwner
          ? _value.feedOwner
          : feedOwner // ignore: cast_nullable_to_non_nullable
              as PeamanUser?,
      feedToEdit: freezed == feedToEdit
          ? _value.feedToEdit
          : feedToEdit // ignore: cast_nullable_to_non_nullable
              as PeamanFeed?,
      captionController: null == captionController
          ? _value.captionController
          : captionController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      pollQuestionController: null == pollQuestionController
          ? _value.pollQuestionController
          : pollQuestionController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      youtubeLinkController: null == youtubeLinkController
          ? _value.youtubeLinkController
          : youtubeLinkController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      pollOptions: null == pollOptions
          ? _value._pollOptions
          : pollOptions // ignore: cast_nullable_to_non_nullable
              as List<PeamanPollOption>,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PeamanFileUrlExtended>,
      feedType: null == feedType
          ? _value.feedType
          : feedType // ignore: cast_nullable_to_non_nullable
              as PeamanFeedType,
      isYoutubeLinkValid: null == isYoutubeLinkValid
          ? _value.isYoutubeLinkValid
          : isYoutubeLinkValid // ignore: cast_nullable_to_non_nullable
              as bool,
      createFeedState: null == createFeedState
          ? _value.createFeedState
          : createFeedState // ignore: cast_nullable_to_non_nullable
              as CreateFeedState,
    ));
  }
}

/// @nodoc

class _$_PeamanCreateFeedProviderState
    implements _PeamanCreateFeedProviderState {
  const _$_PeamanCreateFeedProviderState(
      {this.feedOwner,
      this.feedToEdit,
      required this.captionController,
      required this.pollQuestionController,
      required this.youtubeLinkController,
      final List<PeamanPollOption> pollOptions = const <PeamanPollOption>[],
      final List<PeamanFileUrlExtended> files = const <PeamanFileUrlExtended>[],
      this.feedType = PeamanFeedType.text,
      this.isYoutubeLinkValid = true,
      this.createFeedState = const CreateFeedState.initial()})
      : _pollOptions = pollOptions,
        _files = files;

  @override
  final PeamanUser? feedOwner;
  @override
  final PeamanFeed? feedToEdit;
  @override
  final TextEditingController captionController;
  @override
  final TextEditingController pollQuestionController;
  @override
  final TextEditingController youtubeLinkController;
  final List<PeamanPollOption> _pollOptions;
  @override
  @JsonKey()
  List<PeamanPollOption> get pollOptions {
    if (_pollOptions is EqualUnmodifiableListView) return _pollOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pollOptions);
  }

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
  final PeamanFeedType feedType;
  @override
  @JsonKey()
  final bool isYoutubeLinkValid;
  @override
  @JsonKey()
  final CreateFeedState createFeedState;

  @override
  String toString() {
    return 'PeamanCreateFeedProviderState(feedOwner: $feedOwner, feedToEdit: $feedToEdit, captionController: $captionController, pollQuestionController: $pollQuestionController, youtubeLinkController: $youtubeLinkController, pollOptions: $pollOptions, files: $files, feedType: $feedType, isYoutubeLinkValid: $isYoutubeLinkValid, createFeedState: $createFeedState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanCreateFeedProviderState &&
            (identical(other.feedOwner, feedOwner) ||
                other.feedOwner == feedOwner) &&
            (identical(other.feedToEdit, feedToEdit) ||
                other.feedToEdit == feedToEdit) &&
            (identical(other.captionController, captionController) ||
                other.captionController == captionController) &&
            (identical(other.pollQuestionController, pollQuestionController) ||
                other.pollQuestionController == pollQuestionController) &&
            (identical(other.youtubeLinkController, youtubeLinkController) ||
                other.youtubeLinkController == youtubeLinkController) &&
            const DeepCollectionEquality()
                .equals(other._pollOptions, _pollOptions) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.feedType, feedType) ||
                other.feedType == feedType) &&
            (identical(other.isYoutubeLinkValid, isYoutubeLinkValid) ||
                other.isYoutubeLinkValid == isYoutubeLinkValid) &&
            (identical(other.createFeedState, createFeedState) ||
                other.createFeedState == createFeedState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      feedOwner,
      feedToEdit,
      captionController,
      pollQuestionController,
      youtubeLinkController,
      const DeepCollectionEquality().hash(_pollOptions),
      const DeepCollectionEquality().hash(_files),
      feedType,
      isYoutubeLinkValid,
      createFeedState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanCreateFeedProviderStateCopyWith<_$_PeamanCreateFeedProviderState>
      get copyWith => __$$_PeamanCreateFeedProviderStateCopyWithImpl<
          _$_PeamanCreateFeedProviderState>(this, _$identity);
}

abstract class _PeamanCreateFeedProviderState
    implements PeamanCreateFeedProviderState {
  const factory _PeamanCreateFeedProviderState(
          {final PeamanUser? feedOwner,
          final PeamanFeed? feedToEdit,
          required final TextEditingController captionController,
          required final TextEditingController pollQuestionController,
          required final TextEditingController youtubeLinkController,
          final List<PeamanPollOption> pollOptions,
          final List<PeamanFileUrlExtended> files,
          final PeamanFeedType feedType,
          final bool isYoutubeLinkValid,
          final CreateFeedState createFeedState}) =
      _$_PeamanCreateFeedProviderState;

  @override
  PeamanUser? get feedOwner;
  @override
  PeamanFeed? get feedToEdit;
  @override
  TextEditingController get captionController;
  @override
  TextEditingController get pollQuestionController;
  @override
  TextEditingController get youtubeLinkController;
  @override
  List<PeamanPollOption> get pollOptions;
  @override
  List<PeamanFileUrlExtended> get files;
  @override
  PeamanFeedType get feedType;
  @override
  bool get isYoutubeLinkValid;
  @override
  CreateFeedState get createFeedState;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanCreateFeedProviderStateCopyWith<_$_PeamanCreateFeedProviderState>
      get copyWith => throw _privateConstructorUsedError;
}
