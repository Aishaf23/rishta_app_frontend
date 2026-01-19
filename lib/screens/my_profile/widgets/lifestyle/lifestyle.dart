import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'edit_lifestyle.dart';

class Lifestyle extends StatefulWidget {
  const Lifestyle({super.key});

  @override
  State<Lifestyle> createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {
  Map<String, String> lifestyleData = {
    "Diet": "Not Specified",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Lifestyle",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditLifestyle(initialData: lifestyleData),
          ),
        );

        if (updatedData != null) {
          setState(() {
            lifestyleData = updatedData;
          });
        }
      },
      infoItems: lifestyleData,
    );
  }
}
