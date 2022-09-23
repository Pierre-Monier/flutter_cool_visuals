import 'package:flutter/material.dart';

enum NoiseOrbitStrokeCap {
  round(StrokeCap.round),
  square(StrokeCap.butt);

  const NoiseOrbitStrokeCap(this.value);
  final StrokeCap value;
}
