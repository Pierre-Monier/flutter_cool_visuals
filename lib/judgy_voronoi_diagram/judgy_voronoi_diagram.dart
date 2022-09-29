import 'package:flutter/material.dart';
import 'package:flutter_canvart/judgy_voronoi_diagram/painter/judgy_voronoi_diagram_painter.dart';

class JudgyVoronoiDiagram extends StatelessWidget {
  const JudgyVoronoiDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: JudgyVoronoiDiagramPainter(),
    );
  }
}
