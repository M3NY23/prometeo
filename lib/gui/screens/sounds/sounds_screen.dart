import 'package:flutter/material.dart';
import 'package:prometeo/gui/widgets/editor/editor_center_body.dart';
import 'package:prometeo/gui/widgets/editor/editor_content_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_controls_bottom_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_menu_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_side_bar.dart';

class SoundsScreen extends StatelessWidget {
  static const route = "/sounds";
  const SoundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditorScreen(
        menuBar: EditorScreenMenuBar(),
        sideBar: EditorScreenSideBar(
          selectedScreen: 2,
        ),
        contentBar: EditorContentBar(),
        controlsBottomBar: EditorControlsBottomBar(),
        centerBody: EditorCenterBody());
  }
}
