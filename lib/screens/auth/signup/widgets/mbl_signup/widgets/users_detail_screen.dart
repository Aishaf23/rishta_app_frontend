import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/add_family_details.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _communityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  void _openSelection(
      TextEditingController controller, String title, List<String> options) {
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
              child: Text(title,
                  style: AppText.heading.copyWith(color: Colors.white)),
            ),
            ...options.map((e) => ListTile(
              title: Text(e, style: AppText.body.copyWith(color: Colors.white)),
              onTap: () {
                controller.text = e;
                Navigator.pop(context);
              },
            )),
          ],
        );
      },
    );
  }

  void _validateAndContinue() {
    if (_religionController.text.isEmpty ||
        _communityController.text.isEmpty ||
        _countryController.text.isEmpty ||
        _stateController.text.isEmpty ||
        _cityController.text.isEmpty) {
      _showError("Please fill all the details");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddFamilyDetails()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All details are valid!",
          style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Colors.white,
        ),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        duration: const Duration(seconds: 2),
      ),
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
              padding: const EdgeInsets.all(16),
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
                    controller: _religionController,
                    hintText: "Select Religion",
                    labelText: "Religion",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      _religionController,
                      "Select Religion",
                      ["Muslim", "Christian", "Hindu", "Other"],
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _communityController,
                    hintText: "Select Community",
                    labelText: "Community",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      _communityController,
                      "Select Community",
                      ["Urdu", "Punjabi", "Sindhi", "Pashto"],
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _countryController,
                    hintText: "Select Country",
                    labelText: "Country",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      _countryController,
                      "Select Country",
                      ["Pakistan", "India", "UK", "USA"],
                    ),
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _stateController,
                    hintText: "Select State",
                    labelText: "State",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      _stateController,
                      "Select State",
                      ["Punjab", "Sindh", "KPK", "Balochistan"],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // City field
                  CustomTextField(
                    controller: _cityController,
                    hintText: "Select City",
                    labelText: "City",
                    isDropdown: true,
                    onTap: () => _openSelection(
                      _cityController,
                      "Select City",
                      ["Lahore", "Karachi", "Islamabad", "Peshawar"],
                    ),
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: CustomGradientButton(
                        text: 'Continue',
                        textColor: AppColors.primaryColor,
                        backgroundColor: Colors.white,
                        onPressed: _validateAndContinue,
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



