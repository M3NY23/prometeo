import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prometeo/data/providers/local_database.dart';

class AppSettingsProvider {
  static Box? _box;
  static const String boxName = "app_settings";
  static Future<bool?> init() async {
    if (_box == null) {
      try {
        _box = await Hive.openBox(boxName);
        await setTempPath();
        debugPrint("AppSettingsProvider box initialized");
      } catch (ex) {
        return false;
      }
    }
    return _box?.isOpen;
  }

  static setTempPath() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    debugPrint("tempPath $tempPath");
    _box?.putAt(LocalDatabase.tempDirIndex, tempPath);
  }

  static String get tempPath {
    if (_box?.isOpen ?? false) {
      return _box?.getAt(LocalDatabase.tempDirIndex) ?? "";
    }
    return "";
  }
}
