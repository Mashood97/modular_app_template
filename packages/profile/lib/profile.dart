import 'package:core/app_module.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/l10n/arb/profile_localization.dart';

final _appRoutes = <GoRoute>[
  GoRoute(
    path: _RouteNames.profileRouteName,
    builder: (context, state) => const _ProfilePage(),
  ),
];

class ProfileModule extends AppModule {
  @override
  String get key => 'profile';

  @override
  NavigationTab? get navigationTab => NavigationTab(
    icon: Icons.person,
    label: 'Profile',
    initialLocation: _RouteNames.profileRouteName,
  );

  @override
  List<RouteBase> get routes => _appRoutes;

  @override
  void init() {
    //Setup your DI here.
  }

  @override
  LocalizationsDelegate? get localizationDelegate =>
      ProfileLocalizations.delegate;
}

class _RouteNames {
  static const String profileRouteName = '/profile';
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => const _ProfileView();
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    const String userName = "Mashood Siddiquie";
    const String email = "mashood@example.com";

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/avatar.png',
              ), // Replace with actual image or NetworkImage
            ),
            const SizedBox(height: 16),
            Text(userName),
            const SizedBox(height: 8),
            Text(email),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              onPressed: () {
                // Navigate to edit profile
              },
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              onPressed: () {
                // Handle logout logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
