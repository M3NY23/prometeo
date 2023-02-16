import 'package:flutter/material.dart';

class EditorControlsBottomBar extends StatelessWidget {
  const EditorControlsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Row(
          children: [
            for (int i = 0; i < 10; i++)
              TextButton(
                child: Text("Control $i"),
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
