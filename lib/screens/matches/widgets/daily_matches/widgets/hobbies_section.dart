import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/you_her_icon_tag.dart';

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hobbies & Interests",
              style: AppText.heading,
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                YouHerIconTag("Writing", Icons.edit),
                YouHerIconTag("Reading", Icons.menu_book),
                YouHerIconTag("Working Out", Icons.fitness_center),
                YouHerIconTag("Fashion & Beauty", Icons.style),
                YouHerIconTag("Photography", Icons.camera_alt),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
