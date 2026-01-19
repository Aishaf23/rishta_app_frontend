import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help & Support",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildTile(
            icon: Icons.person,
            title: "Profile Creation Issues",
            description:
            "If you experience difficulties while creating your profile, "
                "please ensure that your internet connection is stable and active. "
                "Profile pictures may fail to upload if the file size is too large — "
                "try compressing the image or using JPG/PNG format. "
                "Additionally, confirm that all mandatory fields are properly filled "
                "before submitting your profile information.",
          ),
          _buildTile(
            icon: Icons.lock,
            title: "Login / Password Issues",
            description:
            "If you cannot log in to your account, use the 'Forgot Password' option "
                "to reset your credentials. An OTP will be sent to your registered email "
                "or phone number. If the OTP is not received, check your spam folder or "
                "ensure that the registered mobile number is correct and active.",
          ),
          _buildTile(
            icon: Icons.edit,
            title: "Profile Update Issues",
            description:
            "If you are unable to update your profile information, try logging out "
                "and logging back in. Occasionally, updates may take a few minutes to reflect. "
                "If the issue persists, clear the application cache from your phone settings "
                "and ensure that you are connected to a reliable internet source.",
          ),
          _buildTile(
            icon: Icons.verified_user,
            title: "Verification Problems",
            description:
            "Verification rejections usually occur due to unclear or mismatched documents. "
                "Ensure that you upload a clear and valid photo or ID proof. "
                "The verification process can take up to 24 hours depending on the queue, "
                "so kindly wait patiently after submitting your documents.",
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          iconColor: AppColors.primaryColor,
          collapsedIconColor: AppColors.primaryColor,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                textAlign: TextAlign.justify, // stylish justified text
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.6, // line spacing
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
