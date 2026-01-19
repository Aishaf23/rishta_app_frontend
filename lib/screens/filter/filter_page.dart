import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bar.dart';
import 'package:rishta_app/global_widgets/custom_drawer/custom_drawer.dart';

import 'widgets/filter_widget.dart';
import 'widgets/range_filter_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> selectedPhotoSettings = ["Open to all"];
  List<String> selectedRecentSettings = ["Open to all"];
  RangeValues ageRange = const RangeValues(22, 27);
  RangeValues heightRange = const RangeValues(
    64,
    72,
  ); // 5'0" = 60 in, 6'0" = 72 in

  String _heightFormatter(double inches) {
    int feet = inches ~/ 12;
    int inch = (inches % 12).round();
    return "$feet'${inch}\"";
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RangeFilterWidget(
              heading: "Age",
              min: 21,
              max: 71,
              initialRange: ageRange,
              onRangeChanged: (range) {
                setState(() {
                  ageRange = range;
                });
              },
            ),

            const SizedBox(height: 16),

            RangeFilterWidget(
              heading: "Height",
              min: 60, // 5'0" in inches
              max: 84, // 7'0" in inches
              initialRange: heightRange,
              valueFormatter: _heightFormatter, // custom format
              onRangeChanged: (range) {
                setState(() {
                  heightRange = range;
                });
              },
            ),

            FilterWidget(
              heading: "Photo Settings",
              options: ["Open to all", "Visible to all", "Protected Photo"],
              isMultiSelect: false, // radio buttons
              selectedOptions: selectedPhotoSettings,
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedPhotoSettings = newSelection;
                });
              },
            ),

            FilterWidget(
              heading: "Recently Joined",
              options: [
                "Open to all",
                "Within a month",
                "Within a week",
                "Within a day",
              ],
              isMultiSelect: true,
              selectedOptions: selectedRecentSettings,
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedRecentSettings = newSelection;
                });
              },
            ),
          ],
        ),
      );
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

          height: 60,
          child: SizedBox(
            height: 30,
            child: CustomGradientButton(
              text: "Apply",
              textColor: AppColors.primaryColor,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context, {
                  "ageRange": ageRange,
                  "heightRange": heightRange,
                  "photoSettings": selectedPhotoSettings,
                  "recentSettings": selectedRecentSettings,
                });
              },
            ),
          ),
        ),
    );
  }
}
