
import 'package:flutter/material.dart';

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter(
      {required this.width, required this.height, this.blurSigma = 3});

  double width;
  double height;
  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint plane = new Paint()
      ..color = Colors.white.withAlpha(200)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);

    Paint line = new Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width * 0.9
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma * 2 * 2);
    // Offset center =  Offset(size.width / 2, size.height / 2);
    // double radius = min(size.width / 2, size.height / 2);
    // canvas.drawOval(Rect.fromPoints(Offset(width*0.1, height*0.2), Offset(width*0.8, height*0.8)),plane);
    canvas.drawOval(Rect.fromPoints(Offset.zero, Offset(width, height)), line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
