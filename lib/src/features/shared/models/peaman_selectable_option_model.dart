import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'peaman_selectable_option_model.freezed.dart';

@freezed
class PeamanSelectableOption with _$PeamanSelectableOption {
  const factory PeamanSelectableOption({
    required final int id,
    final String? title,
    final Widget? leading,
    final Widget? trailing,
  }) = _PeamanSelectableOption;
}
