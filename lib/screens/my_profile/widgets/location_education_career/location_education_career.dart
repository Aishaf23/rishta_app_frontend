import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/location_education_career/edit_location_education_career.dart';

class LocationEducationCareer extends StatefulWidget {
  const LocationEducationCareer({super.key});

  @override
  State<LocationEducationCareer> createState() => _LocationEducationCareerState();
}

class _LocationEducationCareerState extends State<LocationEducationCareer> {
  Map<String, String> lecData = {
    "Country Living in": "Pakistan",
    "State Living in": "Punjab",
    "City Living in": "Other",
    "Residency Status": "Citizen",
    "Zip / Pin code": "Not Specified",
    "Grew up in": "Pakistan",
    "Highest Qualification": "Other",
    "College(s) Attented": "Enter Now",
    "Working with": "Non Working",
    "Working As": "Non Working",
    "Annual income": "Not applicable",
    "Employer Name": "Enter Now",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Location, Education & Career",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditLocationEducationCareer(initialData: lecData),
          ),
        );

        if (updatedData != null) {
          setState(() {
            lecData = updatedData;
          });
        }
      },
      infoItems: lecData,
    );
  }
}
