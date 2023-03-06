import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:prometeo/data/repositories/game_repository.dart';
import 'package:prometeo/data/repositories/settings_repository.dart';

class GameRunner {
  String tempPath;
  GameRunner({required this.tempPath});

  // to avoid misspelling
  // TODO get flutter path
  static const String flutter = "C:\\Users\\ariel\\flutter\\bin\\flutter.bat";
  static const String run = "run";
  static const String device = "-d";
  static const String windows = "windows";
  static const String create = "create";
  static const String here = ".";

  createTempProject() async {
    Process p = await Process.start(
        flutter, [create, GameRepository.game.projectName],
        workingDirectory: GameRepository.game.projectPath);
    p.stdout.listen((event) {
      debugPrint(String.fromCharCodes(event));
    });
    p.stderr.listen((event) {
      debugPrint(String.fromCharCodes(event));
    });
  }

  runGame() async {
    Process p = await Process.start(flutter, [run, device, windows],
        workingDirectory: GameRepository.game.projectPath +
            Platform.pathSeparator +
            GameRepository.game.projectName);
    p.stdout.listen((event) {
      debugPrint(String.fromCharCodes(event));
    });
    p.stderr.listen((event) {
      debugPrint(String.fromCharCodes(event));
    });
  }
}
