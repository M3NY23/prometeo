import 'package:flutter/material.dart';
import 'package:prometeo/gui/widgets/editor/editor_center_body.dart';
import 'package:prometeo/gui/widgets/editor/editor_content_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_controls_bottom_bar.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen.dart';
import 'package:prometeo/gui/widgets/editor/editor_screen_side_bar.dart';
import 'package:window_manager/window_manager.dart';

class ScenesScreen extends StatefulWidget {
  static const String route = "/scenes";
  const ScenesScreen({super.key});

  @override
  State<ScenesScreen> createState() => _ScenesScreenState();
}

class _ScenesScreenState extends State<ScenesScreen> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 400));
      await windowManager.maximize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const EditorScreen(
        sideBar: EditorScreenSideBar(selectedScreen: 0),
        contentBar: EditorContentBar(),
        controlsBottomBar: EditorControlsBottomBar(),
        centerBody: EditorCenterBody());
  }
}
