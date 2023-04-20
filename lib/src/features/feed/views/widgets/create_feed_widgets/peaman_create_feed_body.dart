import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PeamanCreateFeedBody extends ConsumerWidget {
  const PeamanCreateFeedBody({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      minLines: 1,
      maxLines: 100,
      controller: controller,
      style: TextStyle(
        fontSize: 16.sp,
      ),
      onChanged: (val) {},
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'What do you want to talk about?',
      ),
    );
  }
}
