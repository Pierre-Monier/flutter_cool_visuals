import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/util/noise_orbit_color_palette.dart';
import 'package:flutter_canvart/shared/model/color_palette.dart';

class ColorPaletteDropdown extends StatelessWidget {
  const ColorPaletteDropdown({super.key});

  List<DropdownMenuItem<ColorPalette>>? _getItems() {
    final items = noiseOrbitcolorPalettes
        .map(
          (colorPalette) => DropdownMenuItem<ColorPalette>(
            value: colorPalette,
            child: Text(colorPalette.name),
          ),
        )
        .toList();

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final noiseOrbitController =
        NoiseOrbitControllerProvider.of(context).controller;
    return ValueListenableBuilder<NoiseOrbitState>(
      valueListenable: noiseOrbitController,
      builder: (context, noiseOrbitState, child) {
        return DropdownButton<ColorPalette>(
          value: noiseOrbitState.colorPalette,
          items: _getItems(),
          onChanged: noiseOrbitController.onColorPaletteChange,
        );
      },
    );
  }
}
