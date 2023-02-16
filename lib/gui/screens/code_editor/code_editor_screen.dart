import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/dart.dart';
import 'package:prometeo/gui/screens/code_editor/widgets/code_editor_widget.dart';
import 'package:prometeo/data/shared/code_placehorlders.dart';
import 'package:prometeo/gui/widgets/editor/editor_center_body.dart';
import 'package:prometeo/gui/widgets/editor/editor_content_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_controls_bottom_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_menu_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_side_bar.dart';

class CodeEditorScreen extends StatelessWidget {
  static const String route = "/code";
  const CodeEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EditorScreen(
        menuBar: const EditorScreenMenuBar(),
        sideBar: const EditorScreenSideBar(selectedScreen: 3),
        contentBar: const EditorContentBar(),
        controlsBottomBar: const EditorControlsBottomBar(),
        centerBody: EditorCenterBody(
          child: CodeEditorWidget(
              controller: CodeController(
                  text: CodePlaceholders.emptyClass,
                  language: dart,
                  analyzer: DartPadAnalyzer(),
                  readOnlySectionNames: {"className", "classEnd"},
                  namedSectionParser:
                      const BracketsStartEndNamedSectionParser())),
        ));
  }
}
