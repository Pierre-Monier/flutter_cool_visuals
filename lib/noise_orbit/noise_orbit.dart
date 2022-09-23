import 'dart:async';
import 'dart:math';

import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/painter/noise_orbit_painter.dart';

class NoiseOrbit extends StatefulWidget {
  const NoiseOrbit({super.key});

  @override
  State<NoiseOrbit> createState() => _NoiseOrbitState();
}

class _NoiseOrbitState extends State<NoiseOrbit> {
  int animation = 0;
  final seed = Random().nextInt(2048);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      setState(() {
        animation = timer.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final noiseOrbitController =
        NoiseOrbitControllerProvider.of(context).controller;

    return ValueListenableBuilder<NoiseOrbitState>(
      valueListenable: noiseOrbitController,
      builder: (context, noiseOrbitState, child) {
        return ColoredBox(
          color: noiseOrbitState.colorPalette.backgroundColor,
          child: CustomPaint(
            painter: NoiseOrbitPainter(
              radiusSizeFactor: noiseOrbitState.radiusSizeFactor,
              circleSpacingFactor: noiseOrbitState.circleSpacingFactor,
              strokeWidth: noiseOrbitState.strokeWidth,
              colors: noiseOrbitState.colorPalette.colors,
              animation: animation,
              perlinNoise: PerlinNoise(
                seed: seed,
                frequency: noiseOrbitState.frequency,
              ),
            ),
          ),
        );
      },
    );
  }
}
