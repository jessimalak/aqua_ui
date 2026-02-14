import 'package:aqua_ui/src/styles/colors.dart';
import 'package:flutter/widgets.dart';

class LinesBackgroundPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint whitePaint =
        Paint()
          ..color = AquaColors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4;
    final Paint greyPaint =
        Paint()
          ..color = AquaColors.lightGrey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4;
    final lines = size.height / 4;
    for (int i = 0; i < lines; i++) {
      canvas.drawLine(
        Offset(0, i * 4),
        Offset(size.width, (i * 4)),
        i.isEven ? whitePaint : greyPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}