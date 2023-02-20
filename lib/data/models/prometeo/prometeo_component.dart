import 'package:flutter/material.dart';
import 'package:prometeo/data/models/prometeo/prometeo_sprite.dart';
import 'package:prometeo/data/models/prometeo/prometeo_variable.dart';

class PrometeoComponent {
  String name;
  List<PrometeoVariable> variables;
  Size size;
  Offset position;
  PrometeoSprite? sprite;
  List<PrometeoVariable> controls;

  PrometeoComponent(
      {this.name = "",
      this.variables = const [],
      this.sprite,
      this.size = const Size(0, 0),
      this.controls = const [],
      this.position = const Offset(0, 0)});
}
