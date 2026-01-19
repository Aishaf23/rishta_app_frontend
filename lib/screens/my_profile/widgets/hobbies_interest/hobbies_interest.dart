import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'edit_hobbies_interest.dart'; // 🔹 Edit screen import

class HobbiesInterest extends StatefulWidget {
  const HobbiesInterest({super.key});

  @override
  State<HobbiesInterest> createState() => _HobbiesInterestState();
}

class _HobbiesInterestState extends State<HobbiesInterest> {
  Map<String, String> infoItems = {
    "Hobbies & Interests": "Enter Now",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Hobbies & Interests",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditHobbiesInterest(initialData: infoItems),
          ),
        );

        if (updatedData != null && mounted) {
          setState(() {
            infoItems = updatedData;
          });
        }
      },
      infoItems: infoItems,
    );
  }
}
