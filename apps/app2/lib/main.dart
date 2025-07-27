import 'package:authentication/authentication.dart' as AuthModule;
import 'package:home/home.dart' as HomeModule;
import 'package:profile/profile.dart' as ProfileModule;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    initialLocation: AuthModule.RouteNames.authRouteName,
    routes: [
      StatefulShellRoute.indexedStack(
        branches: routesIfAvailable(),
        builder: (ctx, state, shell) => BottomBarShell(navigationShell: shell),
      ),
    ],
  );

  static List<StatefulShellBranch> routesIfAvailable() {
    final routes = <StatefulShellBranch>[];
    try {
      routes.add(StatefulShellBranch(routes: AuthModule.routes));
      routes.add(StatefulShellBranch(routes: HomeModule.routes));
      routes.add(StatefulShellBranch(routes: ProfileModule.routes));
    } catch (_) {}
    return routes;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.brown,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          errorColor: Colors.red,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.brown,
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

  const BottomBarShell({super.key, required this.navigationShell});

  @override
  State<BottomBarShell> createState() => _BottomBarShellState();
}

class _BottomBarShellState extends State<BottomBarShell> {

  final List<BottomNavigationBarItem> bottomTabs = [
    AuthModule.tab,
    HomeModule.tab,
    ProfileModule.tab,
  ];

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
        items: bottomTabs,
      ),
    );
  }
}