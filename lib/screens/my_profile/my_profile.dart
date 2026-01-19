import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/screens/my_profile/widgets/basic-info/basic_info.dart';
import 'package:rishta_app/screens/my_profile/widgets/family/family.dart';
import 'package:rishta_app/screens/my_profile/widgets/hobbies_interest/hobbies_interest.dart';
import 'package:rishta_app/screens/my_profile/widgets/lifestyle/lifestyle.dart';
import 'package:rishta_app/screens/my_profile/widgets/location_education_career/location_education_career.dart';
import 'package:rishta_app/screens/my_profile/widgets/more_about/more_about.dart';
import 'package:rishta_app/screens/my_profile/widgets/more_religion_details/more_religion_details.dart';
import 'package:rishta_app/screens/my_profile/widgets/partner_basic_info/partner_basic_info.dart';
import 'package:rishta_app/screens/my_profile/widgets/partner_education_career/partner_education_career.dart';
import 'package:rishta_app/screens/my_profile/widgets/partner_location_detail/partner_location_detail.dart';
import 'package:rishta_app/screens/my_profile/widgets/partner_other_detail/partner_other_detail.dart';
import 'package:rishta_app/screens/my_profile/widgets/religious_background/religious_background.dart';
import 'package:rishta_app/screens/my_profile/widgets/upload_profile_image/upload_profile_image.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ProfileImagePicker(onImagePicked: (File p1) {},),
            SizedBox(height: 5,),
            Center(child: Text("Upload Profile Image",
            style: TextStyle(fontWeight: FontWeight.bold),)),
            const SizedBox(height: 20,),
            const BasicInfo(),
            const SizedBox(height: 10,),
            const MoreAbout(),
            const SizedBox(height: 10,),
            const ReligiousBackground(),
            const SizedBox(height: 10,),
            const Family(),
            const SizedBox(height: 10,),
            const MoreReligionDetails(),
            const SizedBox(height: 10,),
            const LocationEducationCareer(),
            const SizedBox(height: 10,),
            const Lifestyle(),
            const SizedBox(height: 10,),
            const HobbiesInterest(),
            const SizedBox(height: 10,),
            const PartnerBasicInfo(),
            const SizedBox(height: 10,),
            const PartnerLocationDetail(),
            const SizedBox(height: 10,),
            const PartnerEducationCareer(),
            const SizedBox(height: 10,),
            const PartnerOtherDetail(),
          ],
        ),
      ),
    );

  }
}
