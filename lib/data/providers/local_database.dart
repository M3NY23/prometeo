import 'package:hive/hive.dart';

class LocalDatabase {
  static init() async {
    Hive.init("prometeo_local_db");
  }
}
