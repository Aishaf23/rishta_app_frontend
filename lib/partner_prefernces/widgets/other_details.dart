import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_row.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_section.dart';
import 'package:rishta_app/partner_prefernces/widgets/prefernce_tab.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferenceSection(
      heading: "Other Details",
      items: [
        PreferenceRow(
          icon: Icons.person,
          title: "Profile Managed by",
          value: "Open to All",
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Prefernce_tab(),
              ),
              );
            }
        ),
        PreferenceRow(
          icon: Icons.cake,
          title: "Diet",
          value: "Open to All",
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Prefernce_tab(),
              ),
              );
            }
        ),
      ],
    );
  }
}
