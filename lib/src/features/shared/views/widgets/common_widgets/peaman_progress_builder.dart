import 'package:flutter/material.dart';

class PeamanProgressBuilder extends StatefulWidget {
  final bool requiredColorChange;
  final double thickness;
  final double value;
  final Color bgColor;
  final Color progressColor;

  const PeamanProgressBuilder(
    this.value, {
    Key? key,
    this.thickness = 6.0,
    this.requiredColorChange = true,
    this.bgColor = const Color(0xffd7e9ed),
    this.progressColor = Colors.green,
  }) : super(key: key);

  @override
  _PeamanProgressBuilderState createState() => _PeamanProgressBuilderState();
}

class _PeamanProgressBuilderState extends State<PeamanProgressBuilder>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _tween = Tween<double>(begin: 0.0, end: widget.value);

    _animation = _tween.animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _changeVal() {
    _controller.reset();
    _tween.begin = _tween.end;
    _tween.end = widget.value;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (_tween.end != widget.value) {
      _changeVal();
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: ProgressPainter(
              widget.value == 0.0 ? 0.0 : _animation.value,
              widget.thickness,
              widget.requiredColorChange,
              widget.bgColor,
              widget.progressColor,
            ),
            child: Container(),
          );
        },
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double value;
  final double thickness;
  final bool requiredColorChange;
  final Color bgColor;
  final Color progressColor;

  ProgressPainter(
    this.value,
    this.thickness,
    this.requiredColorChange,
    this.bgColor,
    this.progressColor,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final progressValue = value / 100 * size.width;

    final progressPaint = Paint()
      ..color = requiredColorChange && value <= 70
          ? const Color(0xfffbad30)
          : requiredColorChange && value <= 90
              ? Colors.greenAccent
              : progressColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = thickness;

    final progressBGPaint = Paint()
      ..color = bgColor.withOpacity(0.5)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = thickness;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(progressValue, size.height / 2);

    final endBGPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endBGPoint, progressBGPaint);
    canvas.drawLine(startPoint, endPoint, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
