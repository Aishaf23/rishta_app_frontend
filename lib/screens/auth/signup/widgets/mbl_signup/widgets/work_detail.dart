import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/Marital_status.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class WorkDetail extends StatefulWidget {
  const WorkDetail({super.key});

  @override
  State<WorkDetail> createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _workLocationController = TextEditingController();
  final TextEditingController _jobTypeController = TextEditingController();

  final List<String> incomeOptions = [
    "Below 20,000",
    "20,000 - 50,000",
    "50,000 - 1 Lakh",
    "1 Lakh - 2 Lakh",
    "2 Lakh+"
  ];

  final List<String> locationOptions = [
    "Office",
    "Home",
    "School",
    "Hospital",
    "Factory",
    "Other"
  ];

  final List<String> jobTypeOptions = [
    "Government",
    "Private",
    "Self-employed",
    "Freelancer",
    "Unemployed"
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
                  setState(() {}); // Update UI if needed
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MaritalStatus()),
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
        title: Text("Work Details", style: AppText.subheading.copyWith(color: Colors.white)),
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
                        child: Icon(Icons.work, size: 50, color: AppColors.white),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Income Picker

                    CustomTextField(
                      controller: _incomeController,
                      hintText: "Select Annual Income",
                      labelText: "Annual Income",
                      isDropdown: true,
                      onTap: () => _openPicker(
                        options: incomeOptions,
                        controller: _incomeController,
                        title: "Select Income Range",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Annual income is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Only show if income selected
                    if (_incomeController.text.isNotEmpty) ...[
                      CustomTextField(
                        controller: _jobTitleController,
                        hintText: "e.g. Teacher, Engineer",
                        labelText: "your work",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "required this field";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _workLocationController,
                        hintText: "Select work location",
                        labelText: "Work Location",
                        isDropdown: true,
                        onTap: () => _openPicker(
                          options: locationOptions,
                          controller: _workLocationController,
                          title: "Select Work Location",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Work location required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      CustomTextField(
                        controller: _jobTypeController,
                        hintText: "Select job type",
                        labelText: "Job Type",
                        isDropdown: true,
                        onTap: () => _openPicker(
                          options: jobTypeOptions,
                          controller: _jobTypeController,
                          title: "Select Job Type",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Job type required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                    ],

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
