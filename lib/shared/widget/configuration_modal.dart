import 'dart:ui';

import 'package:flutter/material.dart';

class ConfigurationModal extends StatelessWidget {
  const ConfigurationModal({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final modalBottomSheetHeight = MediaQuery.of(context).size.height / 2;

    return SizedBox(
      height: modalBottomSheetHeight,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: modalBottomSheetHeight + 1,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: child,
          ),
        ),
      ),
    );
  }
}
