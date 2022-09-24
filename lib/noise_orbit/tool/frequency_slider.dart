import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/shared/widget/base_slider.dart';

class FrequencySlider extends StatelessWidget {
  const FrequencySlider({super.key});

  @override
  Widget build(BuildContext context) {
    final noiseOrbitController =
        NoiseOrbitControllerProvider.of(context).controller;

    return ValueListenableBuilder<NoiseOrbitState>(
      valueListenable: noiseOrbitController,
      builder: (context, noiseOrbitState, child) {
        return BaseSlider(
          label: "Pelerin Noise Frequency",
          data: SliderData(
            max: noiseOrbitController.maxFrequency,
            min: noiseOrbitController.minFrequency,
            value: noiseOrbitState.frequency,
            onChanged: noiseOrbitController.onFrequencyChanged,
          ),
        );
      },
    );
  }
}
