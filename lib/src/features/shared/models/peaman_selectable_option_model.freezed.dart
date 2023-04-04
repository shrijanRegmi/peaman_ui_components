// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_selectable_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanSelectableOption {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  Widget? get leading => throw _privateConstructorUsedError;
  Widget? get trailing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanSelectableOptionCopyWith<PeamanSelectableOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanSelectableOptionCopyWith<$Res> {
  factory $PeamanSelectableOptionCopyWith(PeamanSelectableOption value,
          $Res Function(PeamanSelectableOption) then) =
      _$PeamanSelectableOptionCopyWithImpl<$Res, PeamanSelectableOption>;
  @useResult
  $Res call({int id, String? title, Widget? leading, Widget? trailing});
}

/// @nodoc
class _$PeamanSelectableOptionCopyWithImpl<$Res,
        $Val extends PeamanSelectableOption>
    implements $PeamanSelectableOptionCopyWith<$Res> {
  _$PeamanSelectableOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? leading = freezed,
    Object? trailing = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      leading: freezed == leading
          ? _value.leading
          : leading // ignore: cast_nullable_to_non_nullable
              as Widget?,
      trailing: freezed == trailing
          ? _value.trailing
          : trailing // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanSelectableOptionCopyWith<$Res>
    implements $PeamanSelectableOptionCopyWith<$Res> {
  factory _$$_PeamanSelectableOptionCopyWith(_$_PeamanSelectableOption value,
          $Res Function(_$_PeamanSelectableOption) then) =
      __$$_PeamanSelectableOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? title, Widget? leading, Widget? trailing});
}

/// @nodoc
class __$$_PeamanSelectableOptionCopyWithImpl<$Res>
    extends _$PeamanSelectableOptionCopyWithImpl<$Res,
        _$_PeamanSelectableOption>
    implements _$$_PeamanSelectableOptionCopyWith<$Res> {
  __$$_PeamanSelectableOptionCopyWithImpl(_$_PeamanSelectableOption _value,
      $Res Function(_$_PeamanSelectableOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? leading = freezed,
    Object? trailing = freezed,
  }) {
    return _then(_$_PeamanSelectableOption(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      leading: freezed == leading
          ? _value.leading
          : leading // ignore: cast_nullable_to_non_nullable
              as Widget?,
      trailing: freezed == trailing
          ? _value.trailing
          : trailing // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

class _$_PeamanSelectableOption implements _PeamanSelectableOption {
  const _$_PeamanSelectableOption(
      {required this.id, this.title, this.leading, this.trailing});

  @override
  final int id;
  @override
  final String? title;
  @override
  final Widget? leading;
  @override
  final Widget? trailing;

  @override
  String toString() {
    return 'PeamanSelectableOption(id: $id, title: $title, leading: $leading, trailing: $trailing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanSelectableOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.leading, leading) || other.leading == leading) &&
            (identical(other.trailing, trailing) ||
                other.trailing == trailing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, leading, trailing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanSelectableOptionCopyWith<_$_PeamanSelectableOption> get copyWith =>
      __$$_PeamanSelectableOptionCopyWithImpl<_$_PeamanSelectableOption>(
          this, _$identity);
}

abstract class _PeamanSelectableOption implements PeamanSelectableOption {
  const factory _PeamanSelectableOption(
      {required final int id,
      final String? title,
      final Widget? leading,
      final Widget? trailing}) = _$_PeamanSelectableOption;

  @override
  int get id;
  @override
  String? get title;
  @override
  Widget? get leading;
  @override
  Widget? get trailing;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanSelectableOptionCopyWith<_$_PeamanSelectableOption> get copyWith =>
      throw _privateConstructorUsedError;
}
