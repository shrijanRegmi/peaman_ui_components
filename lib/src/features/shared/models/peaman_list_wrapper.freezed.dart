// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peaman_list_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeamanListWrapper<T> {
  List<T> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeamanListWrapperCopyWith<T, PeamanListWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeamanListWrapperCopyWith<T, $Res> {
  factory $PeamanListWrapperCopyWith(PeamanListWrapper<T> value,
          $Res Function(PeamanListWrapper<T>) then) =
      _$PeamanListWrapperCopyWithImpl<T, $Res, PeamanListWrapper<T>>;
  @useResult
  $Res call({List<T> values});
}

/// @nodoc
class _$PeamanListWrapperCopyWithImpl<T, $Res,
        $Val extends PeamanListWrapper<T>>
    implements $PeamanListWrapperCopyWith<T, $Res> {
  _$PeamanListWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeamanListWrapperCopyWith<T, $Res>
    implements $PeamanListWrapperCopyWith<T, $Res> {
  factory _$$_PeamanListWrapperCopyWith(_$_PeamanListWrapper<T> value,
          $Res Function(_$_PeamanListWrapper<T>) then) =
      __$$_PeamanListWrapperCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> values});
}

/// @nodoc
class __$$_PeamanListWrapperCopyWithImpl<T, $Res>
    extends _$PeamanListWrapperCopyWithImpl<T, $Res, _$_PeamanListWrapper<T>>
    implements _$$_PeamanListWrapperCopyWith<T, $Res> {
  __$$_PeamanListWrapperCopyWithImpl(_$_PeamanListWrapper<T> _value,
      $Res Function(_$_PeamanListWrapper<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_$_PeamanListWrapper<T>(
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_PeamanListWrapper<T> implements _PeamanListWrapper<T> {
  const _$_PeamanListWrapper({required final List<T> values})
      : _values = values;

  final List<T> _values;
  @override
  List<T> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'PeamanListWrapper<$T>(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeamanListWrapper<T> &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeamanListWrapperCopyWith<T, _$_PeamanListWrapper<T>> get copyWith =>
      __$$_PeamanListWrapperCopyWithImpl<T, _$_PeamanListWrapper<T>>(
          this, _$identity);
}

abstract class _PeamanListWrapper<T> implements PeamanListWrapper<T> {
  const factory _PeamanListWrapper({required final List<T> values}) =
      _$_PeamanListWrapper<T>;

  @override
  List<T> get values;
  @override
  @JsonKey(ignore: true)
  _$$_PeamanListWrapperCopyWith<T, _$_PeamanListWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
