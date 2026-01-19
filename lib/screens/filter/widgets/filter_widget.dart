import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class FilterWidget extends StatefulWidget {
  final String heading;
  final List<String> options;
  final bool isMultiSelect;
  final List<String> selectedOptions;
  final Function(List<String>) onSelectionChanged;

  const FilterWidget({
    Key? key,
    required this.heading,
    required this.options,
    this.isMultiSelect = false,
    required this.selectedOptions,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {

  @override
  Widget build(BuildContext context) {
    final bool centerHeading = widget.options.length > 3;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment:
          centerHeading ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Text(
              widget.heading,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),

            _buildSelectedChips(),

            const SizedBox(height: 8),

            ...widget.options.map((option) {
              if (widget.isMultiSelect) {
                return CheckboxListTile(
                  activeColor: AppColors.primaryColor,
                  value: widget.selectedOptions.contains(option),
                  title: Text(option),
                  onChanged: (bool? checked) {
                    final newSelections = List<String>.from(widget.selectedOptions);
                    if (checked == true) {
                      if (!newSelections.contains(option)) {
                        newSelections.add(option);
                      }
                    } else {
                      newSelections.remove(option);
                    }
                    widget.onSelectionChanged(newSelections);
                  },
                );
              } else {
                return RadioListTile<String>(
                  activeColor: AppColors.primaryColor,
                  value: option,
                  groupValue: widget.selectedOptions.isNotEmpty
                      ? widget.selectedOptions.first
                      : null,
                  title: Text(option),
                  onChanged: (String? value) {
                    if (value != null) {
                      widget.onSelectionChanged([value]);
                    }
                  },
                );
              }
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedChips() {
    if (!widget.isMultiSelect || widget.selectedOptions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.selectedOptions.map((item) {
        return Chip(
          label: Text(item),
          deleteIcon: const Icon(Icons.close, size: 18),
          onDeleted: () {
            final newSelections = List<String>.from(widget.selectedOptions)
              ..remove(item);
            widget.onSelectionChanged(newSelections);
          },
          backgroundColor: AppColors.primaryColor.withOpacity(0.1),
          labelStyle: TextStyle(color: AppColors.primaryColor),
        );
      }).toList(),
    );
  }
}
