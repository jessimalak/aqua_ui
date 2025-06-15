import 'package:aqua_ui/src/controls/buttons/segmented_control.dart';
import 'package:aqua_ui/src/layout/tab_view/tab.dart';
import 'package:aqua_ui/src/layout/tab_view/tab_controller.dart';
import 'package:aqua_ui/src/styles/colors.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';

const _kTabViewRadius = BorderRadius.all(Radius.circular(5.0));

/// {@template AquaTabView}
/// A multipage interface that displays one page at a time.

/// A tab view contains a row of navigational items, [tabs], that move the
/// user through the provided views ([children]). The user selects the desired
/// page by clicking the appropriate tab.
///
/// The tab controller's [AquaTabController.length] must equal the length of
/// the [children] list and the length of the [tabs] list.
/// {@endtemplate}
class AquaTabView extends StatefulWidget {
  /// {@macro AquaTabView}
  const AquaTabView({
    super.key,
    required this.controller,
    required this.tabs,
    required this.children,
    this.padding = const EdgeInsets.all(12.0),
    this.contentPadding = const EdgeInsets.fromLTRB(8, 16, 4, 8)
  }) : assert(
         controller.length == children.length &&
             controller.length == tabs.length,
       );

  /// This widget's selection state.
  final AquaTabController controller;

  /// A list of navigational items, typically a length of two or more.
  final List<AquaTab> tabs;

  /// The views to navigate between.
  ///
  /// There must be one widget per tab.
  final List<Widget> children;

  /// The padding of the tab view widget.
  ///
  /// Defaults to `EdgeInsets.all(12.0)`.
  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry contentPadding;

  @override
  State<AquaTabView> createState() => _AquaTabViewState();
}

class _AquaTabViewState extends State<AquaTabView> {
  late List<Widget> _childrenWithKey;
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    _updateChildren();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = widget.controller.index;
  }

  @override
  void didUpdateWidget(AquaTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
      _currentIndex = widget.controller.index;
    }
    if (widget.children != oldWidget.children) {
      _updateChildren();
    }
  }

  void _updateTabController() {
    widget.controller.addListener(_handleTabControllerTick);
  }

  void _handleTabControllerTick() {
    if (widget.controller.index != _currentIndex) {
      _currentIndex = widget.controller.index;
    }
    setState(() {
      // Rebuild the children after an index change
      // has completed.
    });
  }

  void _updateChildren() {
    _childrenWithKey = KeyedSubtree.ensureUniqueKeysForList(widget.children);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTabControllerTick);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (widget.controller.length != widget.children.length) {
        throw FlutterError(
          "Controller's length property (${widget.controller.length}) does not match the "
          "number of tabs (${widget.children.length}) present in TabBar's tabs property.",
        );
      }
      return true;
    }());

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: widget.padding,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: DefaultAquaColors.aquaTabBackground,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(242, 114, 114, 114),
                  offset: Offset(0, 2),
                  inset: true,
                  blurRadius: 2
                ),
              ],
              border: Border.all(
                color: DefaultAquaColors.aquaTabOutline,
                width: 1.0,
              ),
              borderRadius: _kTabViewRadius,
            ),
            child: Padding(
              padding: widget.contentPadding,
              child: IndexedStack(
                index: _currentIndex,
                children: _childrenWithKey,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: AquaSegmentedControl(
            controller: widget.controller,
            tabs: widget.tabs,
          ),
        ),
      ],
    );
  }
}
