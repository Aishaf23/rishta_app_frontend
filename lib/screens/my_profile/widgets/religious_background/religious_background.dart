import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/religious_background/edit_religious_background.dart';

class ReligiousBackground extends StatefulWidget {
  const ReligiousBackground({super.key});

  @override
  State<ReligiousBackground> createState() => _ReligiousBackgroundState();
}

class _ReligiousBackgroundState extends State<ReligiousBackground> {
  Map<String, String> infoItems = {
    "Religion": "Muslim",
    "Mother Tongue": "Urdu",
    "Community": "Arain",
    "Sub Community": "Not Specified",
    "Caste No Bar": "Yes",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Religious Background",
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditReligiousBackground(initialData: infoItems),
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
