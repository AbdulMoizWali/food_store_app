import 'package:flutter/material.dart';
import 'package:food_store/login/view/login_page.dart';
import 'package:food_store/routes/route_path.dart';
import 'package:food_store/routes/route_transition.dart';
import 'package:food_store/signup/view/signup_page.dart';
import 'package:food_store/splash/splash.dart';

class RoutesGenerator {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case RoutePath.splash:
          return SplashPage.route();

        // case RoutePath.onboarding:
        //   return RouteTransition.pageRouteBuilder(const OnboardingScreen());

        case RoutePath.login:
          return LoginPage.route();

        case RoutePath.signup:
          return SignupPage.route();

        default:
          return RouteTransition.pageRouteBuilder(const NotFoundScreen());
      }
    } catch (e) {
      return RouteTransition.pageRouteBuilder(
        ErrorScreen(message: e.toString()),
      );
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Error found',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text('Error message: $message'),
          ],
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
