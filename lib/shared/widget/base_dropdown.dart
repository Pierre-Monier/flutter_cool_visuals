import 'package:flutter/material.dart';

@immutable
class DropdownData<T> {
  const DropdownData({
    required this.value,
    required this.onChanged,
    required this.items,
  });

  final T value;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;
}

class BaseDropdown<T> extends StatelessWidget {
  const BaseDropdown({
    super.key,
    required this.label,
    required this.data,
  });

  final String label;
  final DropdownData<T> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        DropdownButton(
          value: data.value,
          items: data.items,
          onChanged: data.onChanged,
        ),
      ],
    );
  }
}
