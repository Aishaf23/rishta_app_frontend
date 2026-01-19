import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditHobbiesInterest extends StatefulWidget {
  final Map<String, String> initialData;

  const EditHobbiesInterest({super.key, required this.initialData});

  @override
  State<EditHobbiesInterest> createState() => _EditHobbiesInterestState();
}

class _EditHobbiesInterestState extends State<EditHobbiesInterest> {
  late TextEditingController hobbiesController;

  @override
  void initState() {
    super.initState();
    hobbiesController = TextEditingController(
      text: (widget.initialData["Hobbies & Interests"] == "Enter Now")
          ? "" // 🔹 "Enter Now" ko TextField me na dikhaye
          : widget.initialData["Hobbies & Interests"] ?? "",
    );
  }

  @override
  void dispose() {
    hobbiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Hobbies & Interests",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: hobbiesController,
              textInputAction: TextInputAction.done,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Hobbies & Interests",
                hintText: "Enter your hobbies and interests",
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
                  "Hobbies & Interests": hobbiesController.text.isEmpty
                      ? "Enter Now"
                      : hobbiesController.text,
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
      ),
    );
  }
}
