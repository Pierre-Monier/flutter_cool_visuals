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

  void onFrequencyChanged(double frequency) {
    value = value.copyWith(frequency: frequency);
    // notifyListeners();
  }

  void onColorPaletteChange(ColorPalette? colorPalette) {
    value = value.copyWith(colorPalette: colorPalette);
    // notifyListeners();
  }

  double get minFrequency => 0.0001;
  double get maxFrequency => 0.0025;
}
