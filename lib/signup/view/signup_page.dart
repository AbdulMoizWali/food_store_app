import 'package:flutter/material.dart';
import 'package:food_store/routes/route_transition.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static Route<dynamic> route() {
    return RouteTransition.pageRouteBuilder(
      const SignupPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
