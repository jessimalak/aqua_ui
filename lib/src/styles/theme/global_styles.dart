import 'dart:ui';

import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

class GlobalStyles {
  static const BoxShadow controlsShadow = BoxShadow(
    offset: Offset(0, 2),
    color: Color.fromARGB(255, 161, 161, 161),
    blurRadius: 2,
  );

  static const List<BoxShadow> hoverShadow = [
    // BoxShadow(
    //   offset: Offset(0, 6),
    //   color: Color.fromARGB(76, 0, 0, 0),
    //   blurRadius: 8,
    // ),
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
    // BoxShadow(
    //   inset: true,
    //   offset: Offset(0, 6),
    //   color: Color.fromARGB(194, 0, 78, 187),
    //   blurRadius: 8,
    //   spreadRadius: 4,
    // ),
  ];

  static const List<BoxShadow> controlsHoverShadow = [
    // BoxShadow(
    //   offset: Offset(0, 6),
    //   color: Color.fromARGB(76, 0, 0, 0),
    //   blurRadius: 8,
    // ),
    BoxShadow(
      offset: Offset(0, 1.4),
      color: Color.fromARGB(128, 0, 78, 187),
      blurRadius: 1.4,
    ),
    BoxShadow(
      inset: true,
      offset: Offset(0, 2),
      color: Color.fromARGB(204, 0, 17, 49),
      blurRadius: 4,
    ),
    // BoxShadow(
    //   inset: true,
    //   offset: Offset(0, 6),
    //   color: Color.fromARGB(194, 0, 78, 187),
    //   blurRadius: 8,
    //   spreadRadius: 4,
    // ),
  ];
}
