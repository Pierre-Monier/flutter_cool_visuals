import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';
import 'package:flutter_canvart/noise_orbit/model/polygone_type.dart';
import 'package:flutter_canvart/shared/widget/base_dropdown.dart';

class PolygonTypeDropdown extends StatelessWidget {
  const PolygonTypeDropdown({super.key});

  List<DropdownMenuItem<PolygoneType>> _getItems() {
    final items = PolygoneType.values
        .map(
          (pointMode) => DropdownMenuItem<PolygoneType>(
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
        return BaseDropdown(
          label: "Shape",
          data: DropdownData(
            items: _getItems(),
            value: noiseOrbitState.polygonType,
            onChanged: noiseOrbitController.onPolygoneTypeChanged,
          ),
        );
      },
    );
  }
}
