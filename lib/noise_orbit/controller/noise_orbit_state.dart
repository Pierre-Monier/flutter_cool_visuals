import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/model/polygone_type.dart';
import 'package:flutter_canvart/noise_orbit/model/stroke_cap.dart';
import 'package:flutter_canvart/shared/model/color_palette.dart';

@immutable
class NoiseOrbitState {
  const NoiseOrbitState({
    required this.radiusSizeFactor,
    required this.circleSpacingFactor,
    required this.frequency,
    required this.strokeWidth,
    required this.distortion,
    required this.width,
    required this.height,
    required this.polygonType,
    required this.pointMode,
    required this.colorPalette,
    required this.strokeCap,
  });

  factory NoiseOrbitState.initial({required ColorPalette colorPalette}) =>
      NoiseOrbitState(
        radiusSizeFactor: _initialRadiusSizeFactor,
        circleSpacingFactor: _initialCircleSpacingFactor,
        frequency: _initialFrequency,
        strokeWidth: _initialStrokeWidth,
        distortion: _initialDistortion,
        width: _initialWidth,
        height: _initialHeight,
        polygonType: _initialPolygoneType,
        pointMode: _initialPointMode,
        colorPalette: colorPalette,
        strokeCap: _initialStrokeCap,
      );

  static const _initialFrequency = 0.0007;
  static const _initialRadiusSizeFactor = 10.0;
  static const _initialCircleSpacingFactor = 10.0;
  static const _initialDistortion = 25.0;
  static const _initialStrokeWidth = 1.0;
  static const _initialWidth = .3;
  static const _initialHeight = .3;
  static const _initialPolygoneType = PolygoneType.cirlcle;
  static const _initialPointMode = PointMode.polygon;
  static const _initialStrokeCap = NoiseOrbitStrokeCap.square;

  final double frequency;
  final double radiusSizeFactor;
  final double circleSpacingFactor;
  final double strokeWidth;
  final double distortion;
  final double width;
  final double height;
  final PolygoneType polygonType;
  final PointMode pointMode;
  final ColorPalette colorPalette;
  final NoiseOrbitStrokeCap strokeCap;

  NoiseOrbitState copyWith({
    double? radiusSizeFactor,
    double? circleSpacingFactor,
    double? frequency,
    double? strokeWidth,
    double? distortion,
    double? width,
    double? height,
    PolygoneType? polygonType,
    PointMode? pointMode,
    ColorPalette? colorPalette,
    NoiseOrbitStrokeCap? strokeCap,
  }) =>
      NoiseOrbitState(
        radiusSizeFactor: radiusSizeFactor ?? this.radiusSizeFactor,
        circleSpacingFactor: circleSpacingFactor ?? this.circleSpacingFactor,
        frequency: frequency ?? this.frequency,
        strokeWidth: strokeWidth ?? this.strokeWidth,
        distortion: distortion ?? this.distortion,
        width: width ?? this.width,
        height: height ?? this.height,
        polygonType: polygonType ?? this.polygonType,
        pointMode: pointMode ?? this.pointMode,
        colorPalette: colorPalette ?? this.colorPalette,
        strokeCap: strokeCap ?? this.strokeCap,
      );
}
