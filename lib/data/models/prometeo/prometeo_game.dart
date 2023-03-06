import 'package:prometeo/data/models/prometeo/prometeo_screen.dart';

import 'prometeo_script.dart';

class PrometeoGame {
  final String projectPath;
  final String name;
  final String timeStamp;
  final List<PrometeoScreen> screens;
  final List<PrometeoScript> scripts;
  const PrometeoGame({
    this.projectPath = "",
    this.name = "",
    this.timeStamp = "",
    this.screens = const [],
    this.scripts = const [],
  });

  String get projectName => name + timeStamp;
}
