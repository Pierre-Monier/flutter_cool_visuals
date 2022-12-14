import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/model/color_palette.dart';
import 'package:flutter_canvart/noise_orbit/util/noise_orbit_color_palette.dart';
import 'package:flutter_canvart/shared/widget/base_dropdown.dart';

class ColorPaletteDropdown extends StatelessWidget {
  const ColorPaletteDropdown({super.key});

  List<DropdownMenuItem<ColorPalette>> _getItems() {
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
        return BaseDropdown<ColorPalette>(
          label: "Color Palette",
          data: DropdownData<ColorPalette>(
            items: _getItems(),
            value: noiseOrbitState.colorPalette,
            onChanged: noiseOrbitController.onColorPaletteChange,
            textColor: noiseOrbitController.textColor,
            backgroundColor: noiseOrbitController.backgroundColor,
          ),
        );
      },
    );
  }
}
