import 'dart:ui';

import 'package:aqua_ui/src/styles/colors.dart';
import 'package:flutter/widgets.dart';

class ScrollbarThemeData {
  final Color backgroundColor;
  final Color thumbColor;
  final double thickness;
  final Radius radius;
  late final Color shadowColor1;
  late final Color shadowColor2;

  ScrollbarThemeData(
      {this.backgroundColor = AquaColors.white,
      this.thumbColor = AquaColors.blue,
      this.thickness = 14,
      this.radius = const Radius.circular(16)}) {
    final HSLColor hslColor = HSLColor.fromColor(thumbColor);
    shadowColor1 = hslColor.withLightness(clampDouble(hslColor.lightness - 0.3, 0, 1)).toColor();
    shadowColor2 = hslColor.withLightness(clampDouble(hslColor.lightness - 0.2, 0, 1)).toColor();
  }
}
