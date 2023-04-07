import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_list_wrapper.freezed.dart';

@freezed
class PeamanListWrapper<T> with _$PeamanListWrapper<T> {
  const factory PeamanListWrapper({
    required final List<T> values,
  }) = _PeamanListWrapper;
}
