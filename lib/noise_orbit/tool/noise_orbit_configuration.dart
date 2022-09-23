import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/tool/color_palette_dropdown.dart';
import 'package:flutter_canvart/noise_orbit/tool/frequency_slider.dart';

class NoiseOrbitConfiguration extends StatelessWidget {
  const NoiseOrbitConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [FrequencySlider(), ColorPaletteDropdown()],
    );
  }
}
