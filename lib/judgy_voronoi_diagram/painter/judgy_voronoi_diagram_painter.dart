import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class JudgyVoronoiDiagramPainter extends CustomPainter {
  const JudgyVoronoiDiagramPainter({required this.numberOfPoints});

  final int numberOfPoints;

  @override
  void paint(Canvas canvas, Size size) {
    final discretPoints = _getDiscretPoints(size);
    final generatorPoints =
        _getGeneratorPoints(numberOfPoints: numberOfPoints, size: size);

    canvas.drawPoints(
      PointMode.points,
      generatorPoints,
      Paint()
        ..strokeWidth = 10
        ..filterQuality = FilterQuality.high
        ..color = Colors.black,
    );

    final voronoiCells =
        generatorPoints.map((point) => _getVoronoiCell(point)).toList();

    for (final voronoiCell in voronoiCells) {
      canvas.drawPoints(
        PointMode.polygon,
        voronoiCell,
        Paint()
          ..strokeWidth = 1
          ..filterQuality = FilterQuality.high
          ..color = Colors.black,
      );
    }
  }

  List<Offset> _getDiscretPoints(Size size) {
    final points = <Offset>[];

    for (var i = 0; i < size.width; i++) {
      for (var j = 0; j < size.height; j++) {
        points.add(Offset(i.toDouble(), j.toDouble()));
      }
    }

    return points;
  }

  List<Offset> _getGeneratorPoints({
    required int numberOfPoints,
    required Size size,
  }) {
    final points = <Offset>[];

    for (var i = 0; i < numberOfPoints; i++) {
      points.add(
        Offset(
          Random().nextDouble() * size.width,
          Random().nextDouble() * size.height,
        ),
      );
    }

    return points;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<Offset> _getVoronoiCell(Offset generatorPoint) {
    return [];
  }
}
