import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/name_and_birth_date.dart';

class ProfileSelection extends StatefulWidget {
  const ProfileSelection({super.key});

  @override
  State<ProfileSelection> createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  String? selectedProfile;
  String? selectedGender;

  final List<String> profileOptions = [
    "Myself",
    "My Son",
    "My Daughter",
    "My Brother",
    "My Sister",
    "My Friend",
    "My Relative",
  ];

  final List<String> profilesNeedGender = [
    "Myself",
    "My Friend",
    "My Relative"
  ];

  @override
  Widget build(BuildContext context) {
    bool showGender =
        selectedProfile != null && profilesNeedGender.contains(selectedProfile);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Profile Selection",
          style: AppText.subheading.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox.expand(
        child:  AuthBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 110),
            
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person,
                          size: 50, color: AppColors.white),
                    ),
                  ),
            
                  const SizedBox(height: 20),

                  Text(
                    "This Profile is for",
                    style: AppText.subheading.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 12),
            
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: profileOptions.map((option) {
                      bool isSelected = selectedProfile == option;
                      return ChoiceChip(
                        label: Text(option, style: AppText.body),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedProfile = option;
                            selectedGender = null;
                          });
                        },
                        selectedColor: AppColors.black,
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
            
                  const SizedBox(height: 30),
            
                  if (showGender) ...[
                    Text("Your Gender", style: AppText.subheading.copyWith(color: Colors.white)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      children: ["Male", "Female"].map((gender) {
                        bool isSelected = selectedGender == gender;
                        return ChoiceChip(
                          label: Text(gender, style: AppText.body),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() {
                              selectedGender = gender;
                            });
                          },
                          selectedColor: AppColors.black,
                          backgroundColor: Colors.grey.shade200,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                  ],
            
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: CustomGradientButton(
                        text: 'Continue',
                        textColor: AppColors.primaryColor,
                        backgroundColor: Colors.white,
                        onPressed: () {
                          if (selectedProfile == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select a profile option")),
                            );
                            return;
                          }
            
                          if (showGender && selectedGender == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please select gender")),
                            );
                            return;
                          }
                           Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => NameAndBirthDate(
                              profileFor: selectedProfile!,
                              gender: selectedGender,
                                ),
                             ),
                           );
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
