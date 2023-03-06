import 'package:hive/hive.dart';

class LocalDatabase {
  static const int tempDirIndex = 0;

  static init() async {
    Hive.init("prometeo_local_db");
  }
}
