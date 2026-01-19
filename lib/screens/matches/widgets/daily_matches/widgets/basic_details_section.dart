import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/career_info_tile.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/premium_button.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/tag_chip.dart';

class BasicDetailsSection extends StatelessWidget {
  const BasicDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Basic Details', style: AppText.heading),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: const [
                TagChip("Managed by Friend"),
                TagChip("ID: 12345"),
                TagChip("20 yrs old"),
                TagChip("Height - 4'11"),
              ],
            ),
            const SizedBox(height: 10),
            const CareerInfoTile(
              icon: Icons.cake,
              title: "Birth Date",
              description: "Jan 01, 2005",
            ),
            const CareerInfoTile(
              icon: Icons.favorite,
              title: "Marital Status",
              description: "Single",
            ),
            const CareerInfoTile(
              icon: Icons.location_on,
              title: "Lives In",
              description: "Lahore, PK",
            ),
            const CareerInfoTile(
              icon: Icons.home,
              title: "Grew up in",
              description: "Karachi, PK",
            ),
            const CareerInfoTile(
              icon: Icons.account_balance,
              title: "Religion & Mother Tongue",
              description: "Islam, Urdu",
            ),
            const CareerInfoTile(
              icon: Icons.people,
              title: "Community",
              description: "Punjabi",
            ),
            const CareerInfoTile(
              icon: Icons.restaurant,
              title: "Diet Preferences",
              description: "Vegetarian",
            ),
            const Divider(thickness: 1, height: 24),
            Text(
              "To unlock birth date",
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
