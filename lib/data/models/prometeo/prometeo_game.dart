import 'package:prometeo/data/models/prometeo/prometeo_screen.dart';

import 'prometeo_script.dart';

class PrometeoGame {
  final String filePath;
  final String name;
  final String timeStamp;
  final List<PrometeoScreen> screens;
  final List<PrometeoScript> scripts;
  const PrometeoGame({
    this.filePath = "",
    this.name = "",
    this.timeStamp = "",
    this.screens = const [],
    this.scripts = const [],
  });
}
