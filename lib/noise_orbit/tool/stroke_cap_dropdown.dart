import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/model/stroke_cap.dart';
import 'package:flutter_canvart/shared/widget/base_dropdown.dart';

class StrokeCapDropdown extends StatelessWidget {
  const StrokeCapDropdown({super.key});

  List<DropdownMenuItem<NoiseOrbitStrokeCap>> _getItems() {
    final items = NoiseOrbitStrokeCap.values
        .map(
          (pointMode) => DropdownMenuItem<NoiseOrbitStrokeCap>(
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
        return BaseDropdown<NoiseOrbitStrokeCap>(
          label: "Stroke Cap",
          data: DropdownData(
            items: _getItems(),
            value: noiseOrbitState.strokeCap,
            onChanged: noiseOrbitController.onStrokeCapChanged,
          ),
        );
      },
    );
  }
}
