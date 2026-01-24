import 'package:flutter/material.dart';
import '../signup_controller.dart';

class ContactStep extends StatelessWidget {
  final SignupController controller;
  final VoidCallback onSubmit;
  final VoidCallback onBack;

  ContactStep({
    required this.controller,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: onBack),
      
            Text(
              "Contact Info",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.email,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: controller.mobile,
              decoration: InputDecoration(labelText: "Mobile"),
              keyboardType: TextInputType.phone,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(onPressed: onSubmit, child: Text("Submit")),
            ),
          ],
        ),
      ),
    );
  }
}
