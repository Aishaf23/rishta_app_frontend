import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'edit_partner_basic_info.dart'; // 🔹 Edit screen import

class PartnerBasicInfo extends StatefulWidget {
  const PartnerBasicInfo({super.key});

  @override
  State<PartnerBasicInfo> createState() => _PartnerBasicInfoState();
}

class _PartnerBasicInfoState extends State<PartnerBasicInfo> {
  Map<String, String> infoItems = {
    "Age": "Not Specified",
    "Height": "Not Specified",
    "Marital Status": "Open to All",
    "Children": "Open to All",
    "Religion / Community": "Muslim",
    "Mother Tongue": "Not Specified",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Partner Basic Info",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditPartnerBasicInfo(initialData: infoItems),
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
