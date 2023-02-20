import 'package:hive/hive.dart';

class RecentFilesProvider {
  static Box? _box;
  static const String boxName = "recent_files";
  static Future<bool?> init() async {
    if (_box == null) {
      try {
        await Hive.openBox(boxName);
      } catch (ex) {
        return false;
      }
    }
    return _box?.isOpen;
  }
}
