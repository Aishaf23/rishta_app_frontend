import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditReligiousBackground extends StatefulWidget {
  final Map<String, String> initialData;

  const EditReligiousBackground({super.key, required this.initialData});

  @override
  State<EditReligiousBackground> createState() => _EditReligiousBackgroundState();
}

class _EditReligiousBackgroundState extends State<EditReligiousBackground> {
  late String religion;
  late String motherTongue;
  late String community;
  late String subCommunity;
  late String casteNoBar;

  @override
  void initState() {
    super.initState();
    religion = widget.initialData["Religion"] ?? "Muslim";
    motherTongue = widget.initialData["Mother Tongue"] ?? "Urdu";
    community = widget.initialData["Community"] ?? "Arain";
    subCommunity = widget.initialData["Sub Community"] ?? "Not Specified";
    casteNoBar = widget.initialData["Caste No Bar"] ?? "Yes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Religious Background",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          EditInfoRow(
            title: "Religion",
            value: religion,
            options: ["Muslim", "Hindu", "Christian", "Sikh", "Other"],
            onChanged: (val) => setState(() => religion = val!),
          ),
          EditInfoRow(
            title: "Mother Tongue",
            value: motherTongue,
            options: ["Urdu", "Punjabi", "Sindhi", "Pashto", "Other"],
            onChanged: (val) => setState(() => motherTongue = val!),
          ),
          EditInfoRow(
            title: "Community",
            value: community,
            options: ["Arain", "Rajput", "Syed", "Jutt", "Other"],
            onChanged: (val) => setState(() => community = val!),
          ),
          EditInfoRow(
            title: "Sub Community",
            value: subCommunity,
            options: ["Not Specified", "Qureshi", "Sheikh", "Other"],
            onChanged: (val) => setState(() => subCommunity = val!),
          ),
          EditInfoRow(
            title: "Caste No Bar",
            value: casteNoBar,
            options: ["Yes", "No"],
            onChanged: (val) => setState(() => casteNoBar = val!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Religion": religion,
                "Mother Tongue": motherTongue,
                "Community": community,
                "Sub Community": subCommunity,
                "Caste No Bar": casteNoBar,
              };
              Navigator.pop(context, updatedData);
            },
            child: const Text(
              "Update",
              style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// 🔹 Reusable Dropdown Row
class EditInfoRow extends StatelessWidget {
  final String title;
  final String value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const EditInfoRow({
    super.key,
    required this.title,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: DropdownButtonFormField<String>(
              value: value,
              items: options
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
                  .toList(),
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
