import 'package:aqua_ui/src/styles/background_lines_painter.dart';
import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AquaScaffold extends StatelessWidget {
  final Widget child;
  final BackgroundType? backgroundType;
  const AquaScaffold({super.key, required this.child, this.backgroundType});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = AquaTheme.of(context);
    final background = backgroundType ?? theme.backgroundType;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 236),
        image:
            background != BackgroundType.metal
                ? null
                : DecorationImage(
                  image: AssetImage(
                    'assets/background/brushed_metal.png',
                    package: 'aqua_ui',
                  ),
                  fit: BoxFit.none,
                  repeat: ImageRepeat.repeat,
                  alignment: AlignmentGeometry.topLeft
                ),
      ),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            if (background == BackgroundType.lines)
              RepaintBoundary(child: CustomPaint(painter: LinesBackgroundPainer(), size: size)),
            if (background == BackgroundType.metal)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        DefaultAquaColors
                            .aquaTransparentWhite, // aquaTransparentWhite
                        DefaultAquaColors
                            .aquaTranslucentWhite, // aquaTranslucentWhite
                        DefaultAquaColors
                            .aquaTransparentWhite, // aquaTransparentWhite
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
            child,
          ],
        ),
      ),
    );
  }
}