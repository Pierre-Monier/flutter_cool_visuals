import 'dart:math';
import 'dart:ui';

import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvart/color_palette.dart';

class NoiseOrbitPainter extends CustomPainter {
  const NoiseOrbitPainter({
    required this.perlinNoise,
    required this.animationSalt,
    required this.colorPalette,
  });

  final PerlinNoise perlinNoise;
  final int animationSalt;
  final ColorPalette colorPalette;

  @override
  void paint(Canvas canvas, Size size) {
    final points = <List<Offset>>[];
    final radiusSize = size.width / 10;

    for (var radius = radiusSize;
        radius < size.width;
        radius += radiusSize / 20) {
      points.add(
        _getCirclesData(
          size: size,
          radius: radius,
        ),
      );
    }

    final center = _getCenter(originCircle: points.first);

    final colors = colorPalette.colors;

    var i = 0;

    for (final circlePoints in points) {
      final paint = Paint()
        ..color = colors[i]
        ..strokeWidth = .1;

      final distoredPoints = _getDistordedPoints(
        amountToNudge: 25,
        origin: center,
        points: circlePoints,
      );
      canvas.drawPoints(PointMode.polygon, distoredPoints, paint);

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
    const radiansPerStep = pi * 2 / 100;
    final points = <Offset>[];

    for (var theta = 0.0; theta <= pi * 2; theta += radiansPerStep) {
      final x = size.width / 2 + radius * .3 * cos(theta);
      final y = size.height / 2 + radius * .3 * sin(theta);

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
          animationSalt.toDouble(),
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
    return oldDelegate.animationSalt != animationSalt;
  }
}
