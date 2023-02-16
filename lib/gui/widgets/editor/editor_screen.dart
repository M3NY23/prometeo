import 'package:flutter/material.dart';
import 'package:prometeo/gui/themes/app_theme.dart';
import 'editor_center_body.dart';
import 'editor_content_bar.dart';

import 'editor_controls_bottom_bar.dart';
import 'editor_screen_side_bar.dart';

class EditorScreen extends StatelessWidget {
  final EditorScreenSideBar sideBar;
  final EditorContentBar contentBar;
  final EditorControlsBottomBar controlsBottomBar;
  final EditorCenterBody centerBody;
  const EditorScreen(
      {super.key,
      required this.sideBar,
      required this.contentBar,
      required this.controlsBottomBar,
      required this.centerBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Column(
          children: [
            // TODO fix duplicated shortcuts
            // const HomeScreenMenuBar(),
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
