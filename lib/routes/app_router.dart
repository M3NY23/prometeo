import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:prometeo/screens/home_screen.dart';

class AppRouter {

  static const initialRoute = 'home'; 

  static final routes = <String, Widget Function(BuildContext)> {
    'home': (BuildContext context) => const HomeScreen()
  };

}