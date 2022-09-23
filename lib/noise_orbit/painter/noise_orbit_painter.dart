import 'dart:math';

import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';

class NoiseOrbitPainter extends CustomPainter {
  const NoiseOrbitPainter({
    required this.perlinNoise,
    required this.animation,
    required this.noiseOrbitState,
  });

  final PerlinNoise perlinNoise;
  final int animation;
  final NoiseOrbitState noiseOrbitState;

  @override
  void paint(Canvas canvas, Size size) {
    final points = <List<Offset>>[];
    final radiusSize = size.width / noiseOrbitState.radiusSizeFactor;

    for (var radius = radiusSize;
        radius < size.width;
        radius += radiusSize / noiseOrbitState.circleSpacingFactor) {
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
        ..color = noiseOrbitState.colorPalette.colors[i]
        ..strokeCap = noiseOrbitState.strokeCap.value
        ..strokeWidth = noiseOrbitState.strokeWidth;

      final distoredPoints = _getDistordedPoints(
        amountToNudge: noiseOrbitState.distortion,
        origin: center,
        points: circlePoints,
      );

      canvas.drawPoints(noiseOrbitState.pointMode, distoredPoints, paint);

      if (i < noiseOrbitState.colorPalette.colors.length - 1) {
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
    final radiansPerStep = pi * 2 / noiseOrbitState.polygonType.value;
    final points = <Offset>[];

    for (var theta = 0.0; theta <= pi * 2; theta += radiansPerStep) {
      final x = size.width / 2 + radius * noiseOrbitState.width * cos(theta);
      final y = size.height / 2 + radius * noiseOrbitState.height * sin(theta);

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
