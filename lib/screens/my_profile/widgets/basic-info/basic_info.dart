import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/basic-info/edit_basic_info.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  Map<String, String> infoItems = {
    "Posted by": "Friend",
    "Gender": "Male",
    "Marital Status": "Never Married",
    "Children": "No",
    "Height": "4'8 (142cm)",
    "Any Disability": "None",
    "Health Information": "Not Specified",
    "Blood Group": "Select",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Basic Info",
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditBasicInfo(initialData: infoItems),
          ),
        ).then((updatedData) {
          if (updatedData != null) {
            setState(() {
              infoItems = Map<String, String>.from(updatedData);
            });
          }
        });
      },
      infoItems: infoItems,
    );
  }
}
