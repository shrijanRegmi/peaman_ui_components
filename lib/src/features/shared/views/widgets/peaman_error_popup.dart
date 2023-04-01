import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  normal,
  dialog,
}

class PeamanErrorPopUp extends ConsumerStatefulWidget {
  final PeamanError error;

  const PeamanErrorPopUp({
    super.key,
    required this.error,
  }) : type = _Type.normal;

  const PeamanErrorPopUp.dialog({
    super.key,
    required this.error,
  }) : type = _Type.dialog;

  final _Type type;

  @override
  ConsumerState<PeamanErrorPopUp> createState() => _PeamanErrorPopUpState();
}

class _PeamanErrorPopUpState extends ConsumerState<PeamanErrorPopUp>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.ease,
      ),
    );
    _slideAnimationController.forward();

    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted && widget.type == _Type.normal) {
        setState(() {
          _isVisible = false;
        });
        Future.delayed(const Duration(milliseconds: 2000), () {
          ref.read(providerOfPeamanError.notifier).removeError();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(providerOfPeamanError.notifier).removeError();
        return true;
      },
      child: SlideTransition(
        position: _slideAnimation,
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 2000),
          child: SafeArea(
            child: Material(
              elevation: 2.0,
              color: PeamanColors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PeamanText.body2(
                      widget.error.message,
                      style: TextStyle(
                        color: PeamanColors.white,
                        fontSize: 12.sp,
                      ),
                    ).pX(15).pY(10),
                  ),
                  PeamanRoundIconButton(
                    onPressed: () {
                      ref.read(providerOfPeamanError.notifier).removeError();
                      if (widget.type == _Type.dialog) {
                        context.pop();
                      }
                    },
                    padding: EdgeInsets.all(4.w),
                    bgColor: PeamanColors.white,
                    icon: Icon(
                      Icons.close_rounded,
                      size: 18.w,
                      color: PeamanColors.red,
                    ),
                  ).pR(15),
                ],
              ),
            ).pad(20),
          ),
        ),
      ),
    );
  }
}
