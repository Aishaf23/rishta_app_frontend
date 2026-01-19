import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/family/edit_family.dart';

class Family extends StatefulWidget {
  const Family({super.key});

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  Map<String, String> infoItems = {
    "Mother's Detail": "Enter Now",
    "Father's Detail": "Enter Now",
    "No. of Sisters": "0",
    "No. of Brothers": "0",
    "Family Financial Status": "Not Specified",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Family",
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditFamily(initialData: infoItems),
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
