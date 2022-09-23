import 'package:flutter/material.dart';

@immutable
class SliderData {
  const SliderData({
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
  });

  final double min;
  final double max;
  final double value;
  final void Function(double) onChanged;
}

class BaseSlider extends StatelessWidget {
  const BaseSlider({super.key, required this.label, required this.data});

  final String label;
  final SliderData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Slider(
          min: data.min,
          max: data.max,
          value: data.value,
          onChanged: data.onChanged,
        ),
      ],
    );
  }
}
