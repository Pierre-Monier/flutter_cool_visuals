import 'package:flutter/material.dart';

class ToolConstraints extends StatelessWidget {
  const ToolConstraints({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth / 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        );
      },
    );
  }
}
