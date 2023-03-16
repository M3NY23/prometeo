import 'package:flutter/material.dart';
import 'package:prometeo/gui/widgets/events_label.dart';

class EditorMenuBar extends StatefulWidget {
  final List<MenuBarData> options;
  const EditorMenuBar({super.key, this.options = const []});

  @override
  State<EditorMenuBar> createState() => _EditorMenuBarState();
}

class _EditorMenuBarState extends State<EditorMenuBar> {
  ShortcutRegistryEntry? _shortcuts;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _mapShorcuts().forEach((key, value) {
        if (!ShortcutRegistry.of(context).shortcuts.containsKey(key)) {
          ShortcutRegistry.of(context).addAll(
              <MenuSerializableShortcut, VoidCallbackIntent>{key: value});
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _shortcuts?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildMenu(),
        ),
        // const EventsLabel(),
      ],
    );
  }

  MenuBar _buildMenu() {
    final List<Widget> children = [];
    for (int i = 0; i < widget.options.length; i++) {
      children.add(_appendMenuChildren(widget.options[i]));
    }
    return MenuBar(children: children);
  }

  Widget _appendMenuChildren(MenuBarData data) {
    if (data.isFinal) {
      return MenuItemButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(200, 30))),
        shortcut: data.shortcut,
        onPressed: data.callback,
        child: Text(data.label),
      );
    }
    return SubmenuButton(
      menuChildren: [
        for (int i = 0; i < data.items.length; i++)
          _appendMenuChildren(data.items[i])
      ],
      child: Text(data.label),
    );
  }

  Map<MenuSerializableShortcut, VoidCallbackIntent> _mapShorcuts() {
    Map<MenuSerializableShortcut, VoidCallbackIntent> shorcuts = {};
    final List<ShorcutData> aux = [];
    for (int i = 0; i < widget.options.length; i++) {
      aux.addAll(_getShorcuts(widget.options[i]));
    }
    for (var data in aux) {
      shorcuts[data.shorcut] = data.callback;
    }
    return shorcuts;
  }

  List<ShorcutData> _getShorcuts(MenuBarData data) {
    if (data.shortcut != null && data.callback != null) {
      return [
        ShorcutData(
            callback: VoidCallbackIntent(data.callback!),
            shorcut: data.shortcut!)
      ];
    }
    return [
      for (int i = 0; i < data.items.length; i++) ..._getShorcuts(data.items[i])
    ];
  }
}

class MenuBarData {
  final String label;
  final MenuSerializableShortcut? shortcut;
  final void Function()? callback;
  final List<MenuBarData> items;

  MenuBarData(
      {required this.label,
      this.shortcut,
      this.callback,
      this.items = const []});

  bool get isFinal => items.isEmpty;
}

class ShorcutData {
  final MenuSerializableShortcut shorcut;
  final VoidCallbackIntent callback;
  ShorcutData({required this.callback, required this.shorcut});
}
