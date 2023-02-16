import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prometeo/gui/widgets/editor/editor_menu_bar.dart';
import 'package:prometeo/gui/themes/app_theme.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_menu_bar.dart';
import 'editor_center_body.dart';
import 'editor_content_bar.dart';

import 'editor_controls_bottom_bar.dart';
import 'editor_screen_side_bar.dart';

class EditorScreen extends StatelessWidget {
  final EditorScreenSideBar sideBar;
  final EditorContentBar contentBar;
  final EditorControlsBottomBar controlsBottomBar;
  final EditorCenterBody centerBody;
  final EditorScreenMenuBar menuBar;
  const EditorScreen(
      {super.key,
      required this.sideBar,
      required this.contentBar,
      required this.controlsBottomBar,
      required this.centerBody,
      required this.menuBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Column(
          children: [
            menuBar,
            Expanded(
              child: Row(children: [
                sideBar,
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [centerBody, controlsBottomBar],
                  ),
                ),
                contentBar
              ]),
            ),
          ],
        ));
  }
}
