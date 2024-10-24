import 'package:flutter/material.dart';
import 'package:food_store/l10n/l10n.dart';
import 'package:food_store/routes/route_transition.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<dynamic> route() {
    return RouteTransition.pageRouteBuilder(
      const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Center(
        child: Text(l10n.loginPageHeadline),
      ),
    );
  }
}
