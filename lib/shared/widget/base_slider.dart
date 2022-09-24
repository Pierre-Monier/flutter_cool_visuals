import 'package:flutter/material.dart';
import 'package:flutter_canvart/shared/widget/tool_constraints.dart';

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
    return ToolConstraints(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8.0),
          Slider(
            min: data.min,
            max: data.max,
            value: data.value,
            onChanged: data.onChanged,
          ),
        ],
      ),
    );
  }
}
