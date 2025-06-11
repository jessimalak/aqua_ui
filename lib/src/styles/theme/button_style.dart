import 'package:flutter/cupertino.dart';

class ButtonStyle {
  //PRIMARY STYLES
  static const LinearGradient primaryBorderGradient = LinearGradient(
    colors: [Color(0xff1d3caa), Color(0xff758ad5)],
    begin: Alignment.topCenter,
    end: Alignment.topCenter,
  );
  static const LinearGradient primaryBackgroundGradient = LinearGradient(
    colors: [Color(0xFF0075FE), Color(0xFF74EBFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  //SECONDARY STYLES
  static const LinearGradient secondaryBorderGradient = LinearGradient(
    colors: [Color(0xff666666), Color(0xffc0c0c0)],
    begin: Alignment.topCenter,
    end: Alignment.topCenter,
  );
  static const LinearGradient secondaryBackgroundGradient = LinearGradient(
    colors: [Color(0xFFacacac), Color(0xFFffffff)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
