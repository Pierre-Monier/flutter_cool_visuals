import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/model/color_palette.dart';
import 'package:flutter_canvart/noise_orbit/model/polygone_type.dart';
import 'package:flutter_canvart/noise_orbit/model/stroke_cap.dart';
import 'package:flutter_canvart/noise_orbit/util/noise_orbit_color_palette.dart';

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

  void onDistortionChanged(double distortion) {
    value = value.copyWith(distortion: distortion);
  }

  void onWidthChanged(double width) {
    value = value.copyWith(width: width);
  }

  void onHeightChanged(double height) {
    value = value.copyWith(height: height);
  }

  void onPolygoneTypeChanged(PolygoneType? polygonType) {
    value = value.copyWith(polygonType: polygonType);
  }

  void onPointModeChanged(PointMode? pointMode) {
    value = value.copyWith(pointMode: pointMode);
  }

  void onColorPaletteChange(ColorPalette? colorPalette) {
    value = value.copyWith(colorPalette: colorPalette);
  }

  void onStrokeCapChanged(NoiseOrbitStrokeCap? strokeCap) {
    value = value.copyWith(strokeCap: strokeCap);
  }

  double get minFrequency => 0.0001;
  double get maxFrequency => 0.0025;
  double get minRadiusSizeFactor => .008;
  double get maxRadiusSizeFactor => .8;
  double get minCircleSpacingFactor => 0.5;
  double get maxCircleSpacingFactor => 50.0;
  double get minStrokeWidth => 0.1;
  double get maxStrokeWidth => 25.0;
  double get minDistortion => 0.0;
  double get maxDistortion => 150.0;
  double get minWidth => .1;
  double get maxWidth => .75;
  double get minHeight => .1;
  double get maxHeight => .75;

  Color get textColor => value.colorPalette.brightness == Brightness.light
      ? Colors.black
      : Colors.white;
  Color get backgroundColor => value.colorPalette.brightness == Brightness.light
      ? Colors.white
      : Colors.black;
}
