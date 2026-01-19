import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditLocationEducationCareer extends StatefulWidget {
  final Map<String, String> initialData;

  const EditLocationEducationCareer({super.key, required this.initialData});

  @override
  State<EditLocationEducationCareer> createState() =>
      _EditLocationEducationCareerState();
}

class _EditLocationEducationCareerState
    extends State<EditLocationEducationCareer> {
  late TextEditingController zipController;
  late TextEditingController collegeController;
  late TextEditingController employerController;

  late String country;
  late String state;
  late String city;
  late String residency;
  late String grewUp;
  late String qualification;
  late String workingWith;
  late String workingAs;
  late String income;

  @override
  void initState() {
    super.initState();
    country = widget.initialData["Country Living in"] ?? "Pakistan";
    state = widget.initialData["State Living in"] ?? "Punjab";
    city = widget.initialData["City Living in"] ?? "Other";
    residency = widget.initialData["Residency Status"] ?? "Citizen";
    zipController =
        TextEditingController(text: widget.initialData["Zip / Pin code"]);
    grewUp = widget.initialData["Grew up in"] ?? "Pakistan";
    qualification = widget.initialData["Highest Qualification"] ?? "Other";
    collegeController =
        TextEditingController(text: widget.initialData["College(s) Attented"]);
    workingWith = widget.initialData["Working with"] ?? "Non Working";
    workingAs = widget.initialData["Working As"] ?? "Non Working";
    income = widget.initialData["Annual income"] ?? "Not applicable";
    employerController =
        TextEditingController(text: widget.initialData["Employer Name"]);
  }

  @override
  void dispose() {
    zipController.dispose();
    collegeController.dispose();
    employerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Location, Education, Career",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          buildDropdown("Country Living in", country, ["Pakistan", "India", "Other"],
                  (val) => setState(() => country = val ?? country)),
          buildDropdown("State Living in", state, ["Punjab", "Sindh", "KPK", "Other"],
                  (val) => setState(() => state = val ?? state)),
          buildDropdown("City Living in", city, ["Lahore", "Karachi", "Islamabad", "Other"],
                  (val) => setState(() => city = val ?? city)),
          buildDropdown("Residency Status", residency,
              ["Citizen", "PR", "Work Visa", "Student Visa"],
                  (val) => setState(() => residency = val ?? residency)),
          buildTextField("Zip / Pin code", zipController),
          buildDropdown("Grew up in", grewUp, ["Pakistan", "India", "Other"],
                  (val) => setState(() => grewUp = val ?? grewUp)),
          buildDropdown("Highest Qualification", qualification,
              ["Other", "Matric", "Intermediate", "Bachelors", "Masters", "PhD"],
                  (val) => setState(() => qualification = val ?? qualification)),
          buildTextField("College(s) Attented", collegeController),
          buildDropdown("Working with", workingWith,
              ["Non Working", "Private", "Government", "Business"],
                  (val) => setState(() => workingWith = val ?? workingWith)),
          buildDropdown("Working As", workingAs,
              ["Non Working", "Engineer", "Doctor", "Teacher", "Other"],
                  (val) => setState(() => workingAs = val ?? workingAs)),
          buildDropdown("Annual income", income,
              ["Not applicable", "< 5 Lakh", "5-10 Lakh", "10+ Lakh"],
                  (val) => setState(() => income = val ?? income)),
          buildTextField("Employer Name", employerController),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Country Living in": country,
                "State Living in": state,
                "City Living in": city,
                "Residency Status": residency,
                "Zip / Pin code": zipController.text,
                "Grew up in": grewUp,
                "Highest Qualification": qualification,
                "College(s) Attented": collegeController.text,
                "Working with": workingWith,
                "Working As": workingAs,
                "Annual income": income,
                "Employer Name": employerController.text,
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

  /// 🔹 Reusable TextField builder
  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.done, // 🔹 Enter → Done
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  /// 🔹 Reusable Dropdown builder
  Widget buildDropdown(
      String label, String value, List<String> options, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: options.contains(value) ? value : options.first,
        items: options
            .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
