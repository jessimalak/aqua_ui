import 'package:aqua_ui/src/styles/colors.dart';
import 'package:flutter/widgets.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    this.value,
    this.height = 18,
    this.trackColor,
    this.backgroundColor,
    this.semanticLabel,
  });

  /// The value of the progress bar. If non-null, this has to
  /// be non-negative and less the 100. If null, the progress bar
  /// will be considered indeterminate.
  final double? value;

  /// The height of the line. Default to 4.5px
  final double height;

  /// The color of the track. If null, [MacosThemeData.accentColor] is used
  final Color? trackColor;

  /// The color of the background. If null, [CupertinoColors.secondarySystemFill]
  /// is used
  final Color? backgroundColor;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      value: value?.toStringAsFixed(2),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height,
          minHeight: height,
          minWidth: 80,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 161, 161, 161),
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                color: Color.fromARGB(255, 161, 161, 161),
                blurRadius: 2,
              ),
            ],
          ),
          child:
              value == null
                  ? _ProgressIndeterminatedBarWidget(height: height)
                  : _DeterminatedBarWidget(value: value!),
        ),
      ),
    );
  }
}

class _ProgressDeterminatedBarPainter extends CustomPainter {
  const _ProgressDeterminatedBarPainter(this.value);
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundRect = const BorderRadius.all(
      Radius.circular(3),
    ).toRRect(Offset.zero & size);
    canvas.drawRRect(
      backgroundRect,
      Paint()
        ..color = AquaColors.white
        ..style = PaintingStyle.fill,
    );

    final fill = LinearGradient(
      tileMode: TileMode.repeated,
      colors: [
        Color.fromARGB(255, 116, 202, 255),
        Color.fromARGB(255, 73, 158, 255),
        Color.fromARGB(255, 116, 202, 255),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 0.4, 0.8],
    ).createShader(Rect.fromLTWH(0, 0, 18, size.height));
    final Paint paint = Paint()..shader = fill;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width * (value / 100), size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressDeterminatedBarPainter old) =>
      old.value != value;
}

class _ProgressIndeterminatedBarWidget extends StatefulWidget {
  final double height;

  const _ProgressIndeterminatedBarWidget({super.key, required this.height});

  @override
  State<_ProgressIndeterminatedBarWidget> createState() =>
      _ProgressIndeterminatedBarWidgetState();
}

class _ProgressIndeterminatedBarWidgetState
    extends State<_ProgressIndeterminatedBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant _ProgressIndeterminatedBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_controller.isAnimating) _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const double itemWidth = 32;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final steps = (constraints.maxWidth / itemWidth).ceil();
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipPath(
              child: DecoratedBox(
                decoration: BoxDecoration(color: AquaColors.white),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    for (int i = 0; i <= steps + 1; i = i + 1)
                      Positioned(
                        right:
                            (i * itemWidth) -
                            (_controller.value * itemWidth) -
                            itemWidth,
                        child: Transform(
                          transform: Matrix4.skewX(0.85),
                          child: SizedBox(
                            height: widget.height,
                            width: itemWidth,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x00ffffff),
                                    Color.fromARGB(255, 73, 158, 255),
                                    Color.fromARGB(255, 73, 158, 255),
                                    Color(0x00ffffff),
                                  ],
                                  stops: [0, 0.3, 0.7, 1],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.multiply,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(128, 33, 33, 33),
                            Color.fromARGB(200, 255, 255, 255),
                            Color.fromARGB(100, 33, 33, 33),
                            Color.fromARGB(100, 255, 255, 255),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0.2, 0.5, 1],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _DeterminatedBarWidget extends StatelessWidget {
  final double value;

  const _DeterminatedBarWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: _ProgressDeterminatedBarPainter(value)),
        DecoratedBox(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.multiply,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(128, 33, 33, 33),
                Color.fromARGB(200, 255, 255, 255),
                Color.fromARGB(100, 64, 64, 64),
                Color.fromARGB(128, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.2, 0.5, 1],
            ),
          ),
        ),
      ],
    );
  }
}
