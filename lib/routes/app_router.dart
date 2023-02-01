import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/screens/home_screen.dart';

class AppRouter {
  static const initialRoute = HomeScreen.route;

  static final router = GoRouter(initialLocation: initialRoute, routes: [
    GoRoute(
      path: initialRoute,
      pageBuilder: (context, state) =>
          customTransition(const HomeScreen(), state),
    ),
  ]);

  static CustomTransitionPage customTransition(
      Widget child, GoRouterState state) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, _, child) => FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ));
  }
}
