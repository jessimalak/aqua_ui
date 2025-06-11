import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme/button_style.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

class AquaButton extends StatefulWidget {
  final Widget child;
  final bool secondary;
  const AquaButton({super.key, required this.child, this.secondary = false});

  @override
  State<AquaButton> createState() => _AquaButtonState();
}

class _AquaButtonState extends State<AquaButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(20));
    final topShine = Positioned(
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
              Color.fromRGBO(255, 255, 255, 0.6),
              Color.fromRGBO(255, 255, 255, 0.0),
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
    );
    return MouseRegion(
      onEnter: (event) => setState(() => _hover = true),
      onExit: (event) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 128),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          gradient: widget.secondary ? ButtonStyle.secondaryBorderGradient : ButtonStyle.primaryBorderGradient,
          borderRadius: radius,
          boxShadow:
              _hover
                  ? [
                    BoxShadow(
                      offset: Offset(0, 6),
                      color: Color.fromARGB(76, 0, 0, 0),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      offset: Offset(0, 2.8),
                      color: Color.fromARGB(128, 0, 78, 187),
                      blurRadius: 2.8,
                    ),
                    BoxShadow(
                      inset: true,
                      offset: Offset(0, 4),
                      color: Color.fromARGB(204, 0, 17, 49),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      inset: true,
                      offset: Offset(0, 6),
                      color: Color.fromARGB(194, 0, 78, 187),
                      blurRadius: 8,
                      spreadRadius: 4,
                    ),
                  ]
                  : [],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: widget.secondary ? ButtonStyle.secondaryBackgroundGradient : ButtonStyle.primaryBackgroundGradient,
          ),
          child: Stack(
            children: [
              if (widget.secondary) topShine,
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
                  child: widget.child,
                ),
              ),
              if (!widget.secondary) topShine,
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
