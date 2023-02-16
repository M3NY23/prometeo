import 'package:flutter/material.dart';

class IconKeys {
  static const String success = "success";
  static const String failure = "failure";
  static const String building = "building";
  static const String running = "running";
  static const double iconSize = 18;
  static final Map<String, Icon> icons = {
    success: const Icon(
      Icons.check,
      color: Colors.green,
      size: iconSize,
    ),
    failure: const Icon(
      Icons.cancel_sharp,
      color: Colors.red,
      size: iconSize,
    ),
    building: const Icon(
      Icons.handyman,
      color: Colors.purple,
      size: iconSize,
    ),
    running: const Icon(
      Icons.category_rounded,
      color: Colors.yellow,
      size: iconSize,
    ),
  };
}
