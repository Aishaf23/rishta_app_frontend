import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/partner_prefernces/widgets/basic_details_section.dart';
import 'package:rishta_app/partner_prefernces/widgets/community_section.dart' hide BasicDetailsSection;
import 'package:rishta_app/partner_prefernces/widgets/education_career.dart';
import 'package:rishta_app/partner_prefernces/widgets/location.dart';
import 'package:rishta_app/partner_prefernces/widgets/other_details.dart';

class PartnerPreferences extends StatelessWidget {
  const PartnerPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Your Partner Preferences"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "You will see Matches based on the Preferences you have set\n\nTap on the field to edit",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            BasicDetailsSection(),
            SizedBox(height: 16),
            CommunitySection(),
            SizedBox(height: 16,),
            Location(),
            SizedBox(height: 16,),
            EducationCareer(),
            SizedBox(height: 16,),
            OtherDetails(),
          ],
        ),
      ),
    );
  }
}
