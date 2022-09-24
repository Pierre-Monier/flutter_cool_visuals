import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/noise_orbit.dart';
import 'package:flutter_canvart/noise_orbit/tool/noise_orbit_configuration.dart';
import 'package:flutter_canvart/shared/widget/configuration_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NoiseOrbitControllerProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFFf7cac9),
          sliderTheme: SliderThemeData(
            overlayShape: SliderComponentShape.noOverlay,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox.expand(
        child: NoiseOrbit(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Edit"),
        icon: const Icon(Icons.edit),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return const ConfigurationModal(child: NoiseOrbitConfiguration());
            },
          );
        },
        // child: Icon(Icons.settings),
      ),
    );
  }
}
