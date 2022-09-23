import 'package:flutter/material.dart';

class ColorPalette {
  const ColorPalette({
    required this.name,
    required this.backgroundColor,
    required this.colors,
  });

  final String name;
  final Color backgroundColor;
  final List<Color> colors;
}
