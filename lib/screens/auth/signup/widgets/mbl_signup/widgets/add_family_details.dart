import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/height_diet_hobbies.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class AddFamilyDetails extends StatefulWidget {
  const AddFamilyDetails({super.key});

  @override
  State<AddFamilyDetails> createState() => _AddFamilyDetailsState();
}

class _AddFamilyDetailsState extends State<AddFamilyDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mothernameController = TextEditingController();
  final TextEditingController _fathernameController = TextEditingController();
  final TextEditingController _sistersController = TextEditingController();
  final TextEditingController _brotherController = TextEditingController();

  void _openSelection(
      TextEditingController controller, String title, List<String> options) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.mehroon,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  title,
                  style: AppText.heading.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              ...options.map(
                    (e) => ListTile(
                  title: Text(
                    e,
                    style: AppText.body.copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    controller.text = e;
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(12),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Family Details',
          style: AppText.subheading.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SizedBox.expand(
        child: AuthBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
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

                    SizedBox(height: 60),

                    CustomTextField(
                      controller: _mothernameController,
                      hintText: "Enter your Mother name",
                      labelText: "Mother name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mother name is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      controller: _fathernameController,
                      hintText: "Enter your Father name",
                      labelText: "Father name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Father name is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      controller: _sistersController,
                      hintText: "Select No.of Sisters",
                      labelText: "No. of Sisters",
                      isDropdown: true,
                      onTap: () => _openSelection(
                        _sistersController,
                        "Select No.of Sisters",
                        ["0", "1", "2", "3", "4", "5"],
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value == "No. of Sisters") {
                          return "Please select number of sisters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    CustomTextField(
                      controller: _brotherController,
                      hintText: "Select No.of Brothers",
                      labelText: "No. of Brothers",
                      isDropdown: true,
                      onTap: () => _openSelection(
                        _brotherController,
                        "Select No.of Brothers",
                        ["0", "1", "2", "3", "4", "5"],
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value == "No. of Brothers") {
                          return "Please select number of brothers";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 45,
                        child: CustomGradientButton(
                          text: 'Continue',
                          textColor: AppColors.primaryColor,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HeightDietHobbies(),
                                ),
                              );

                              print("All inputs are valid. Proceeding...");
                            } else {

                              _showError("Please fill all the required details");
                              print("Validation failed. Show errors.");
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
      ),
    );
  }
}


