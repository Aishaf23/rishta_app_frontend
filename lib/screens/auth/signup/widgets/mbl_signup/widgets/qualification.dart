import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/work_detail.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class Qualification extends StatefulWidget {
  const Qualification({super.key});

  @override
  State<Qualification> createState() => _QualificationState();
}

class _QualificationState extends State<Qualification> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _qualificationController = TextEditingController();
  final TextEditingController _fieldOfStudyController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _graduationYearController = TextEditingController();

  DateTime? _graduationYear;

  final List<String> qualificationOptions = [
    "Matric",
    "Intermediate",
    "Bachelor's",
    "Master's",
    "PhD",
    "Diploma",
    "MBBS",
    "CA",
    "LLB",
    "Other",
  ];

  void _openQualificationPicker() {
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
            Text("Select Qualification", style: AppText.subheading.copyWith(color: Colors.white)),
            const SizedBox(height: 10),
            ...qualificationOptions.map(
                  (qualification) => ListTile(
                title: Text(qualification, style: AppText.body.copyWith(color: Colors.white)),
                onTap: () {
                  _qualificationController.text = qualification;
                  Navigator.pop(context);
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
      final yearText = _graduationYearController.text;
      final year = int.tryParse(yearText);

      if (year == null || year < 1950 || year > DateTime.now().year) {
        // Show error if invalid year
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Please enter a valid graduation year",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
        );
        return;
      }

      _graduationYear = DateTime(year);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WorkDetail()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all required fields correctly",
            style: TextStyle(color: Colors.black),
          ),
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
        title: Text("Highest Qualification", style: AppText.subheading.copyWith(color: Colors.white)),
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
                        child: Icon(Icons.school, size: 50, color: AppColors.white),
                      ),
                    ),
                    const SizedBox(height: 40),

                    CustomTextField(
                      controller: _qualificationController,
                      hintText: "Select Qualification",
                      labelText: "Qualification",
                      isDropdown: true,
                      onTap: _openQualificationPicker,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Qualification is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      controller: _fieldOfStudyController,
                      hintText: "Enter field of study",
                      labelText: "Field of Study",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field of study is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      controller: _universityController,
                      hintText: "Enter university/college",
                      labelText: "University / College",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "University or college name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    CustomTextField(
                      controller: _graduationYearController,
                      hintText: "Enter year of graduation (e.g. 2022)",
                      labelText: "Graduation Year",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Graduation year is required";
                        }
                        final year = int.tryParse(value);
                        if (year == null || year < 1950 || year > DateTime.now().year) {
                          return "Enter a valid year";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),

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
