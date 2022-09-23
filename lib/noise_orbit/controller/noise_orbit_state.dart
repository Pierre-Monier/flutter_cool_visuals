import 'package:flutter/material.dart';
import 'package:flutter_canvart/shared/model/color_palette.dart';

@immutable
class NoiseOrbitState {
  const NoiseOrbitState({required this.frequency, required this.colorPalette});

  factory NoiseOrbitState.initial({required ColorPalette colorPalette}) =>
      NoiseOrbitState(frequency: _initialFrequency, colorPalette: colorPalette);

  static const _initialFrequency = 0.0007;

  final double frequency;
  final ColorPalette colorPalette;

  NoiseOrbitState copyWith({double? frequency, ColorPalette? colorPalette}) =>
      NoiseOrbitState(
        frequency: frequency ?? this.frequency,
        colorPalette: colorPalette ?? this.colorPalette,
      );
}
