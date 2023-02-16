import 'package:flutter/material.dart';
import 'package:prometeo/gui/widgets/editor/editor_center_body.dart';
import 'package:prometeo/gui/widgets/editor/editor_content_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_controls_bottom_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_side_bar.dart';

class ScenesScreen extends StatelessWidget {
  static const String route = "/scenes";
  const ScenesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditorScreen(
        sideBar: EditorScreenSideBar(selectedScreen: 0),
        contentBar: EditorContentBar(),
        controlsBottomBar: EditorControlsBottomBar(),
        centerBody: EditorCenterBody());
  }
}
