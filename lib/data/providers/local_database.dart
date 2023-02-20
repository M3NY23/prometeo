import 'package:hive/hive.dart';

class LocalDatabase {
  static Box? _box;
  static _init() async {
    if (_box == null) {
      await Hive.openBox("local_prometeo");
    }
  }
}
