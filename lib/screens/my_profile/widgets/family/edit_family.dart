import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditFamily extends StatefulWidget {
  final Map<String, String> initialData;

  const EditFamily({super.key, required this.initialData});

  @override
  State<EditFamily> createState() => _EditFamilyState();
}

class _EditFamilyState extends State<EditFamily> {
  late TextEditingController motherController;
  late TextEditingController fatherController;
  late String sisters;
  late String brothers;
  late String financialStatus;

  @override
  void initState() {
    super.initState();
    // ✅ "Enter Now" ko empty string bana diya
    motherController = TextEditingController(
      text: widget.initialData["Mother's Detail"] == "Enter Now"
          ? ""
          : widget.initialData["Mother's Detail"],
    );
    fatherController = TextEditingController(
      text: widget.initialData["Father's Detail"] == "Enter Now"
          ? ""
          : widget.initialData["Father's Detail"],
    );
    sisters = widget.initialData["No. of Sisters"] ?? "0";
    brothers = widget.initialData["No. of Brothers"] ?? "0";
    financialStatus =
        widget.initialData["Family Financial Status"] ?? "Not Specified";
  }

  @override
  void dispose() {
    motherController.dispose();
    fatherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit family Detail",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            controller: motherController,
            decoration: const InputDecoration(
              labelText: "Mother's Detail",
              hintText: "Enter Now", // ✅ placeholder
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: fatherController,
            decoration: const InputDecoration(
              labelText: "Father's Detail",
              hintText: "Enter Now", // ✅ placeholder
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          EditInfoRow(
            title: "No. of Sisters",
            value: sisters,
            options: List.generate(11, (i) => i.toString()),
            onChanged: (val) => setState(() => sisters = val ?? "0"),
          ),
          EditInfoRow(
            title: "No. of Brothers",
            value: brothers,
            options: List.generate(11, (i) => i.toString()),
            onChanged: (val) => setState(() => brothers = val ?? "0"),
          ),
          EditInfoRow(
            title: "Family Financial Status",
            value: financialStatus,
            options: [
              "Not Specified",
              "Lower",
              "Middle",
              "Upper Middle",
              "Rich"
            ],
            onChanged: (val) =>
                setState(() => financialStatus = val ?? "Not Specified"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {
              final updatedData = {
                "Mother's Detail": motherController.text.isEmpty
                    ? "Enter Now"
                    : motherController.text,
                "Father's Detail": fatherController.text.isEmpty
                    ? "Enter Now"
                    : fatherController.text,
                "No. of Sisters": sisters,
                "No. of Brothers": brothers,
                "Family Financial Status": financialStatus,
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
    final safeValue = options.contains(value) ? value : options.first;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
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
              value: safeValue,
              items: options
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
                  .toList(),
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
