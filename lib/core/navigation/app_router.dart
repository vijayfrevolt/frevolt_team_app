import 'package:frevolt_team_app/core/navigation/routes.dart';
import 'package:frevolt_team_app/features/auth/presentation/pages/login_page.dart';
import 'package:frevolt_team_app/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:frevolt_team_app/features/dashboard/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.otp,
      builder: (context, state) {
        final mobileNumber = state.extra as String;

        return OtpVerificationPage(
          mobileNumber: mobileNumber,
        );
      },
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);