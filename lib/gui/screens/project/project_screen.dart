import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/gui/screens/scenes/scenes_screen.dart';
import 'package:prometeo/gui/themes/app_theme.dart';

class ProjectScreen extends StatelessWidget {
  static const String route = "/project";
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => context.go(ScenesScreen.route),
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
                        style: const TextStyle(color: AppTheme.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => context.go(ScenesScreen.route),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
