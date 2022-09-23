import 'dart:math';
import 'dart:ui';

import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/model/polygone_type.dart';

class NoiseOrbitPainter extends CustomPainter {
  const NoiseOrbitPainter({
    required this.perlinNoise,
    required this.animation,
    required this.colors,
    required this.radiusSizeFactor,
    required this.circleSpacingFactor,
    required this.strokeWidth,
    required this.polygonType,
    required this.distortion,
    required this.width,
    required this.height,
    required this.pointMode,
  });

  final PerlinNoise perlinNoise;
  final int animation;
  final List<Color> colors;
  final double radiusSizeFactor;
  final double circleSpacingFactor;
  final double strokeWidth;
  final double distortion;
  final double width;
  final double height;
  final PolygoneType polygonType;
  final PointMode pointMode;

  @override
  void paint(Canvas canvas, Size size) {
    final points = <List<Offset>>[];
    final radiusSize = size.width / radiusSizeFactor;

    for (var radius = radiusSize;
        radius < size.width;
        radius += radiusSize / circleSpacingFactor) {
      points.add(
        _getCirclesData(
          size: size,
          radius: radius,
        ),
      );
    }

    final center = _getCenter(originCircle: points.first);

    var i = 0;

    for (final circlePoints in points) {
      final paint = Paint()
        ..color = colors[i]
        ..strokeWidth = strokeWidth;

      final distoredPoints = _getDistordedPoints(
        amountToNudge: distortion,
        origin: center,
        points: circlePoints,
      );

      canvas.drawPoints(pointMode, distoredPoints, paint);

      if (i < colors.length - 1) {
        i++;
      } else {
        i = 0;
      }
    }
  }

  List<Offset> _getCirclesData({
    required Size size,
    required double radius,
  }) {
    final radiansPerStep = pi * 2 / polygonType.value;
    final points = <Offset>[];

    for (var theta = 0.0; theta <= pi * 2; theta += radiansPerStep) {
      final x = size.width / 2 + radius * width * cos(theta);
      final y = size.height / 2 + radius * height * sin(theta);

      points.add(Offset(x, y));
    }

    return points;
  }

  List<Offset> _getDistordedPoints({
    required List<Offset> points,
    required Offset origin,
    required double amountToNudge,
  }) {
    return points.map((point) {
      final x = point.dx;
      final y = point.dy;
      final distance = sqrt(pow(x - origin.dx, 2) + pow(y - origin.dy, 2));

      double noiseFn(double x, double y) {
        final noiseX = x + distance * 10;
        final noiseY = y + distance * 10;
        return perlinNoise.getPerlin3(
          noiseX,
          noiseY,
          animation.toDouble(),
        );
      }

      final theta = noiseFn(x, y) * pi * 2;

      final newX = x + (amountToNudge * cos(theta));
      final newY = y + (amountToNudge * sin(theta));

      return Offset(newX, newY);
    }).toList();
  }

  Offset _getCenter({required List<Offset> originCircle}) {
    final x = originCircle.map((point) => point.dx).reduce((a, b) => a + b) /
        originCircle.length;
    final y = originCircle.map((point) => point.dy).reduce((a, b) => a + b) /
        originCircle.length;

    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant NoiseOrbitPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
