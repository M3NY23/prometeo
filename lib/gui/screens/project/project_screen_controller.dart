import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/data/models/prometeo/prometeo_game.dart';
import 'package:prometeo/data/repositories/game_repository.dart';
import 'package:prometeo/domain/util/utils.dart';
import 'package:prometeo/gui/screens/scenes/scenes_screen.dart';
import 'package:prometeo/gui/util/function_dialogs.dart';

class ProjectScreenController {
  newProject(BuildContext context) async {
    String name = await showLineDialog(context, title: "New project");
    if (name.isNotEmpty && context.mounted) {
      GameRepository.setNewGame(name);
      context.go(ScenesScreen.route);
    }
  }
}
