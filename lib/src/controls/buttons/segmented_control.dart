import 'package:aqua_ui/src/layout/tab_view/tab.dart';
import 'package:aqua_ui/src/layout/tab_view/tab_controller.dart';
import 'package:aqua_ui/src/library.dart';
import 'package:aqua_ui/src/styles/colors.dart';
import 'package:aqua_ui/src/styles/theme/button_style.dart';
import 'package:aqua_ui/src/styles/theme/tab_style.dart';

/// {@template AquaSegmentedControl}
/// Displays one or more navigational tabs in a single horizontal group.
///
/// Used by [AquaTabView] to navigate between the different tabs of the tab bar.
///
/// [AquaSegmentedControl] can be considered somewhat analogous to Flutter's
/// material `TabBar` in that it requires a list of [tabs]. Unlike `TabBar`,
/// however, [AquaSegmentedControl] explicitly requires a [controller].
///
/// See also:
/// * [AquaTab], which is a navigational item in a [AquaSegmentedControl].
/// * [AquaTabView], which is a multi-page navigational view.
/// {@endtemplate}
class AquaSegmentedControl extends StatefulWidget {
  /// {@macro AquaSegmentedControl}
  ///
  /// [tabs] and [controller] must not be null. [tabs] must contain at least one
  /// tab.
  const AquaSegmentedControl({
    super.key,
    required this.tabs,
    required this.controller,
  }) : assert(tabs.length > 0);

  /// The navigational items of this [AquaSegmentedControl].
  final List<AquaTab> tabs;

  /// The [AquaTabController] that manages the [tabs] in this
  /// [AquaSegmentedControl].
  final AquaTabController controller;

  @override
  State<AquaSegmentedControl> createState() => _AquaSegmentedControlState();
}

class _AquaSegmentedControlState extends State<AquaSegmentedControl> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: ButtonStyle.secondaryBackgroundGradient,

        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4F5155),
            offset: const Offset(0, 1),
            blurRadius: 0.5,
            // spreadRadius: 0.5,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.5),
            child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: IntrinsicHeight(
                child: IntrinsicWidth(
                  child: Row(
                    children: widget.tabs
                        .map((t) {
                          final row = Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.controller.index = widget.tabs.indexOf(
                                      t,
                                    );
                                  });
                                },
                                child: t.copyWith(
                                  active:
                                      widget.controller.index ==
                                      widget.tabs.indexOf(t),
                                ),
                              ),
                            ],
                          );
                          bool showDividerColor = true;
                          final last =
                              widget.tabs.indexOf(t) == widget.tabs.length - 1;
                          if ((widget.controller.index - 1 ==
                                  widget.tabs.indexOf(t)) ||
                              (widget.controller.index + 1 ==
                                  widget.tabs.indexOf(t) + 1) ||
                              last) {
                            showDividerColor = false;
                          }
              
                          if (!last) {
                            row.children.add(
                              VerticalDivider(
                                color:
                                    showDividerColor
                                        ? DefaultAquaColors.aquaTranslucentGray
                                        : AquaColors.transparent,
                                width: 2.0,
                              ),
                            );
                          }
              
                          return row;
                        })
                        .toList(growable: false),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 1,
            left: 2,
            right: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5),
                  bottom: Radius.circular(2),
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
              child: SizedBox(height: 4),
            ),
          ),
        ],
      ),
    );
  }
}
