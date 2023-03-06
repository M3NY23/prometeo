import 'package:flutter/material.dart';
import 'package:prometeo/data/repositories/game_repository.dart';

class EditorCenterBody extends StatelessWidget {
  final Widget? child;
  const EditorCenterBody({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: child ??
          Placeholder(
            child: Center(
              child: Text("${GameRepository.game.name}"),
            ),
          ),
    );
  }
}
