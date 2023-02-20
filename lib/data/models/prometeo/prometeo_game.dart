import 'package:prometeo/data/models/prometeo/prometeo_screen.dart';

import 'prometeo_script.dart';

class PrometeoGame {
  final String filePath;
  final String name;
  final List<PrometeoScreen> screens;
  final List<PrometeoScript> scripts;
  const PrometeoGame({
    this.filePath = "",
    this.name = "",
    this.screens = const [],
    this.scripts = const [],
  });
}
