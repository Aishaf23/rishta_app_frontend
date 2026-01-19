import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_row.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_section.dart';
import 'package:rishta_app/partner_prefernces/widgets/prefernce_tab.dart';

class EducationCareer extends StatelessWidget {
  const EducationCareer({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferenceSection(
      heading: "Education & Career",
      items: [
        PreferenceRow(
          icon: Icons.school,
          title: "Qualification",
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
          icon: Icons.work,
          title: "Working with",
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
          icon: Icons.home_work_outlined,
          title: "Profession",
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
          icon: Icons.currency_rupee,
          title: "Annual income",
          value: "PKR below 1 lakh to 20 lakhs",
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
