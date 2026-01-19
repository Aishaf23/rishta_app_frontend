import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_row.dart';
import 'package:rishta_app/global_widgets/profile_card/preference_section.dart';
import 'package:rishta_app/partner_prefernces/widgets/prefernce_tab.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return  PreferenceSection(
      heading: "Location",
      items: [
        PreferenceRow(
          icon: Icons.location_on_outlined,
          title: "Country living in",
          value: "Bahrain, Bangladesh, Iraq, Pakistan, Qatar,Saudi Arabia,UAE",
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => Prefernce_tab(),
              ),
              );
            }
        ),
        PreferenceRow(
          icon: Icons.location_on_outlined,
          title: "State living in",
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
