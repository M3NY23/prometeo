import 'package:flutter/material.dart';
import 'package:prometeo/gui/themes/app_theme.dart';
import 'package:prometeo/gui/widgets/editor/editor_bottom_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_title_bar.dart';
import 'editor_center_body.dart';
import 'editor_content_bar.dart';

import 'editor_controls_bottom_bar.dart';
import 'editor_screen_side_bar.dart';

class EditorScreen extends StatelessWidget {
  final EditorTitleBar titleBar;
  final EditorScreenSideBar sideBar;
  final EditorContentBar contentBar;
  final EditorControlsBottomBar controlsBottomBar;
  final EditorCenterBody centerBody;
  final EditorBottomBar bottomBar;
  const EditorScreen(
      {super.key,
      required this.sideBar,
      required this.contentBar,
      required this.controlsBottomBar,
      required this.centerBody, required this.titleBar, required this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomBar,
        backgroundColor: AppTheme.backgroundColor,
        appBar: titleBar,
        body: Column(
          children: [
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
