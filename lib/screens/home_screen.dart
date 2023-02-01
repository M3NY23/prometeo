import 'package:flutter/material.dart';
import 'package:prometeo/screens/widgets/home_screen_menu_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String route = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Prometeo"),
        ),
        body: Column(
          children: [
            const HomeScreenMenuBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome to PROMETEO',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
