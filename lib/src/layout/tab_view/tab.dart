import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme/button_style.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

const _kTabBorderRadius = BorderRadius.all(Radius.circular(4.0));

/// {@template AquaTab}
/// A Aqua-style navigational button used to move between the views of a
/// [AquaTabView].
/// {@endtemplate}
class AquaTab extends StatelessWidget {
  /// {@macro AquaTab}
  const AquaTab({super.key, required this.label, this.active = false});

  /// The display label for this tab.
  final String label;

  /// Whether this [AquaTab] is currently selected. Handled internally by
  /// [AquaSegmentedControl]'s build function.
  final bool active;

  @override
  Widget build(BuildContext context) {
    // final brightness = AquaTheme.brightnessOf(context);
    return PhysicalModel(
      color: active ? DefaultAquaColors.aquaSegmentedControlOutlineStroke : AquaColors.transparent,
      // borderRadius: _kTabBorderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            if(active)
            BoxShadow(inset: true, color: AquaColors.blue, offset: Offset(0, 1.5),)
          ] ,
          gradient: active ? ButtonStyle.primaryBackgroundGradient : null
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(label),
        ),
      ),
    );
  }

  /// Copies this [AquaTab] into another.
  AquaTab copyWith({String? label, bool? active}) {
    return AquaTab(label: label ?? this.label, active: active ?? this.active);
  }
}
