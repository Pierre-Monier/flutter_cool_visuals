import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/shared/widget/base_slider.dart';

class WidthSlider extends StatelessWidget {
  const WidthSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final noiseOrbitController =
        NoiseOrbitControllerProvider.of(context).controller;

    return ValueListenableBuilder<NoiseOrbitState>(
      valueListenable: noiseOrbitController,
      builder: (context, noiseOrbitState, child) {
        return BaseSlider(
          label: "Width",
          data: SliderData(
            max: noiseOrbitController.maxWidth,
            min: noiseOrbitController.minWidth,
            value: noiseOrbitState.width,
            onChanged: noiseOrbitController.onWidthChanged,
          ),
        );
      },
    );
  }
}
