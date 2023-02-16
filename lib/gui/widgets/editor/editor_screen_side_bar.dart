import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prometeo/gui/screens/assets/assets_screen.dart';
import 'package:prometeo/gui/screens/code_editor/code_editor_screen.dart';
import 'package:prometeo/gui/screens/componentes/components_screen.dart';
import 'package:prometeo/gui/screens/scenes/scenes_screen.dart';
import 'package:prometeo/gui/screens/sounds/sounds_screen.dart';

import '../expandable_side_bar.dart';

class EditorScreenSideBar extends StatelessWidget {
  final int selectedScreen;
  const EditorScreenSideBar({super.key, this.selectedScreen = 0});

  @override
  Widget build(BuildContext context) {
    return ExpandableSideBar(
      selected: selectedScreen,
      expand: false,
      items: [
        SideBarItem(
          icon: const Icon(Icons.picture_in_picture_alt_outlined),
          label: "Scenes",
          onTap: () => context.go(ScenesScreen.route),
        ),
        SideBarItem(
          icon: const Icon(Icons.card_travel_outlined),
          label: "Components",
          onTap: () => context.go(ComponentsScreen.route),
        ),
        SideBarItem(
          icon: const Icon(Icons.audio_file),
          label: "Sounds",
          onTap: () => context.go(SoundsScreen.route),
        ),
        SideBarItem(
          icon: const Icon(Icons.code),
          label: "Scripts",
          onTap: () => context.go(CodeEditorScreen.route),
        ),
        SideBarItem(
          icon: const Icon(Icons.photo_library_outlined),
          label: "Assets",
          onTap: () => context.go(AssetsScreen.route),
        ),
      ],
    );
  }
}
