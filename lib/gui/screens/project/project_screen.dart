import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/data/shared/assets.dart';
import 'package:prometeo/gui/screens/project/project_screen_controller.dart';
import 'package:prometeo/gui/screens/scenes/scenes_screen.dart';
import 'package:prometeo/gui/themes/app_theme.dart';
import 'package:window_manager/window_manager.dart';

class ProjectScreen extends StatefulWidget {
  static const String route = "/project";
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> with WindowListener {
  final controller = ProjectScreenController();

  @override
  void initState() {
    windowManager.addListener(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 400));
      await windowManager.setPreventClose(false);
      await windowManager.maximize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(Assets.flameIcon)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => controller.newProject(context),
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 200),
                          child: const Text(
                            "New Project",
                            textAlign: TextAlign.center,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: 200),
                          child: const Text(
                            "Open Project",
                            textAlign: TextAlign.center,
                          ))),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Recent Projects",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 300,
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Project $index",
                            style:
                                const TextStyle(color: AppTheme.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () => context.go(ScenesScreen.route),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowClose() async {}
}
