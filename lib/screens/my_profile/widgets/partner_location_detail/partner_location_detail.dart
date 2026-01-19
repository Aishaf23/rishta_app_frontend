import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'edit_partner_location_detail.dart'; // 🔹 Edit screen import

class PartnerLocationDetail extends StatefulWidget {
  const PartnerLocationDetail({super.key});

  @override
  State<PartnerLocationDetail> createState() => _PartnerLocationDetailState();
}

class _PartnerLocationDetailState extends State<PartnerLocationDetail> {
  Map<String, String> infoItems = {
    "Country living in": "Not Specified",
    "State / living in": "Open to All",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Partner Location Details",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditPartnerLocationDetail(initialData: infoItems),
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
