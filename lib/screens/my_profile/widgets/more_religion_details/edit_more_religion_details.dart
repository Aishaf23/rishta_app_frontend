import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditMoreReligionDetails extends StatefulWidget {
  final Map<String, String> initialData;

  const EditMoreReligionDetails({super.key, required this.initialData});

  @override
  State<EditMoreReligionDetails> createState() =>
      _EditMoreReligionDetailsState();
}

class _EditMoreReligionDetailsState extends State<EditMoreReligionDetails> {
  late String namaz;
  late String zakaat;
  late String fasting;

  @override
  void initState() {
    super.initState();
    namaz = widget.initialData["Namaz / Salaah"] ?? "Not Specified";
    zakaat = widget.initialData["Zakaat"] ?? "Not Specified";
    fasting = widget.initialData["Fasting in Ramadan"] ?? "Not Specified";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit More Religion Detail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          EditInfoRow(
            title: "Namaz / Salaah",
            value: namaz,
            options: [
              "Not Specified",
              "Regular",
              "Sometimes",
              "Only on Jummah",
              "Not Practicing"
            ],
            onChanged: (val) => setState(() => namaz = val!),
          ),
          EditInfoRow(
            title: "Zakaat",
            value: zakaat,
            options: ["Not Specified", "Yes", "No", "Occasionally"],
            onChanged: (val) => setState(() => zakaat = val!),
          ),
          EditInfoRow(
            title: "Fasting in Ramadan",
            value: fasting,
            options: ["Not Specified", "All", "Some", "None"],
            onChanged: (val) => setState(() => fasting = val!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Namaz / Salaah": namaz,
                "Zakaat": zakaat,
                "Fasting in Ramadan": fasting,
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

/// 🔹 Reusable Dropdown Row (same as Family & Religion)
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
