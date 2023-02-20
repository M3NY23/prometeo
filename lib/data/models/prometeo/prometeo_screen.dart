import 'prometeo_variable.dart';

import 'prometeo_component.dart';
import 'prometeo_script.dart';

class PrometeoScreen {
  List<PrometeoComponent> components;
  List<PrometeoScript> scripts;
  List<PrometeoVariable> variables;
  List<PrometeoVariable> controls;
  String name;
  PrometeoScreen({
    this.name = "",
    this.components = const [],
    this.scripts = const [],
    this.variables = const [],
    this.controls = const [],
  });
}
