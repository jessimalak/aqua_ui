import 'package:aqua_ui/src/layout/scrollbar.dart';
import 'package:aqua_ui/src/styles/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' as m;

class AquaApp extends StatefulWidget {
  const AquaApp(
      {super.key,
      this.home,
      this.navigatorKey,
      this.routes = const {},
      this.initialRoute,
      this.onGenerateRoute,
      this.onGenerateInitialRoutes,
      this.onUnknownRoute,
      this.navigatorObservers = const [],
      this.builder,
      required this.title,
      this.onGenerateTitle,
      this.locale,
      this.localizationsDelegates,
      this.localeListResolutionCallback,
      this.localeResolutionCallback,
      this.supportedLocales = const <Locale>[Locale('en', 'US')],
      this.showPerformanceOverlay = false,
      this.checkerboardRasterCacheImages = false,
      this.checkerboardOffscreenLayers = false,
      this.showSemanticsDebugger = false,
      this.debugShowCheckedModeBanner = true,
      this.shortcuts,
      this.actions,
      this.restorationScopeId,
      this.theme})
      : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        routerConfig = null;
  const AquaApp.router(
      {super.key,
      this.routeInformationProvider,
      this.routeInformationParser,
      this.routerDelegate,
      this.backButtonDispatcher,
      this.routerConfig,
      this.builder,
      required this.title,
      this.onGenerateTitle,
      this.locale,
      this.localizationsDelegates,
      this.localeListResolutionCallback,
      this.localeResolutionCallback,
      this.supportedLocales = const <Locale>[
        Locale('en', 'US'),
      ],
      this.showPerformanceOverlay = false,
      this.checkerboardRasterCacheImages = false,
      this.checkerboardOffscreenLayers = false,
      this.showSemanticsDebugger = false,
      this.debugShowCheckedModeBanner = true,
      this.shortcuts,
      this.actions,
      this.restorationScopeId,
      this.theme})
      : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onUnknownRoute = null,
        initialRoute = null,
        onGenerateInitialRoutes = null,
        routes = null;
  final Widget? home;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Map<String, WidgetBuilder>? routes;

  /// {@macro flutter.widgets.widgetsApp.initialRoute}
  final String? initialRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateRoute}
  final RouteFactory? onGenerateRoute;

  /// {@macro flutter.widgets.widgetsApp.onGenerateInitialRoutes}
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// {@macro flutter.widgets.widgetsApp.onUnknownRoute}
  final RouteFactory? onUnknownRoute;

  /// {@macro flutter.widgets.widgetsApp.navigatorObservers}
  final List<NavigatorObserver>? navigatorObservers;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  /// {@macro flutter.widgets.widgetsApp.routerConfig}
  final RouterConfig<Object>? routerConfig;

  /// {@macro flutter.widgets.widgetsApp.builder}
  final TransitionBuilder? builder;

  /// {@macro flutter.widgets.widgetsApp.title}
  ///
  /// This value is passed unmodified to [WidgetsApp.title].
  final String title;

  /// {@macro flutter.widgets.widgetsApp.onGenerateTitle}
  ///
  /// This value is passed unmodified to [WidgetsApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// {@macro flutter.widgets.widgetsApp.locale}
  final Locale? locale;

  /// {@macro flutter.widgets.widgetsApp.localizationsDelegates}
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// {@macro flutter.widgets.widgetsApp.localeListResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// {@macro flutter.widgets.LocaleResolutionCallback}
  ///
  /// This callback is passed along to the [WidgetsApp] built by this widget.
  final LocaleResolutionCallback? localeResolutionCallback;

  /// {@macro flutter.widgets.widgetsApp.supportedLocales}
  ///
  /// It is passed along unmodified to the [WidgetsApp] built by this widget.
  final Iterable<Locale> supportedLocales;

  /// Turns on a performance overlay.
  ///
  /// See also:
  ///
  ///  * <https://flutter.dev/debugging/#performanceoverlay>
  final bool showPerformanceOverlay;

  /// Turns on checkerboarding of raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Turns on checkerboarding of layers rendered to offscreen bitmaps.
  final bool checkerboardOffscreenLayers;

  /// Turns on an overlay that shows the accessibility information
  /// reported by the framework.
  final bool showSemanticsDebugger;

  /// {@macro flutter.widgets.widgetsApp.debugShowCheckedModeBanner}
  final bool debugShowCheckedModeBanner;

  /// {@macro flutter.widgets.widgetsApp.shortcuts.seeAlso}
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;

  /// {@macro flutter.widgets.widgetsApp.restorationScopeId}
  final String? restorationScopeId;
  final AquaThemeData? theme;
  @override
  State<AquaApp> createState() => _AquaAppState();
}

class _AquaAppState extends State<AquaApp> {
  late HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController();
  }

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
        controller: _heroController, child: _builder(context, widget.home));
  }

  bool get _usesRouter =>
      widget.routerDelegate != null || widget.routerConfig != null;


  Widget _aquaBuilder(BuildContext context, Widget? child) {
    final theme = widget.theme ?? AquaThemeData();
    return AquaTheme(
        data: theme,
        child: DefaultTextStyle(
          style: TextStyle(color: theme.colorScheme.textColor, fontSize: 12),
          child: widget.builder != null
              ? Builder(
                  builder: (context) => Overlay(
                        initialEntries: [
                          OverlayEntry(
                              builder: (context) =>
                                  widget.builder!(context, child))
                        ],
                      ))
              : child ?? const SizedBox.shrink(),
        ));
  }

  Widget _builder(BuildContext context, Widget? child) {
    if (_usesRouter) {
      return m.CupertinoApp.router(
        key: GlobalObjectKey(this),
        routeInformationParser: widget.routeInformationParser,
        routeInformationProvider: widget.routeInformationProvider,
        routerDelegate: widget.routerDelegate,
        backButtonDispatcher: widget.backButtonDispatcher,
        routerConfig: widget.routerConfig,
        builder: _aquaBuilder,
        title: widget.title,
        onGenerateTitle: widget.onGenerateTitle,
        locale: widget.locale,
        localeListResolutionCallback: widget.localeListResolutionCallback,
        localeResolutionCallback: widget.localeResolutionCallback,
        localizationsDelegates: widget.localizationsDelegates,
        supportedLocales: widget.supportedLocales,
        showPerformanceOverlay: widget.showPerformanceOverlay,
        checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
        showSemanticsDebugger: widget.showSemanticsDebugger,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        shortcuts: widget.shortcuts,
        actions: widget.actions,
        scrollBehavior: const AquaScrollBehavior(),
      );
    }

    return m.CupertinoApp(
      key: GlobalObjectKey(this),
      navigatorKey: widget.navigatorKey,
      navigatorObservers: widget.navigatorObservers!,
      home: widget.home,
      routes: widget.routes!,
      initialRoute: widget.initialRoute,
      builder: _aquaBuilder,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      locale: widget.locale,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      localeResolutionCallback: widget.localeResolutionCallback,
      localizationsDelegates: widget.localizationsDelegates,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      scrollBehavior: const AquaScrollBehavior(),
    );
  }
}

class AquaScrollBehavior extends ScrollBehavior {
  const AquaScrollBehavior();

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return AquaScrollbar(controller: details.controller, child: child);
  }
}
