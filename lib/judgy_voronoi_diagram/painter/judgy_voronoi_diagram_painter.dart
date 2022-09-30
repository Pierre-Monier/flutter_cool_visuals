import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class JudgyVoronoiDiagramPainter extends CustomPainter {
  const JudgyVoronoiDiagramPainter({required this.numberOfPoints});

  final int numberOfPoints;

  @override
  void paint(Canvas canvas, Size size) {
    final generatorPoints = <Offset>[];

    for (var i = 0; i < numberOfPoints; i++) {
      generatorPoints.add(
        Offset(
          Random().nextDouble() * size.width,
          Random().nextDouble() * size.height,
        ),
      );
    }

    canvas.drawPoints(
      PointMode.points,
      generatorPoints,
      Paint()
        ..strokeWidth = 10
        ..filterQuality = FilterQuality.high
        ..color = Colors.black,
    );

    final voronoiCells =
        generatorPoints.map((point) => generateVoronoiCell(point)).toList();

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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<Offset> generateVoronoiCell(Offset generatorPoint) {
    return [];
  }
}
