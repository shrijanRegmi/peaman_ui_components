import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanPopupHeader extends ConsumerWidget {
  const PeamanPopupHeader({
    super.key,
    this.title,
    this.cancelBuilder,
    this.padding,
    this.isLoading = false,
  });

  final String? title;
  final Widget Function(
    BuildContext,
    WidgetRef,
  )? cancelBuilder;
  final EdgeInsets? padding;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            top: 20.h,
            bottom: 15.h,
            left: 20.w,
            right: 20.w,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PeamanText.heading6(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              if (isLoading)
                PeamanSpinner(
                  size: 12.w,
                ).pL(10.0)
            ],
          ),
          cancelBuilder?.call(context, ref) ??
              PeamanRoundIconButton(
                icon: Icon(
                  Icons.close_rounded,
                  size: 16.w,
                ),
                padding: EdgeInsets.all(9.w),
                onPressed: () => context.pop(),
              )
        ],
      ),
    );
  }
}
