import 'package:flutter/material.dart';

class EditorCenterBody extends StatelessWidget {
  final Widget? child;
  const EditorCenterBody({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: child ?? const Placeholder(),
    );
  }
}
