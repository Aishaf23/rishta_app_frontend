import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditPartnerEducationCareer extends StatefulWidget {
  final Map<String, String> initialData;

  const EditPartnerEducationCareer({super.key, required this.initialData});

  @override
  State<EditPartnerEducationCareer> createState() =>
      _EditPartnerEducationCareerState();
}

class _EditPartnerEducationCareerState
    extends State<EditPartnerEducationCareer> {
  late String qualification;
  late String workingWith;
  late String professionArea;
  late String workingAs;

  @override
  void initState() {
    super.initState();
    qualification = widget.initialData["Qualification"] ?? "Open to All";
    workingWith = widget.initialData["Working with"] ?? "Open to All";
    professionArea = widget.initialData["Profession area"] ?? "Open to All";
    workingAs = widget.initialData["Working as"] ?? "Open to All";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Partner Education Career",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildDropdown(
            title: "Qualification",
            value: qualification,
            options: [
              "Open to All",
              "High School",
              "Bachelor’s",
              "Master’s",
              "Doctorate",
              "Other"
            ],
            onChanged: (val) =>
                setState(() => qualification = val ?? "Open to All"),
          ),
          buildDropdown(
            title: "Working with",
            value: workingWith,
            options: [
              "Open to All",
              "Private Company",
              "Government / Public Sector",
              "Business / Self Employed",
              "Not Working"
            ],
            onChanged: (val) =>
                setState(() => workingWith = val ?? "Open to All"),
          ),
          buildDropdown(
            title: "Profession area",
            value: professionArea,
            options: [
              "Open to All",
              "Engineering",
              "Medical",
              "Business",
              "Education",
              "IT / Software",
              "Other"
            ],
            onChanged: (val) =>
                setState(() => professionArea = val ?? "Open to All"),
          ),
          buildDropdown(
            title: "Working as",
            value: workingAs,
            options: [
              "Open to All",
              "Manager",
              "Engineer",
              "Teacher",
              "Doctor",
              "Student",
              "Other"
            ],
            onChanged: (val) =>
                setState(() => workingAs = val ?? "Open to All"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Qualification": qualification,
                "Working with": workingWith,
                "Profession area": professionArea,
                "Working as": workingAs,
              };
              Navigator.pop(context, updatedData);
            },
            child: const Text(
              "Update",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
            child: Text(title,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
