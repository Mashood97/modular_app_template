import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppModule {
  /// Unique key to identify the module (used in debugging or ordering)
  String get key;

  /// Routes exposed by this module
  List<RouteBase> get routes;

  /// Optional tab item to show in BottomNavigationBar
  NavigationTab? get navigationTab;

  /// Called once when the module is initialized
  void init() {}

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
