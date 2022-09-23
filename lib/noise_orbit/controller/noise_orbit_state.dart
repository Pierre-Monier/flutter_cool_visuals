import 'package:flutter/material.dart';
import 'package:flutter_canvart/shared/model/color_palette.dart';

@immutable
class NoiseOrbitState {
  const NoiseOrbitState({
    required this.radiusSizeFactor,
    required this.circleSpacingFactor,
    required this.frequency,
    required this.strokeWidth,
    required this.colorPalette,
  });

  factory NoiseOrbitState.initial({required ColorPalette colorPalette}) =>
      NoiseOrbitState(
        radiusSizeFactor: _initialRadiusSizeFactor,
        circleSpacingFactor: _initialCircleSpacingFactor,
        frequency: _initialFrequency,
        strokeWidth: _initialStrokeWidth,
        colorPalette: colorPalette,
      );

  static const _initialFrequency = 0.0007;
  static const _initialRadiusSizeFactor = 10.0;
  static const _initialCircleSpacingFactor = 10.0;
  static const _initialStrokeWidth = 1.0;

  final double frequency;
  final double radiusSizeFactor;
  final double circleSpacingFactor;
  final double strokeWidth;
  final ColorPalette colorPalette;

  NoiseOrbitState copyWith({
    double? radiusSizeFactor,
    double? circleSpacingFactor,
    double? frequency,
    double? strokeWidth,
    ColorPalette? colorPalette,
  }) =>
      NoiseOrbitState(
        radiusSizeFactor: radiusSizeFactor ?? this.radiusSizeFactor,
        circleSpacingFactor: circleSpacingFactor ?? this.circleSpacingFactor,
        frequency: frequency ?? this.frequency,
        strokeWidth: strokeWidth ?? this.strokeWidth,
        colorPalette: colorPalette ?? this.colorPalette,
      );
}
