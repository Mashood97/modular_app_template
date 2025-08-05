import 'package:core/app_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home/l10n/arb/home_localization.dart';

final _appRoutes = <GoRoute>[
  GoRoute(
    path: _RouteNames.homeRouteName,
    builder: (context, state) => const _HomePage(),
  ),
];

class HomeModule extends AppModule {
  @override
  String get key => 'home';

  @override
  NavigationTab? get navigationTab => NavigationTab(
    icon: Icons.home,
    label: 'Home',
    initialLocation: _RouteNames.homeRouteName,
  );

  @override
  List<RouteBase> get routes => _appRoutes;

  @override
  void init() {
    //Setup your DI here.

    //  Then wherever you're loading your modules (e.g., AppModulesLoader or AppShell), call:
    //  for (final module in appModules) {
    //    module.init();
    //  }
  }

  @override
  LocalizationsDelegate? get localizationDelegate => HomeLocalizations.delegate;
}

class _RouteNames {
  static const String homeRouteName = '/home';
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) => const _HomeView();
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context); // Go back to login
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home Page!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
