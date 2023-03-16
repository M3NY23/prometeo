import 'package:flutter/material.dart';
import 'package:prometeo/gui/themes/app_theme.dart';
import 'package:window_manager/window_manager.dart';

class WindowControls {
  static final _closeButtonStyle = AppTheme.windowControlButtonStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (states) {
        return (states.contains(MaterialState.hovered))
            ? Colors.red
            : Colors.transparent;
      },
    ),
  );

  static final List<Widget> controlButtons = [
    ElevatedButton(
        style: AppTheme.windowControlButtonStyle,
        onPressed: windowManager.minimize,
        child: const Icon(Icons.remove, size: 16)),
    ElevatedButton(
        style: AppTheme.windowControlButtonStyle,
        onPressed: () async {
          if (await windowManager.isMaximized()) {
            windowManager.restore();
            return;
          }
          windowManager.maximize();
        },
        child: const Icon(Icons.square_outlined, size: 16)),
    ElevatedButton(
        style: _closeButtonStyle,
        onPressed: windowManager.close,
        child: const Icon(Icons.close_outlined, size: 16))
  ];
}
