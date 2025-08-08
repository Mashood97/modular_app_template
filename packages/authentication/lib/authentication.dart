import 'dart:developer' as developer;

import 'package:authentication/l10n/arb/authentication_localization.dart';
import 'package:authentication/navigation/auth_nav_routes.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthModule extends AppModule {


  @override
  String get key => 'auth';

  @override
  NavigationTab? get navigationTab => NavigationTab(
    icon: Icons.login,
    label: 'Auth',
    initialLocation: RouteNames.authRouteName,
  );

  @override
  List<RouteBase> get routes => AuthNavRoutes().appRoutes;

  @override
  void init(GetIt getIt) {
    //Setup your DI here.

    if (kDebugMode) {
      developer.log('DI INIT CALLED FOR :::: $key');
    }
    //  Then wherever you're loading your modules (e.g., AppModulesLoader or AppShell), call:
    //  for (final module in appModules) {
    //    module.init();
    //  }
  }

  @override
  LocalizationsDelegate? get localizationDelegate => AuthLocalizations.delegate;
}
