import 'dart:developer' as developer;

import 'package:authentication/l10n/arb/authentication_localization.dart';
import 'package:core/app_module.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'l10n/authentication_localization.dart';

final _appRoutes = <GoRoute>[
  GoRoute(
    path: _RouteNames.authRouteName,
    builder: (context, state) => const _AuthPage(),
    routes: [
      GoRoute(path: 'signup', builder: (context, state) => const SignupPage()),
      GoRoute(
        path: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: 'verify-otp',
        builder: (context, state) => const VerifyOtpPage(),
      ),
    ],
  ),
];

class AuthModule extends AppModule {
  @override
  String get key => 'auth';

  @override
  NavigationTab? get navigationTab => NavigationTab(
    icon: Icons.login,
    label: 'Auth',
    initialLocation: _RouteNames.authRouteName,
  );

  @override
  List<RouteBase> get routes => _appRoutes;

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

class _AuthPage extends StatelessWidget {
  const _AuthPage();

  @override
  Widget build(BuildContext context) => const _LoginPage();
}

class _RouteNames {
  static const String authRouteName = "/auth";
}

class _LoginPage extends StatefulWidget {
  const _LoginPage({super.key});

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      // Do login logic here
      print('Email: $email\nPassword: $password');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.loginTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 14),
              TextButton(
                onPressed: () => context.go('/auth/signup'),
                child: const Text('Sign Up'),
              ),

              const SizedBox(height: 14),
              TextButton(
                onPressed: () => context.go('/auth/forgot-password'),
                child: const Text('Forgot Password?'),
              ),

              const SizedBox(height: 14),
              TextButton(
                onPressed: () => context.go('/auth/verify-otp'),
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: const Center(child: Text('Signup Page')),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: const Center(child: Text('Forgot Password Page')),
    );
  }
}

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: const Center(child: Text('Verify OTP Page')),
    );
  }
}
