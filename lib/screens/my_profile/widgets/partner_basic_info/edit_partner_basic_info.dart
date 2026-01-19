import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditPartnerBasicInfo extends StatefulWidget {
  final Map<String, String> initialData;

  const EditPartnerBasicInfo({super.key, required this.initialData});

  @override
  State<EditPartnerBasicInfo> createState() => _EditPartnerBasicInfoState();
}

class _EditPartnerBasicInfoState extends State<EditPartnerBasicInfo> {
  late String age;
  late String height;
  late String maritalStatus;
  late String children;
  late String religion;
  late String motherTongue;

  @override
  void initState() {
    super.initState();
    age = widget.initialData["Age"] ?? "Not Specified";
    height = widget.initialData["Height"] ?? "Not Specified";
    maritalStatus = widget.initialData["Marital Status"] ?? "Open to All";
    children = widget.initialData["Children"] ?? "Open to All";
    religion = widget.initialData["Religion / Community"] ?? "Muslim";
    motherTongue = widget.initialData["Mother Tongue"] ?? "Not Specified";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Partner Basic Info",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildDropdown(
            title: "Age",
            value: age,
            options: ["Not Specified", "18-25", "26-30", "31-35", "36-40", "41+"],
            onChanged: (val) => setState(() => age = val ?? "Not Specified"),
          ),
          buildDropdown(
            title: "Height",
            value: height,
            options: ["Not Specified", "5ft - 5.5ft", "5.6ft - 6ft", "6ft+"],
            onChanged: (val) => setState(() => height = val ?? "Not Specified"),
          ),
          buildDropdown(
            title: "Marital Status",
            value: maritalStatus,
            options: ["Open to All", "Never Married", "Divorced", "Widowed"],
            onChanged: (val) => setState(() => maritalStatus = val ?? "Open to All"),
          ),
          buildDropdown(
            title: "Children",
            value: children,
            options: ["Open to All", "Yes", "No"],
            onChanged: (val) => setState(() => children = val ?? "Open to All"),
          ),
          buildDropdown(
            title: "Religion / Community",
            value: religion,
            options: ["Muslim", "Christian", "Hindu", "Other"],
            onChanged: (val) => setState(() => religion = val ?? "Muslim"),
          ),
          buildDropdown(
            title: "Mother Tongue",
            value: motherTongue,
            options: ["Not Specified", "Urdu", "Punjabi", "Sindhi", "Pashto", "Other"],
            onChanged: (val) => setState(() => motherTongue = val ?? "Not Specified"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Age": age,
                "Height": height,
                "Marital Status": maritalStatus,
                "Children": children,
                "Religion / Community": religion,
                "Mother Tongue": motherTongue,
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
