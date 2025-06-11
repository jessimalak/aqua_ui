import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme/button_style.dart';
import 'package:aqua_ui/src/styles/theme/global_styles.dart';
import 'package:flutter/cupertino.dart';

class AquaCheckbox extends StatefulWidget {
  final bool value;
  final void Function(bool value)? onChanged;
  const AquaCheckbox({super.key, required this.value, required this.onChanged});

  static const BorderRadius _radius = BorderRadius.all(Radius.circular(4));

  @override
  State<AquaCheckbox> createState() => _AquaCheckboxState();
}

class _AquaCheckboxState extends State<AquaCheckbox> {
  bool _hover = false;
  static const double padding = 5;
  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onChanged != null;
    final topShine = Positioned(
      top: 1 + padding,
      left: 2 + padding,
      right: 2 + padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(2),
            bottom: Radius.circular(1),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0.8),
              Color.fromRGBO(255, 255, 255, 0.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // boxShadow: [
          //   BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.5), blurRadius: 3),
          // ],
        ),
        child: SizedBox(height: 8),
      ),
    );
    return GestureDetector(
      onTap: () {
        if (!isEnabled) return;
        widget.onChanged!(!widget.value);
      },
      child: MouseRegion(
        onEnter: (event) => setState(() => _hover = true),
        onExit: (event) => setState(() => _hover = false),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(padding),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 128),
                // padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  borderRadius: AquaCheckbox._radius,
                  gradient:
                      widget.value
                          ? ButtonStyle.primaryBorderGradient
                          : ButtonStyle.secondaryBorderGradient,
                  boxShadow: [
                    GlobalStyles.controlsShadow,
                    if (_hover) ...GlobalStyles.controlsHoverShadow,
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: AquaCheckbox._radius,
                        gradient:
                            widget.value
                                ? ButtonStyle.primaryBackgroundGradient
                                : ButtonStyle.secondaryBackgroundGradient,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            topShine,

            Positioned(
              right: padding / 23,
              top: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder:
                    (child, animation) => ScaleTransition(
                      scale: animation,
                      alignment: Alignment.center,
                      child: child,
                    ),
                child:
                    widget.value
                        ? Icon(
                          CupertinoIcons.check_mark,
                          size: 22,
                          color: AquaColors.darkBlue,
                        )
                        : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
