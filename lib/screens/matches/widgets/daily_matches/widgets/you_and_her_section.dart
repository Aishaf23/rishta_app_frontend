import 'package:flutter/material.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/career_info_tile.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/tag_chip.dart';

class YouAndHerSection extends StatelessWidget {
  const YouAndHerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You and Her",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                    SizedBox(height: 6),
                    Text("You"),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/men.png"),
                    ),
                    SizedBox(height: 6),
                    Text("Match"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "You match 4/6 of the preferences",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                TagChip("Age: 21 to 28"),
                TagChip("Religion / Community"),
                TagChip("Mother Tongue"),
                TagChip("Country Living In"),
                TagChip("Height"),
                TagChip("Annual Income"),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1, height: 24),
            const Text(
              "Common Between The Both Of You",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const CareerInfoTile(
              icon: Icons.location_on,
              title: 'Lives In',
              description: 'Pakistan',
            ),
            const CareerInfoTile(
              icon: Icons.language,
              title: "Community",
              description: "Both are from Urdu Community",
            ),
          ],
        ),
      ),
    );
  }
}
