import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme.dart';
import 'package:flutter/cupertino.dart';

class AquaScaffold extends StatelessWidget {
  final Widget child;
  final BackgroundType? backgroundType;
  const AquaScaffold({super.key, required this.child, this.backgroundType});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = AquaTheme.of(context);
    final background = backgroundType ?? theme.backgroundType;
    return ColoredBox(
      color: Color.fromARGB(255, 236, 236, 236),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            if (background != BackgroundType.flat)
              CustomPaint(painter: _BackgroundPainer(), size: size),
            child,
          ],
        ),
      ),
    );
  }
}

class _BackgroundPainer extends CustomPainter {
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
