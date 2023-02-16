import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';

class CodeEditorWidget extends StatelessWidget {
  final CodeController controller;

  const CodeEditorWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: CodeTheme(
        data: CodeThemeData(styles: atomOneDarkReasonableTheme),
        child: SingleChildScrollView(
          child: CodeField(controller: controller),
        ),
      ),
    );
  }
}
