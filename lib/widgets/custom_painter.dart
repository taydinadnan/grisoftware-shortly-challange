import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 112, 33, 188)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.86;

    Path path0 = Path();
    path0.moveTo(size.width * 0.3500700, 0);
    path0.cubicTo(
        size.width * 0.8375175, 0, size.width * 0.8375175, 0, size.width, 0);
    path0.cubicTo(size.width, size.height * 0.1766800, size.width,
        size.height * 0.5300400, size.width, size.height * 0.7067200);
    path0.cubicTo(
        size.width * 0.8375175,
        size.height * 0.5300400,
        size.width * 0.3510100,
        size.height * 1.1865400,
        size.width * 0.3500700,
        0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
