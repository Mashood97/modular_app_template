import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      const HomeView();
}

final routes = <GoRoute>[
  GoRoute(path: '/home', builder: (context, state) => const HomePage()),
];

final BottomNavigationBarItem tab = BottomNavigationBarItem(
  icon: Icon(Icons.home),
  label: 'Home',
);



class HomeView extends StatelessWidget {
  const HomeView({super.key});

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