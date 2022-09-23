import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/shared/widget/base_slider.dart';

class StrokeWidthFactorSlider extends StatelessWidget {
  const StrokeWidthFactorSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final noiseOrbitController =
        NoiseOrbitControllerProvider.of(context).controller;

    return ValueListenableBuilder<NoiseOrbitState>(
      valueListenable: noiseOrbitController,
      builder: (context, noiseOrbitState, child) {
        return BaseSlider(
          label: "Stroke Width",
          data: SliderData(
            max: noiseOrbitController.maxStrokeWidth,
            min: noiseOrbitController.minStrokeWidth,
            value: noiseOrbitState.strokeWidth,
            onChanged: noiseOrbitController.onStrokeWidthChanged,
          ),
        );
      },
    );
  }
}
