import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditBasicInfo extends StatefulWidget {
  final Map<String, String> initialData;

  const EditBasicInfo({super.key, required this.initialData});

  @override
  State<EditBasicInfo> createState() => _EditBasicInfoState();
}

class _EditBasicInfoState extends State<EditBasicInfo> {
  late String postedBy;
  late String gender;
  late String maritalStatus;
  late String children;
  late String height;
  late String disability;
  late String healthInfo;
  late String bloodGroup;

  @override
  void initState() {
    super.initState();
    postedBy = widget.initialData["Posted by"] ?? "Friend";
    gender = widget.initialData["Gender"] ?? "Male";
    maritalStatus = widget.initialData["Marital Status"] ?? "Never Married";
    children = widget.initialData["Children"] ?? "No";
    height = widget.initialData["Height"] ?? "4'8 (142cm)";
    disability = widget.initialData["Any Disability"] ?? "None";
    healthInfo = widget.initialData["Health Information"] ?? "Not Specified";
    bloodGroup = widget.initialData["Blood Group"] ?? "Select";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Basic Info",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white), // Makes back icon white
      ),
        body: ListView(
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Basic Info",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// Profile managed by
          EditInfoRow(
            title: "Profile managed by",
            value: postedBy,
            options: ["Self", "Parent", "Sibling", "Friend"],
            onChanged: (val) => setState(() => postedBy = val!),
          ),

          /// Gender
          EditInfoRow(
            title: "Gender",
            value: gender,
            options: ["Male", "Female"],
            onChanged: (val) => setState(() => gender = val!),
          ),

          /// Marital Status
          EditInfoRow(
            title: "Marital Status",
            value: maritalStatus,
            options: ["Never Married", "Married", "Divorced", "Widowed"],
            onChanged: (val) => setState(() => maritalStatus = val!),
          ),

          /// Children
          EditInfoRow(
            title: "Children",
            value: children,
            options: ["Yes", "No"],
            onChanged: (val) => setState(() => children = val!),
          ),

          /// Height
          EditInfoRow(
            title: "Height",
            value: height,
            options: [
              "4'8 (142cm)",
              "5'0 (152cm)",
              "5'5 (165cm)",
              "6'0 (183cm)"
            ],
            onChanged: (val) => setState(() => height = val!),
          ),

          /// Disability
          EditInfoRow(
            title: "Any Disability",
            value: disability,
            options: ["None", "Physical", "Other"],
            onChanged: (val) => setState(() => disability = val!),
          ),

          /// Health Info
          EditInfoRow(
            title: "Health Information",
            value: healthInfo,
            options: ["Not Specified", "Good", "Average", "Other"],
            onChanged: (val) => setState(() => healthInfo = val!),
          ),

          /// Blood Group
          EditInfoRow(
            title: "Blood Group",
            value: bloodGroup,
            options: [
              "Select",
              "A+",
              "A-",
              "B+",
              "B-",
              "O+",
              "O-",
              "AB+",
              "AB-"
            ],
            onChanged: (val) => setState(() => bloodGroup = val!),
          ),

          const SizedBox(height: 20),

          /// Update Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                final updatedData = {
                  "Posted by": postedBy,
                  "Gender": gender,
                  "Marital Status": maritalStatus,
                  "Children": children,
                  "Height": height,
                  "Any Disability": disability,
                  "Health Information": healthInfo,
                  "Blood Group": bloodGroup,
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
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// 🔹 Dropdown Row Widget
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
