import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/tool/circle_spacing_factor_slider.dart';
import 'package:flutter_canvart/noise_orbit/tool/color_palette_dropdown.dart';
import 'package:flutter_canvart/noise_orbit/tool/distortion_slider.dart';
import 'package:flutter_canvart/noise_orbit/tool/frequency_slider.dart';
import 'package:flutter_canvart/noise_orbit/tool/height_slider.dart';
import 'package:flutter_canvart/noise_orbit/tool/point_mode_dropdown.dart';
import 'package:flutter_canvart/noise_orbit/tool/polygone_type_dropdown.dart';
import 'package:flutter_canvart/noise_orbit/tool/radius_size_factor_slider.dart';
import 'package:flutter_canvart/noise_orbit/tool/stroke_cap_dropdown.dart';
import 'package:flutter_canvart/noise_orbit/tool/stroke_width_factor_slider.dart';
import 'package:flutter_canvart/noise_orbit/tool/width_slider.dart';

class NoiseOrbitConfiguration extends StatelessWidget {
  const NoiseOrbitConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final noiseOrbitController =
        NoiseOrbitControllerProvider.of(context).controller;

    return ValueListenableBuilder<NoiseOrbitState>(
      valueListenable: noiseOrbitController,
      builder: (context, noiseOrbitState, child) {
        return DefaultTextStyle(
          style: TextStyle(color: noiseOrbitController.textColor),
          child: Wrap(
            children: [
              const WidthSlider(),
              const HeightSlider(),
              const RadiusSizeFactorSlider(),
              const CircleSpacingFactorSlider(),
              const FrequencySlider(),
              const DistortionSlider(),
              const StrokeWidthFactorSlider(),
              const PolygonTypeDropdown(),
              const PointModeDropdown(),
              const ColorPaletteDropdown(),
              if (noiseOrbitState.pointMode != PointMode.polygon)
                const StrokeCapDropdown(),
            ],
          ),
        );
      },
    );
  }
}
