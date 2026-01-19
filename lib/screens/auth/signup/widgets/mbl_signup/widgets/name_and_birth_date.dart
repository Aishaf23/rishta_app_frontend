import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/date_picker.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/users_detail_screen.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class NameAndBirthDate extends StatefulWidget {
  final String profileFor;
  final String? gender;

  const NameAndBirthDate({
    super.key,
    required this.profileFor,
    this.gender,
  });

  @override
  State<NameAndBirthDate> createState() => _NameAndBirthDateState();
}

class _NameAndBirthDateState extends State<NameAndBirthDate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  DateTime? selectedDate;

  String getTitleText() {
    if (widget.profileFor == "Myself") {
      return "Your name";
    } else if (widget.gender == "Male") {
      return "His name";
    } else if (widget.gender == "Female") {
      return "Her name";
    } else {
      return "Name";
    }
  }

  int calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Profile Setup", style: AppText.subheading.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox.expand(
        child: AuthBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110),
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, size: 50, color: AppColors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Text(getTitleText(), style: AppText.subheading.copyWith(color: Colors.white)),
                  ),
                  const SizedBox(height: 20),

                  CustomTextField(
                    controller: _firstNameController,
                    hintText: "First name",
                    labelText: "First name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),

                  CustomTextField(
                    controller: _lastNameController,
                    hintText: "Last name",
                    labelText: "Last name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name is required";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  Text("Date of birth", style: AppText.subheading.copyWith(color: Colors.white)),
                  const SizedBox(height: 10),

                  CustomDatePickerField(
                    selectedDate: selectedDate,
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (selectedDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please select your date of birth", style: TextStyle(color: Colors.black)),
                                  backgroundColor: Colors.white,
                                ),
                              );
                              return;
                            }

                            int age = calculateAge(selectedDate!);

                            if (age >= 21) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("You must be at least 21 years old"),
                                  backgroundColor: AppColors.mehroon,
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

