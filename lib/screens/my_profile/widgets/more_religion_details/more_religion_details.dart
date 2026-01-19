import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/more_religion_details/edit_more_religion_details.dart';

class MoreReligionDetails extends StatefulWidget {
  const MoreReligionDetails({super.key});

  @override
  State<MoreReligionDetails> createState() => _MoreReligionDetailsState();
}

class _MoreReligionDetailsState extends State<MoreReligionDetails> {
  Map<String, String> infoItems = {
    "Namaz / Salaah": "Not Specified",
    "Zakaat": "Not Specified",
    "Fasting in Ramadan": "Not Specified",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "More Religion Details",
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                EditMoreReligionDetails(initialData: infoItems),
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
