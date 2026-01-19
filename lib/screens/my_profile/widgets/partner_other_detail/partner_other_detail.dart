import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/partner_other_detail/edit_partner_details.dart';

class PartnerOtherDetail extends StatefulWidget {
  const PartnerOtherDetail({super.key});

  @override
  State<PartnerOtherDetail> createState() => _PartnerOtherDetailState();
}

class _PartnerOtherDetailState extends State<PartnerOtherDetail> {
  Map<String, String> infoItems = {
    "Profile managed by": "Open to All",
    "Diet": "Open to All",
  };

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "Partner Other Details",
      onEdit: () async {
        final updatedData = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditPartnerOtherDetail(initialData: infoItems),
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
