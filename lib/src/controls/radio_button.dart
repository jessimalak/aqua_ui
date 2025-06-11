import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme/button_style.dart';
import 'package:aqua_ui/src/styles/theme/global_styles.dart';
import 'package:flutter/cupertino.dart';

class AquaRadioButton<T> extends StatefulWidget {
  final T? value;
  final ValueChanged? onChanged;
  final T? groupValue;
  const AquaRadioButton({super.key, required this.value, required this.onChanged,  required this.groupValue});

  @override
  State<AquaRadioButton> createState() => _AquaRadioButtonState();
}

class _AquaRadioButtonState extends State<AquaRadioButton> {
  bool _hover = false;
  bool get selected => widget.groupValue == widget.value;
  @override
  Widget build(BuildContext context) {
    
    final topShine = Positioned(
      top: 1,
      left: 2,
      right: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
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
        if (widget.onChanged == null) return;
        widget.onChanged!(widget.value);
      },
      child: MouseRegion(
        onEnter: (event) => setState(() => _hover = true),
        onExit: (event) => setState(() => _hover = false),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 128),
              // padding: const EdgeInsets.all(padding),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    selected
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
                      shape: BoxShape.circle,
                      gradient:
                          selected
                              ? ButtonStyle.primaryBackgroundGradient
                              : ButtonStyle.secondaryBackgroundGradient,
                    ),
                  ),
                ),
              ),
            ),
            topShine,

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder:
                  (child, animation) => ScaleTransition(
                    scale: animation,
                    alignment: Alignment.center,
                    child: child,
                  ),
              child:
                  selected
                      ? Icon(
                        CupertinoIcons.circle_fill,
                        size: 8,
                        color: AquaColors.darkBlue,
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
