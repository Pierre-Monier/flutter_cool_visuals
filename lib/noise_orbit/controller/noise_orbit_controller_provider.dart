import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_state.dart';

class NoiseOrbitControllerProvider extends InheritedWidget {
  NoiseOrbitControllerProvider({required super.child});

  final NoiseOrbitController controller = NoiseOrbitController();

  NoiseOrbitState get state => controller.value;

  @override
  bool updateShouldNotify(covariant NoiseOrbitControllerProvider oldWidget) {
    return false;
  }

  static NoiseOrbitControllerProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NoiseOrbitControllerProvider>()!;
  }
}
