import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme/button_style.dart';
import 'package:aqua_ui/src/styles/theme/global_styles.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

class AquaButton extends StatefulWidget {
  final Widget child;
  final bool secondary;
  final VoidCallback? onTap;
  const AquaButton({
    super.key,
    required this.child,
    this.secondary = false,
    required this.onTap,
  });

  @override
  State<AquaButton> createState() => _AquaButtonState();
}

class _AquaButtonState extends State<AquaButton> {
  bool _hover = false;

  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(20));
    final disabled = widget.onTap == null;
    final topShine = Positioned(
      top: 0,
      left: 4,
      right: 4,
      child: const ButtonTopShine(size: ButtonShineSize.normal,)
    );
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: disabled ? null : (details) => setState(() => _pressed = true),
      onTapUp: disabled ? null : (details) => setState(() => _pressed = false),
      child: MouseRegion(
        onEnter: disabled ? null : (event) => setState(() => _hover = true),
        onExit: disabled ? null : (event) => setState(() => _hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 128),
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            gradient:
                widget.secondary || disabled
                    ? ButtonStyle.secondaryBorderGradient
                    : ButtonStyle.primaryBorderGradient,
            borderRadius: radius,
            boxShadow: _hover ? GlobalStyles.hoverShadow : [],
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: radius,
              gradient:
                  widget.secondary || widget.onTap == null
                      ? ButtonStyle.secondaryBackgroundGradient
                      : ButtonStyle.primaryBackgroundGradient,
            ),
            child: Stack(
              children: [
                if (widget.secondary && !_pressed && !disabled) topShine,
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 6),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: AquaColors.black,
                      fontSize: 13,
                      shadows: [
                        BoxShadow(color: AquaColors.white, blurRadius: 4),
                      ],
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color:
                            disabled
                                ? DefaultAquaColors
                                    .aquaSegmentedControlOutlineStroke
                                : AquaColors.black,
                                fontSize: 13
                      ),
                      child: widget.child,
                    ),
                  ),
                ),
                if (!widget.secondary && !_pressed && !disabled) topShine,
                Positioned(
                  top: 0,
                  left: 4,
                  right: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                        bottom: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.5),
                          Color.fromRGBO(255, 255, 255, 0.07),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      // boxShadow: [
                      //   BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.5), blurRadius: 3),
                      // ],
                    ),
                    child: SizedBox(height: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TexturedButton extends StatelessWidget {
  final Widget child;
  const TexturedButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(decoration: BoxDecoration());
  }
}
