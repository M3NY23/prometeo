import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prometeo/domain/blocs/process/process_bloc.dart';
import 'package:prometeo/gui/screens/project/project_screen_controller.dart';
import 'package:prometeo/gui/widgets/editor/editor_menu_bar.dart';
import 'package:prometeo/gui/widgets/window_controls.dart';

class EditorTitleBar extends StatelessWidget implements PreferredSize {

  const EditorTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(child: SvgPicture.asset("assets/images/prometeo.svg")),
        ),
        title: EditorMenuBar(
          options: [
            MenuBarData(
              label: "File",
              items: [
                MenuBarData(
                    label: "New",
                    callback: () async {
                      debugPrint("New");
                      await ProjectScreenController().newProject(context);
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyN,
                        control: true)),
                MenuBarData(
                    label: "Save",
                    callback: () {
                      debugPrint("Save");
                      context.read<ProcessBloc>().add(FileSavePressed());
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyS,
                        control: true)),
                MenuBarData(
                    label: "Save as",
                    callback: () {
                      debugPrint("Save as");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyS,
                        control: true, shift: true)),
                MenuBarData(
                    label: "Open",
                    callback: () {
                      debugPrint("Open");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyO,
                        control: true)),
              ],
            ),
            MenuBarData(
              label: "Game",
              items: [
                MenuBarData(
                    label: "Run",
                    callback: () {
                      debugPrint("Run");
                      context.read<ProcessBloc>().add(RunProjectPressed());
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyR,
                        control: true)),
                MenuBarData(
                    label: "Build",
                    callback: () {
                      debugPrint("Build");
                      context.read<ProcessBloc>().add(BuildProjectPressed());
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyB,
                        control: true, shift: true)),
                MenuBarData(
                    label: "Debug",
                    callback: () {
                      debugPrint("Debug");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyD,
                        control: true)),
                MenuBarData(
                    label: "Logs",
                    callback: () {
                      debugPrint("Logs");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyL,
                        control: true)),
              ],
            ),
            MenuBarData(
              label: "Settings",
              items: [
                MenuBarData(
                    label: "Font size",
                    callback: () {
                      debugPrint("Font size");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyF,
                        control: true)),
                MenuBarData(
                    label: "Theme",
                    callback: () {
                      debugPrint("Theme");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyT,
                        control: true)),
                MenuBarData(
                    label: "Directories",
                    callback: () {
                      debugPrint("Directories");
                    },
                    shortcut: const SingleActivator(LogicalKeyboardKey.keyP,
                        control: true)),
              ],
            ),
          ],
        ),
        actions: WindowControls.controlButtons);
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(35);
}
