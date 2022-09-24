import 'package:flutter/material.dart';
import 'package:flutter_canvart/shared/widget/tool_constraints.dart';

@immutable
class DropdownData<T> {
  const DropdownData({
    required this.value,
    required this.onChanged,
    required this.items,
    required this.textColor,
    required this.backgroundColor,
  });

  final T value;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;
  final Color textColor;
  final Color backgroundColor;
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
    return ToolConstraints(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label),
          DropdownButton(
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(color: data.textColor),
            dropdownColor: data.backgroundColor,
            value: data.value,
            items: data.items,
            onChanged: data.onChanged,
            isExpanded: true,
          ),
        ],
      ),
    );
  }
}
