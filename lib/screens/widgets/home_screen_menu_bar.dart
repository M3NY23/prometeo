import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenMenuBar extends StatefulWidget {
  const HomeScreenMenuBar({super.key});

  @override
  State<HomeScreenMenuBar> createState() => _HomeScreenMenuBarState();
}

class _HomeScreenMenuBarState extends State<HomeScreenMenuBar> {
  ShortcutRegistryEntry? _shortcuts;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _shortcuts = ShortcutRegistry.of(context).addAll(_shortcutEntries);
    });

    super.initState();
  }

  late final Map<MenuSerializableShortcut, VoidCallbackIntent>
      _shortcutEntries = {
    const SingleActivator(LogicalKeyboardKey.keyA, control: true):
        VoidCallbackIntent(option1),
    const SingleActivator(LogicalKeyboardKey.keyB, control: true):
        VoidCallbackIntent(option2),
    const SingleActivator(LogicalKeyboardKey.keyC, control: true):
        VoidCallbackIntent(option3),
    const SingleActivator(LogicalKeyboardKey.keyD, control: true):
        VoidCallbackIntent(option4),
    const SingleActivator(LogicalKeyboardKey.keyE, control: true):
        VoidCallbackIntent(option5),
  };

  MenuSerializableShortcut? _shortcut(int index) {
    if (_shortcutEntries.keys.length > index) {
      return _shortcutEntries.keys.toList()[index];
    }
    return null;
  }

  VoidCallback? _callback(int index) {
    if (_shortcutEntries.keys.length > index) {
      return _shortcutEntries.values.toList()[index].callback;
    }
    return null;
  }

  @override
  void dispose() {
    _shortcuts?.dispose();
    super.dispose();
  }

  void option1() {
    debugPrint("option1");
  }

  void option2() {
    debugPrint("option2");
  }

  void option3() {
    debugPrint("option3");
  }

  void option4() {
    debugPrint("option4");
  }

  void option5() {
    debugPrint("option5");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MenuBar(children: [
            SubmenuButton(menuChildren: [
              MenuItemButton(
                shortcut: _shortcut(0),
                onPressed: _callback(0),
                child: const Text("option 1"),
              )
            ], child: const Text("menu1")),
            SubmenuButton(menuChildren: [
              SubmenuButton(menuChildren: [
                MenuItemButton(
                  shortcut: _shortcut(1),
                  onPressed: _callback(1),
                  child: const Text("option 1"),
                )
              ], child: const Text("submenu1")),
              SubmenuButton(menuChildren: [
                MenuItemButton(
                  shortcut: _shortcut(2),
                  onPressed: _callback(2),
                  child: const Text("option 1"),
                ),
                MenuItemButton(
                  shortcut: _shortcut(3),
                  onPressed: _callback(3),
                  child: const Text("option 2"),
                ),
              ], child: const Text("submenu2")),
            ], child: const Text("menu2")),
            MenuItemButton(
              shortcut: _shortcut(4),
              onPressed: _callback(4),
              child: const Text("menu3"),
            ),
          ]),
        ),
      ],
    );
  }
}
