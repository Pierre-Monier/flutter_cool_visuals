enum PolygoneType {
  cirlcle(18),
  perfectCircle(100),
  line(2),
  triangle(3),
  square(4),
  pentagon(5),
  hexagon(6),
  heptagon(7),
  octagon(8),
  nonagon(9),
  decagon(10),
  hendecagon(11),
  dodecagon(12);

  const PolygoneType(this.value);
  final int value;
}

extension PolygoneTypeExtension on PolygoneType {
  String get name {
    switch (this) {
      case PolygoneType.cirlcle:
        return "Circle";
      case PolygoneType.perfectCircle:
        return "Perfect Circle (use a lot of ressources)";
      case PolygoneType.line:
        return "Line";
      case PolygoneType.triangle:
        return "Triangle";
      case PolygoneType.square:
        return "Square";
      case PolygoneType.pentagon:
        return "Pentagon";
      case PolygoneType.hexagon:
        return "Hexagon";
      case PolygoneType.heptagon:
        return "Heptagon";
      case PolygoneType.octagon:
        return "Octagon";
      case PolygoneType.nonagon:
        return "Nonagon";
      case PolygoneType.decagon:
        return "Decagon";
      case PolygoneType.hendecagon:
        return "Hendecagon";
      case PolygoneType.dodecagon:
        return "Dodecagon";
    }
  }
}
