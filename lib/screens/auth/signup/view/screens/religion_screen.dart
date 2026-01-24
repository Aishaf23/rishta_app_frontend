import 'package:flutter/material.dart';
import '../signup_controller.dart';

class MultiStepDropdownScreen extends StatefulWidget {
  final SignupController controller;
  final VoidCallback onNext;
  final VoidCallback onBack;

  MultiStepDropdownScreen({
    required this.controller,
    required this.onNext,
    required this.onBack,
  });

  @override
  _MultiStepDropdownScreenState createState() =>
      _MultiStepDropdownScreenState();
}

class _MultiStepDropdownScreenState extends State<MultiStepDropdownScreen> {
  bool showCommunity = false;
  bool showLivingIn = false;

  List<String> religions = ["Islam", "Hindu", "Christian", "Other"];
  List<String> communities = ["Community 1", "Community 2", "Community 3"];
  List<String> locations = ["City 1", "City 2", "City 3"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: widget.onBack),

            Text(
              "Select Religion",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: widget.controller.religion,
              items: religions
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  widget.controller.religion = val;
                  showCommunity =
                      true; // Show community after religion selected
                });
              },
              decoration: InputDecoration(labelText: "Religion"),
            ),

            SizedBox(height: 20),

            // Step 2: Community
            if (showCommunity) ...[
              Text(
                "Select Community",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: widget.controller.community,
                items: communities
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    widget.controller.community = val;
                    showLivingIn =
                        true; // Show living in after community selected
                  });
                },
                decoration: InputDecoration(labelText: "Community"),
              ),
            ],

            SizedBox(height: 20),

            // Step 3: Living In
            if (showLivingIn) ...[
              Text(
                "Where are you living?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: widget.controller.livingIn,
                items: locations
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    widget.controller.livingIn = val;
                  });
                },
                decoration: InputDecoration(labelText: "Living In"),
              ),

              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed:
                      widget.controller.religion != null &&
                          widget.controller.community != null &&
                          widget.controller.livingIn != null
                      ? widget.onNext
                      : null, // Enable submit only when all selected
                  child: Text("Submit"),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
