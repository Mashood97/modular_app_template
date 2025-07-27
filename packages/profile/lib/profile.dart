import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => const ProfileView();
}

final routes = <GoRoute>[
  GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
];

final BottomNavigationBarItem tab = BottomNavigationBarItem(
  icon: Icon(Icons.person),
  label: 'Profile',
);

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
