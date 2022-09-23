import 'package:flutter/material.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/noise_orbit.dart';
import 'package:flutter_canvart/noise_orbit/tool/noise_orbit_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NoiseOrbitControllerProvider(
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
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
          final modalBottomSheetHeight = MediaQuery.of(context).size.height / 4;

          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            elevation: 0.0,
            builder: (context) {
              return SizedBox(
                height: modalBottomSheetHeight,
                child: ListView(
                  children: const [
                    NoiseOrbitConfiguration(),
                  ],
                ),
              );
            },
          );
        },
        // child: Icon(Icons.settings),
      ),
    );
  }
}
