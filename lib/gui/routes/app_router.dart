import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/gui/screens/assets/assets_screen.dart';
import 'package:prometeo/gui/screens/code_editor/code_editor_screen.dart';
import 'package:prometeo/gui/screens/componentes/components_screen.dart';
import 'package:prometeo/gui/screens/scenes/scenes_screen.dart';
import 'package:prometeo/gui/screens/sounds/sounds_screen.dart';

class AppRouter {
  static const initialRoute = ScenesScreen.route;

  static final router = GoRouter(initialLocation: initialRoute, routes: [
    GoRoute(
      path: initialRoute,
      pageBuilder: (context, state) =>
          customTransition(const ScenesScreen(), state),
    ),
    GoRoute(
      path: CodeEditorScreen.route,
      pageBuilder: (context, state) =>
          customTransition(const CodeEditorScreen(), state),
    ),
    GoRoute(
      path: ComponentsScreen.route,
      pageBuilder: (context, state) =>
          customTransition(const ComponentsScreen(), state),
    ),
    GoRoute(
      path: SoundsScreen.route,
      pageBuilder: (context, state) =>
          customTransition(const SoundsScreen(), state),
    ),
    GoRoute(
      path: AssetsScreen.route,
      pageBuilder: (context, state) =>
          customTransition(const AssetsScreen(), state),
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
