import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/qualification.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class HeightDietHobbies extends StatefulWidget {
  const HeightDietHobbies({super.key});

  @override
  State<HeightDietHobbies> createState() => _HeightDietHobbiesState();
}

class _HeightDietHobbiesState extends State<HeightDietHobbies> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _dietController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();

  List<String> selectedHobbies = [];

  List<String> heightOptions = [
    "5'0\"", "5'1\"", "5'2\"", "5'3\"", "5'4\"", "5'5\"", "5'6\"", "5'7\"", "5'8\"", "5'9\"", "5'10\"", "5'11\"", "6'0\"",
  ];

  List<String> dietOptions = [
    "Vegetarian", "Non-Vegetarian",
  ];

  List<String> hobbyOptions = [
    "Reading", "Traveling", "Sports", "Music", "Cooking", "Photography", "Gaming", "Painting", "Dancing",
  ];

  void _openSelection({
    required String title,
    required List<String> options,
    required TextEditingController controller,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.mehroon,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            ),
          ],
        );
      },
    );
  }

  void _openHobbiesSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.mehroon,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Select Hobbies",
                    style: AppText.heading.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                ...hobbyOptions.map(
                      (hobby) => CheckboxListTile(
                        title: Text(
                          hobby,
                          style: AppText.body.copyWith(color: Colors.white),
                        ),
                        value: selectedHobbies.contains(hobby),
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        onChanged: (bool? selected) {
                          setModalState(() {
                            if (selected != null && selected) {
                              if (!selectedHobbies.contains(hobby)) {
                                selectedHobbies.add(hobby);
                              }
                            } else {
                              selectedHobbies.remove(hobby);
                            }

                            _hobbiesController.text = selectedHobbies.join(", ");
                          });
                        },
                      ),

                ),

                const SizedBox(height: 20),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("User Details", style: AppText.subheading.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox.expand(
        child: AuthBackground(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
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
                  const SizedBox(height: 60),

                  CustomTextField(
                    controller: _heightController,
                    hintText: "Select Height",
                    labelText: "Height",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      title: "Select Height",
                      options: heightOptions,
                      controller: _heightController,
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _dietController,
                    hintText: "Select Diet",
                    labelText: "Diet",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      title: "Select Diet",
                      options: dietOptions,
                      controller: _dietController,
                    ),
                  ),
                  const SizedBox(height: 16),


                  CustomTextField(
                    controller: _hobbiesController,
                    hintText: "Select Hobbies",
                    labelText: "Hobbies",
                    isDropdown: true,
                    onTap: _openHobbiesSelection,
                  ),
                  const SizedBox(height: 40),

                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: CustomGradientButton(
                        onPressed: () {
                          if (_heightController.text.isEmpty ||
                              _dietController.text.isEmpty ||
                              selectedHobbies.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please fill all the fields.",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Qualification()),
                            );
                          }
                        },
                        textColor: AppColors.primaryColor,
                        backgroundColor: Colors.white,
                        text: 'Continue',
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
