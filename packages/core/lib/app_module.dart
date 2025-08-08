
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract class AppModule {
  /// Unique key to identify the module (used in debugging or ordering)
  String get key;

  /// Routes exposed by this module
  List<RouteBase> get routes;

  /// Optional tab item to show in BottomNavigationBar
  NavigationTab? get navigationTab;

  /// Called once when the module is initialized, Passing the GetIt instance from
  /// the main app i.e. app1, app2, app3 it makes easier to communicate between
  /// different packages as they will be register app wide.
  void init(GetIt getIt) {}

  LocalizationsDelegate? get localizationDelegate;
}

class NavigationTab {
  final IconData icon;
  final String label;
  final String initialLocation;

  NavigationTab({
    required this.icon,
    required this.label,
    required this.initialLocation,
  });
}
