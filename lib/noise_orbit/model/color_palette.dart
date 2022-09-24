import 'package:flutter/material.dart';

class ColorPalette {
  const ColorPalette({
    required this.name,
    required this.backgroundColor,
    required this.colors,
    required this.brightness,
  });

  final String name;
  final Color backgroundColor;
  final List<Color> colors;
  final Brightness brightness;
}
