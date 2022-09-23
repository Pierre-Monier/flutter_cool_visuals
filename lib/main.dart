import 'dart:async';
import 'dart:math';

import 'package:fast_noise/fast_noise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_canvart/color_palette.dart';
import 'package:flutter_canvart/painter/noise_orbit_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

final colorPalettes = [
  const ColorPalette(
    backgroundColor: Color(0xFF031c06),
    colors: [
      Color(0xFF1f7722),
      Color(0xFF6cc445),
      Color(0xFF033904),
      Color(0xFF92cc73),
    ],
  ),
  const ColorPalette(
    backgroundColor: Color(0xFFd8d3ce),
    colors: [
      Color(0xFF081912),
      Color(0xFF6cc445),
      Color(0xFF263f33),
      Color(0xFF426655),
      Color(0xFF426655),
    ],
  ),
];

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int animationSalt = 0;
  final colorPalette = colorPalettes[Random().nextInt(colorPalettes.length)];
  final seed = Random().nextInt(2048);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      setState(() {
        animationSalt = timer.tick;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: ColoredBox(
          color: colorPalette.backgroundColor,
          child: CustomPaint(
            painter: NoiseOrbitPainter(
              colorPalette: colorPalette,
              animationSalt: animationSalt,
              perlinNoise: PerlinNoise(
                seed: seed,
                frequency: 0.0007,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
