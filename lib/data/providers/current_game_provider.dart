import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CurrentGameProvider {
  static Box? _box;
  static const String boxName = "current_game";
  static Future<bool?> init() async {
    if (_box == null) {
      try {
        await Hive.openBox(boxName);
        debugPrint("CurrentGameProvider box initialized");
      } catch (ex) {
        return false;
      }
    }
    return _box?.isOpen;
  }
}
