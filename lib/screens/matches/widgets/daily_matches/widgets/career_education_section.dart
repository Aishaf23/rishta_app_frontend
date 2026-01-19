import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/career_info_tile.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/premium_button.dart';

class CareerEducationSection extends StatelessWidget {
  const CareerEducationSection({super.key});

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
              "Career & Education",
              style: AppText.heading,
            ),
            const SizedBox(height: 10),
            const CareerInfoTile(
              icon: Icons.work,
              title: 'Profession',
              description: 'Software Engineer',
            ),
            const CareerInfoTile(
              icon: Icons.business,
              title: 'Company',
              description: 'ABC Tech Pvt Ltd',
            ),
            const CareerInfoTile(
              icon: Icons.school,
              title: 'Highest Qualification',
              description: 'Bachelor in CS',
            ),
            const CareerInfoTile(
              icon: Icons.book,
              title: 'Education Field',
              description: 'Computer Science',
            ),
            const CareerInfoTile(
              icon: Icons.account_balance,
              title: 'College/University',
              description: 'FAST NUCES',
            ),
            const Divider(thickness: 1, height: 24),
            Text(
              "To unlock full education history",
              style: AppText.caption.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 8),
            const PremiumButton(),
          ],
        ),
      ),
    );
  }
}
