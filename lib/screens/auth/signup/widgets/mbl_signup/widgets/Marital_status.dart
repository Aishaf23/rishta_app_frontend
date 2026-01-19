import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({super.key});

  @override
  State<MaritalStatus> createState() => _MaritalStatusState();
}

class _MaritalStatusState extends State<MaritalStatus> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _maritalStatusController = TextEditingController();
  final TextEditingController _haveChildrenController = TextEditingController();
  final TextEditingController _numberOfChildrenController = TextEditingController();

  final List<String> maritalStatusOptions = [
    "Never Married",
    "Divorced",
    "Widowed",
    "Awaiting Divorce",
    "Annulled",
  ];

  final List<String> haveChildrenOptions = [
    "No",
    "Yes - Living Together",
    "Yes - Not Living Together",
  ];

  final List<String> numberOfChildrenOptions = [
    "0",
    "1",
    "2",
    "3",
    "4+",
  ];

  void _openPicker({
    required List<String> options,
    required TextEditingController controller,
    required String title,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.mehroon,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(title, style: AppText.subheading.copyWith(color: Colors.white)),
            const SizedBox(height: 10),
            ...options.map(
                  (option) => ListTile(
                title: Text(option, style: AppText.body.copyWith(color: Colors.white)),
                onTap: () {
                  controller.text = option;
                  Navigator.pop(context);
                  setState(() {}); // Refresh UI
                },
              ),
            ),
          ],
        );
      },
    );
  }

  bool get _showChildrenField =>
      _maritalStatusController.text.isNotEmpty &&
          _maritalStatusController.text != "Never Married";

  bool get _showNumberOfChildren =>
      _haveChildrenController.text == "Yes - Living Together" ||
          _haveChildrenController.text == "Yes - Not Living Together";

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all required fields correctly", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Marital Status", style: AppText.subheading.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox.expand(
        child: AuthBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, size: 50, color: AppColors.white),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Marital Status
                    CustomTextField(
                      controller: _maritalStatusController,
                      hintText: "Select Marital Status",
                      labelText: "Marital Status",
                      isDropdown: true,
                      onTap: () => _openPicker(
                        options: maritalStatusOptions,
                        controller: _maritalStatusController,
                        title: "Select Marital Status",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Marital status is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Have Children
                    if (_showChildrenField)
                      CustomTextField(
                        controller: _haveChildrenController,
                        hintText: "Do you have children?",
                        labelText: "Children",
                        isDropdown: true,
                        onTap: () => _openPicker(
                          options: haveChildrenOptions,
                          controller: _haveChildrenController,
                          title: "Select Children Option",
                        ),
                        validator: (value) {
                          if (_showChildrenField && (value == null || value.isEmpty)) {
                            return "Please select children option";
                          }
                          return null;
                        },
                      ),
                    const SizedBox(height: 16),

                    // Number of Children
                    if (_showNumberOfChildren)
                      CustomTextField(
                        controller: _numberOfChildrenController,
                        hintText: "Select number of children",
                        labelText: "Number of Children",
                        isDropdown: true,
                        onTap: () => _openPicker(
                          options: numberOfChildrenOptions,
                          controller: _numberOfChildrenController,
                          title: "Select Number of Children",
                        ),
                        validator: (value) {
                          if (_showNumberOfChildren && (value == null || value.isEmpty)) {
                            return "Please select number of children";
                          }
                          return null;
                        },
                      ),
                    const SizedBox(height: 40),

                    // Submit Button
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 45,
                        child: CustomGradientButton(
                          text: "Continue",
                          textColor: AppColors.primaryColor,
                          backgroundColor: Colors.white,
                          onPressed: _submitForm,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
