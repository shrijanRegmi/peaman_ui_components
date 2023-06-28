import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

enum _Type {
  success,
  error,
  warning,
}

class PeamanInfoOverlay extends ConsumerStatefulWidget {
  final String info;
  final Duration? fadeAwayDuration;
  final Function()? onPressedClose;

  const PeamanInfoOverlay.success({
    super.key,
    required this.info,
    this.fadeAwayDuration,
    this.onPressedClose,
  }) : type = _Type.success;

  const PeamanInfoOverlay.error({
    super.key,
    required this.info,
    this.fadeAwayDuration,
    this.onPressedClose,
  }) : type = _Type.error;

  const PeamanInfoOverlay.warning({
    super.key,
    required this.info,
    this.fadeAwayDuration,
    this.onPressedClose,
  }) : type = _Type.warning;

  final _Type type;

  @override
  ConsumerState<PeamanInfoOverlay> createState() => _PeamanErrorPopUpState();
}

class _PeamanErrorPopUpState extends ConsumerState<PeamanInfoOverlay>
    with TickerProviderStateMixin {
  var _offset = const Offset(0, 1);
  var _opacity = 1.0;
  var _useAnimation = true;

  Timer? _fadeAwayTimer, _closeOverlayTimer;

  @override
  void initState() {
    super.initState();
    _slideToPosition();
  }

  @override
  void didUpdateWidget(covariant PeamanInfoOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    _slideToPosition(fromDidUpdateWidget: true);
  }

  @override
  void dispose() {
    _fadeAwayTimer?.cancel();
    _closeOverlayTimer?.cancel();
    super.dispose();
  }

  void _slideToPosition({
    final bool fromDidUpdateWidget = false,
  }) {
    if (fromDidUpdateWidget) {
      _useAnimation = false;
    } else {
      _useAnimation = true;
    }
    _opacity = 1.0;
    _offset = const Offset(0, 1);
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) {
        setState(() {
          _useAnimation = true;
          _offset = const Offset(0, 0);
        });
      }
    });

    final fadeAwayDuration =
        widget.fadeAwayDuration ?? const Duration(milliseconds: 3000);

    if (_fadeAwayTimer?.isActive ?? false) _fadeAwayTimer?.cancel();
    if (_closeOverlayTimer?.isActive ?? false) _closeOverlayTimer?.cancel();

    _fadeAwayTimer = Timer(fadeAwayDuration, () {
      if (mounted) {
        setState(() {
          _opacity = 0.0;
        });
        _closeOverlayTimer = Timer(const Duration(milliseconds: 2000), () {
          if (mounted) {
            widget.onPressedClose?.call();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onPressedClose?.call();
        return true;
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AnimatedSlide(
          duration: Duration(milliseconds: _useAnimation ? 600 : 0),
          offset: _offset,
          curve: Curves.ease,
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: _useAnimation ? 2000 : 0),
            child: SafeArea(
              child: Material(
                elevation: 2.0,
                color: widget.type == _Type.success
                    ? PeamanColors.green
                    : widget.type == _Type.warning
                        ? PeamanColors.yellow
                        : PeamanColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: PeamanText.body2(
                        widget.info,
                        style: TextStyle(
                          color: PeamanColors.white,
                          fontSize: 12.sp,
                        ),
                      ).pX(15).pY(10),
                    ),
                    if (widget.onPressedClose != null)
                      PeamanRoundIconButton(
                        onPressed: () => widget.onPressedClose?.call(),
                        padding: EdgeInsets.all(4.w),
                        bgColor: PeamanColors.white,
                        icon: Icon(
                          Icons.close_rounded,
                          size: 13.w,
                          color: widget.type == _Type.success
                              ? PeamanColors.green
                              : widget.type == _Type.warning
                                  ? PeamanColors.yellow
                                  : PeamanColors.red,
                        ),
                      ).pR(15),
                  ],
                ),
              ).pad(20),
            ),
          ),
        ),
      ),
    );
  }
}
