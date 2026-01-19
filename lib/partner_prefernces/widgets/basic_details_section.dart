import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_row.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_section.dart';
import 'package:rishta_app/partner_prefernces/widgets/prefernce_tab.dart';

class BasicDetailsSection extends StatelessWidget {
  const BasicDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferenceSection(
      heading: "Basic Details",
      items: [
        PreferenceRow(
          icon: Icons.calendar_month,
          title: "Age Range",
          value: "18 to 25",
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Prefernce_tab(),
            ),
            );
          }
        ),
        PreferenceRow(
          icon: Icons.height,
          title: "Height Range",
          value: "4'5\" to 4'11\"",
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Prefernce_tab(),
              ),
              );
            }
        ),
        PreferenceRow(
          icon: Icons.people,
          title: "Marital Status",
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
          icon: Icons.child_care,
          title: "Profile with Children",
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
