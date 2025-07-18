import 'package:flutter/material.dart';

class SharpLinePainter extends CustomPainter {
  final Color middleColor;
  final Color sideColor;
  const SharpLinePainter(this.middleColor, this.sideColor);
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..shader = LinearGradient(
            colors: [sideColor, middleColor, sideColor],
            stops: [0.0, 0.5, 1.0], // Sharp transition
            tileMode: TileMode.clamp,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..strokeWidth = size.height
          ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
