import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/ui/views/turkey/turkey_viewmodel.dart';

class FilterChipRow extends StatelessWidget {
  final BundleFilter selected;
  final ValueChanged<BundleFilter> onSelect;
  const FilterChipRow(
      {required this.selected, required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: BundleFilter.values.map((f) {
        final label = f.name[0].toUpperCase() + f.name.substring(1);
        final isSelected = f == selected;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(label),
            shape: const StadiumBorder(
              side: BorderSide(color: Color(0xFF5BC0EB), width: 1),
            ),
            selected: isSelected,
            backgroundColor: Colors.white,
            showCheckmark: false,
            onSelected: (_) => onSelect(f),
            selectedColor: const Color(0xFF5BC0EB),
            labelStyle:
                TextStyle(color: isSelected ? Colors.white : Color(0xFF5BC0EB)),
          ),
        );
      }).toList(),
    );
  }
}
