import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditPartnerOtherDetail extends StatefulWidget {
  final Map<String, String> initialData;

  const EditPartnerOtherDetail({super.key, required this.initialData});

  @override
  State<EditPartnerOtherDetail> createState() => _EditPartnerOtherDetailState();
}

class _EditPartnerOtherDetailState extends State<EditPartnerOtherDetail> {
  late String profileManagedBy;
  late String diet;

  @override
  void initState() {
    super.initState();
    profileManagedBy = widget.initialData["Profile managed by"] ?? "Open to All";
    diet = widget.initialData["Diet"] ?? "Open to All";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Partner Other Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildDropdown(
            title: "Profile managed by",
            value: profileManagedBy,
            options: ["Open to All", "Self", "Parent", "Sibling", "Relative", "Other"],
            onChanged: (val) => setState(() => profileManagedBy = val ?? "Open to All"),
          ),
          buildDropdown(
            title: "Diet",
            value: diet,
            options: ["Open to All", "Vegetarian", "Non-Vegetarian", "Eggetarian", "Vegan"],
            onChanged: (val) => setState(() => diet = val ?? "Open to All"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Profile managed by": profileManagedBy,
                "Diet": diet,
              };
              Navigator.pop(context, updatedData);
            },
            child: const Text(
              "Update",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  /// 🔹 Dropdown builder helper
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
            child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 6,
            child: DropdownButtonFormField<String>(
              value: safeValue,
              items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
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
