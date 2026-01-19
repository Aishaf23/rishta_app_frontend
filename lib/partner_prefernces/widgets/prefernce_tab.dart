import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/screens/filter/widgets/range_filter_widget.dart';

class Prefernce_tab extends StatefulWidget {
  const Prefernce_tab({super.key});

  @override
  State<Prefernce_tab> createState() => _Prefernce_tabState();
}

class _Prefernce_tabState extends State<Prefernce_tab> {
  RangeValues ageRange = const RangeValues(18, 27);
  RangeValues heightRange = const RangeValues(4.5, 7.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Filters"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Only members matching the below criteria will be able to view your contact details",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // Age filter
            RangeFilterWidget(
              heading: "Age",
              min: 18,
              max: 60,
              initialRange: ageRange,
              onRangeChanged: (val) {
                setState(() => ageRange = val);
              },
              valueFormatter: (val) => "${val.toStringAsFixed(0)} yrs",
            ),
            const SizedBox(height: 16),

            // Height filter
            RangeFilterWidget(
              heading: "Height",
              min: 4.0,
              max: 7.0,
              initialRange: heightRange,
              onRangeChanged: (val) {
                setState(() => heightRange = val);
              },
              valueFormatter: (val) {
                int feet = val.floor();
                int inches = ((val - feet) * 12).round();
                return "$feet'$inches\"";
              },
            ),
            const SizedBox(height: 16),

            // Religion
            _buildClickableTile("Religion", "Muslim"),
            const SizedBox(height: 8),

            // Community
            _buildClickableTile("Community", "Open to All"),
            const SizedBox(height: 8),

            _buildClickableTile("Annual income", "Open to All"),
            const SizedBox(height: 8),

            _buildClickableTile("Working with", "Open to All"),
            const SizedBox(height: 8),

            _buildClickableTile("Mother tongue", "Open to All"),
            const SizedBox(height: 8),

            _buildClickableTile("Country", "Open to All"),
            const SizedBox(height: 8),

            // Save button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  // Save logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Filters Saved!")),
                  );
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableTile(String title, String value) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: TextStyle(color: AppColors.primaryColor)),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: () {
        // Navigate to selection screen
      },
    );
  }
}
