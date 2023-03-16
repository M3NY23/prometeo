import 'package:flutter/material.dart';
import 'package:prometeo/gui/themes/app_theme.dart';
import 'package:prometeo/gui/widgets/events_label.dart';

class EditorBottomBar extends StatelessWidget {
  const EditorBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: AppTheme.fourthColor,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          EventsLabel(),
        ],
      ),
    );
  }
}
