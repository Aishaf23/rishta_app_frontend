import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class RangeFilterWidget extends StatefulWidget {
  final String heading;
  final double min;
  final double max;
  final RangeValues initialRange;
  final Function(RangeValues) onRangeChanged;
  final String Function(double)? valueFormatter;

  const RangeFilterWidget({
    Key? key,
    required this.heading,
    required this.min,
    required this.max,
    required this.initialRange,
    required this.onRangeChanged,
    this.valueFormatter,
  }) : super(key: key);

  @override
  State<RangeFilterWidget> createState() => _RangeFilterWidgetState();
}

class _RangeFilterWidgetState extends State<RangeFilterWidget> {
  late RangeValues _range;

  @override
  void initState() {
    super.initState();
    _range = widget.initialRange;
  }

  String _defaultFormatter(double value) {
    return value.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final formatter = widget.valueFormatter ?? _defaultFormatter;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading + selected values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.heading,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${formatter(_range.start)} - ${formatter(_range.end)}",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 1,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 0,
                ),
                activeTrackColor: AppColors.primaryColor,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: AppColors.primaryColor,
              ),
              child: RangeSlider(
                values: _range,
                min: widget.min,
                max: widget.max,
                labels: RangeLabels(
                  formatter(_range.start),
                  formatter(_range.end),
                ),
                onChanged: (values) {
                  setState(() {
                    _range = values;
                  });
                  widget.onRangeChanged(values);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
