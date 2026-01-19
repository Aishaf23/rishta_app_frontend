import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditPartnerLocationDetail extends StatefulWidget {
  final Map<String, String> initialData;

  const EditPartnerLocationDetail({super.key, required this.initialData});

  @override
  State<EditPartnerLocationDetail> createState() => _EditPartnerLocationDetailState();
}

class _EditPartnerLocationDetailState extends State<EditPartnerLocationDetail> {
  late String country;
  late String state;

  @override
  void initState() {
    super.initState();
    country = widget.initialData["Country living in"] ?? "Not Specified";
    state = widget.initialData["State / living in"] ?? "Open to All";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Partner Location Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildDropdown(
            title: "Country living in",
            value: country,
            options: ["Not Specified", "Pakistan", "India", "USA", "UK", "Canada", "Other"],
            onChanged: (val) => setState(() => country = val ?? "Not Specified"),
          ),
          buildDropdown(
            title: "State / living in",
            value: state,
            options: ["Open to All", "Punjab", "Sindh", "KPK", "Balochistan", "Other"],
            onChanged: (val) => setState(() => state = val ?? "Open to All"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Country living in": country,
                "State / living in": state,
              };
              Navigator.pop(context, updatedData);
            },
            child: const Text(
              "Update",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 🔹 Reusable Dropdown Builder
  Widget buildDropdown({
    required String title,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
  }) {
    final safeValue = options.contains(value) ? value : options.first;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 6,
            child: DropdownButtonFormField<String>(
              value: safeValue,
              items: options
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
