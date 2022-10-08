// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_canvart/judgy_voronoi_diagram/judgy_voronoi_diagram.dart';
import 'package:flutter_canvart/noise_orbit/controller/noise_orbit_controller_provider.dart';
import 'package:flutter_canvart/noise_orbit/noise_orbit.dart';
import 'package:flutter_canvart/noise_orbit/tool/noise_orbit_configuration.dart';
import 'package:flutter_canvart/shared/style/app_icons.dart';
import 'package:flutter_canvart/shared/widget/configuration_modal.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void openLink(String path) {
    final uri = Uri.parse(path);
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text("Perlin Noise Orbit"),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         openLink("https://twitter.com/pierremonier9");
      //       },
      //       icon: const Icon(AppIcons.twitter),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         openLink("https://github.com/Pierre-Monier/flutter_cool_visuals");
      //       },
      //       icon: const Icon(AppIcons.github),
      //     ),
      //   ],
      // ),
      body: SizedBox.expand(
        child: JudgyVoronoiDiagram(),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       context: context,
      //       barrierColor: Colors.transparent,
      //       backgroundColor: Colors.transparent,
      //       builder: (context) {
      //         return const ConfigurationModal(
      //           child: NoiseOrbitConfiguration(),
      //         );
      //       },
      //     );
      //   },
      //   icon: const Icon(Icons.edit),
      //   label: const Text("Edit"),
      // ),
    );
  }
}
