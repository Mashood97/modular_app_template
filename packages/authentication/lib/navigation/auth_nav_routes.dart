import 'package:go_router/go_router.dart';
import '../view/forgot_password.dart';
import '../view/login_page.dart';
import '../view/signup_page.dart';
import '../view/verify_otp.dart';

enum AuthPageId { login, register, forgotPassword, verifyOtp }

class AuthNavRoutes {
  final appRoutes = <GoRoute>[
    GoRoute(
      path: RouteNames.authRouteName,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: RouteNames.signUpRouteName,
          builder: (context, state) => const SignupPage(),
        ),
        GoRoute(
          path: RouteNames.forgotPasswordRouteName,
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: RouteNames.verifyOtpRouteName,
          builder: (context, state) => const VerifyOtpPage(),
        ),
      ],
    ),
  ];
}

class RouteNames {
  static const String authRouteName = "/auth";
  static const String signUpRouteName = "signup";
  static const String forgotPasswordRouteName = "forgot-password";
  static const String verifyOtpRouteName = "verify-otp";
}
