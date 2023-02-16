import 'package:flutter/material.dart';
import 'package:prometeo/routes/app_router.dart';
import 'package:prometeo/themes/app_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Prometeo',
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
