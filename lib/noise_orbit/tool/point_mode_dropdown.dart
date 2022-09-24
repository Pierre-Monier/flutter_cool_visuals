import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/shared/widget/base_dropdown.dart';

class PointModeDropdown extends StatelessWidget {
  const PointModeDropdown({super.key});

  List<DropdownMenuItem<PointMode>> _getItems() {
    final items = PointMode.values
        .map(
          (pointMode) => DropdownMenuItem<PointMode>(
            value: pointMode,
            child: Text(pointMode.name),
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
        return BaseDropdown<PointMode>(
          label: "Draw mode",
          data: DropdownData<PointMode>(
            items: _getItems(),
            value: noiseOrbitState.pointMode,
            onChanged: noiseOrbitController.onPointModeChanged,
            textColor: noiseOrbitController.textColor,
            backgroundColor: noiseOrbitController.backgroundColor,
          ),
        );
      },
    );
  }
}
