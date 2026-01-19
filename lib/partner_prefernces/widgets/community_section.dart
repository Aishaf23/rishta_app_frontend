import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_row.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_section.dart' show PreferenceSection;
import 'package:rishta_app/partner_prefernces/widgets/prefernce_tab.dart';

class CommunitySection extends StatelessWidget {
  const CommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferenceSection(
      heading: "Community",
      items: [
        PreferenceRow(
          icon: Icons.account_balance,
          title: "Religion",
          value: "Muslim",
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Prefernce_tab(),
              ),
              );
            }
        ),
        PreferenceRow(
          icon: Icons.groups,
          title: "Community",
          value: "Open to All",
          onTap: (){
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => Prefernce_tab(),
            ),
            );
          },
        ),
        PreferenceRow(
          icon: Icons.language,
          title: "Mother Tongue",
          value: "Urdu, English",
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
