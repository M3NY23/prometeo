import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight/languages/dart.dart';
import 'package:prometeo/screens/home/home_screen.dart';

class CodeEditorScreen extends StatelessWidget {
  static const String route = "/code";
  static const String codePlaceholder =
      "//[START className]\nclass MyCode {\n// [END className]\n//[START userCode]\n//[END userCode]\n// [START classEnd]\n}\n// [END classEnd]";
  final CodeController controller = CodeController(
      text: codePlaceholder,
      language: dart,
      analyzer: DartPadAnalyzer(),
      readOnlySectionNames: {"className", "classEnd"},
      namedSectionParser: const BracketsStartEndNamedSectionParser());
  CodeEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Script editor"),
        leading: IconButton(
            onPressed: () => context.go(HomeScreen.route),
            icon: const Icon(Icons.home)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CodeTheme(
          data: CodeThemeData(styles: atomOneDarkReasonableTheme),
          child: SingleChildScrollView(
            child: CodeField(controller: controller),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        debugPrint("${controller.code.text}");
      }),
    );
  }
}
