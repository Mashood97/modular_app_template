import 'package:authentication/authentication.dart' as AuthModule;
import 'package:core/app_module.dart';
import 'package:core/core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home/home.dart' as HomeModule;
import 'package:orders/orders.dart' as OrderModule;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final getIt = GetIt.instance;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<AppModule> activeModules = [
    AuthModule.AuthModule(),
    HomeModule.HomeModule(),
    OrderModule.OrderModule(),
  ];

  final tabs = <NavigationTab>[];
  final localizationDelegates = <LocalizationsDelegate>[];
  final branches = <StatefulShellBranch>[];
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    for (final module in activeModules) {


      module.init(getIt); // THIS IS FOR DI.
      if (module.localizationDelegate != null) {
        localizationDelegates.add(module.localizationDelegate!);
      }
      if (module.navigationTab != null) {
        final tab = module.navigationTab;
        tabs.add(tab!);

        branches.add(StatefulShellBranch(routes: module.routes));
      }
    }

    _router = GoRouter(
      initialLocation: tabs.first.initialLocation,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomBarShell(navigationShell: navigationShell, tabs: tabs);
          },
          branches: branches,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        // Include feature module delegates
        ...localizationDelegates,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.amberAccent,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          errorColor: Colors.red,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.amberAccent,
          backgroundColor: Colors.black,
          brightness: Brightness.dark,
          errorColor: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomBarShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<NavigationTab> tabs;

  const BottomBarShell({
    super.key,
    required this.navigationShell,
    required this.tabs,
  });

  @override
  State<BottomBarShell> createState() => _BottomBarShellState();
}

class _BottomBarShellState extends State<BottomBarShell> {
  void _onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onTap,
        items: widget.tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
