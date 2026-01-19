import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'edit_partner_education_career.dart';

class PartnerEducationCareer extends StatefulWidget {
  const PartnerEducationCareer({super.key});

  @override
  State<PartnerEducationCareer> createState() => _PartnerEducationCareerState();
}

class _PartnerEducationCareerState extends State<PartnerEducationCareer> {
  Map<String, String> infoItems = {
    "Qualification": "Open to All",
    "Working with": "Open to All",
    "Profession area": "Open to All",
    "Working as": "Open to All",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Partner Education & Career",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                EditPartnerEducationCareer(initialData: infoItems),
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
