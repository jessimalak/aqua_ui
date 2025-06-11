import 'package:aqua_ui/src/styles/theme/color_scheme.dart';
import 'package:aqua_ui/src/styles/theme/scrollbar_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AquaTheme extends StatelessWidget {
  const AquaTheme({super.key, required this.data, required this.child});
  final AquaThemeData data;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InheritedAquaTheme(theme: this, child: child);
  }

  static AquaThemeData of(BuildContext context) {
    final _InheritedAquaTheme? inheritedAquaTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedAquaTheme>();
    return inheritedAquaTheme?.theme.data ?? AquaThemeData();
  }
}

class _InheritedAquaTheme extends InheritedWidget {
  final AquaTheme theme;

  const _InheritedAquaTheme({required this.theme, required super.child});
  @override
  bool updateShouldNotify(covariant _InheritedAquaTheme old) =>
      theme.data != old.theme.data;
}

class AquaThemeData with Diagnosticable {
  late final ScrollbarThemeData scrollbarTheme;
  final ColorScheme colorScheme;
  final BackgroundType backgroundType;

  AquaThemeData({
    this.colorScheme = const ColorScheme(),
    ScrollbarThemeData? scrollbarTheme,
    this.backgroundType = BackgroundType.lines
  }) {
    this.scrollbarTheme = scrollbarTheme ?? ScrollbarThemeData();
  }
}


enum BackgroundType{
  lines,
  metal,
  flat
}