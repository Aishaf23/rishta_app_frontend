import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditLifestyle extends StatefulWidget {
  final Map<String, String> initialData;

  const EditLifestyle({super.key, required this.initialData});

  @override
  State<EditLifestyle> createState() => _EditLifestyleState();
}

class _EditLifestyleState extends State<EditLifestyle> {
  late String diet;

  @override
  void initState() {
    super.initState();
    diet = widget.initialData["Diet"] ?? "Not Specified";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit LifeStyle",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: diet,
              items: [
                "Not Specified",
                "Vegetarian",
                "Non-Vegetarian",
                "Eggetarian",
                "Vegan",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (val) => setState(() => diet = val ?? "Not Specified"),
              decoration: const InputDecoration(
                labelText: "Diet",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                final updatedData = {
                  "Diet": diet,
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
      ),
    );
  }
}
