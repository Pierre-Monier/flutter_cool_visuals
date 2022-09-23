import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/util/noise_orbit_color_palette.dart';
import 'package:flutter_canvart/shared/model/color_palette.dart';

class NoiseOrbitController extends ValueNotifier<NoiseOrbitState> {
  NoiseOrbitController()
      : super(
          NoiseOrbitState.initial(
            colorPalette: noiseOrbitcolorPalettes.first,
          ),
        );

  void onRadiusSizeFactorChanged(double radiusSizeFactor) {
    value = value.copyWith(radiusSizeFactor: radiusSizeFactor);
  }

  void onCircleSpacingFactorChanged(double circleSpacingFactor) {
    value = value.copyWith(circleSpacingFactor: circleSpacingFactor);
  }

  void onFrequencyChanged(double frequency) {
    value = value.copyWith(frequency: frequency);
  }

  void onStrokeWidthChanged(double strokeWidth) {
    value = value.copyWith(strokeWidth: strokeWidth);
  }

  void onColorPaletteChange(ColorPalette? colorPalette) {
    value = value.copyWith(colorPalette: colorPalette);
  }

  double get minFrequency => 0.0001;
  double get maxFrequency => 0.0025;
  double get minRadiusSizeFactor => 1.25;
  double get maxRadiusSizeFactor => 50.0;
  double get minCircleSpacingFactor => 0.5;
  double get maxCircleSpacingFactor => 50.0;
  double get minStrokeWidth => 0.1;
  double get maxStrokeWidth => 50.0;
}
