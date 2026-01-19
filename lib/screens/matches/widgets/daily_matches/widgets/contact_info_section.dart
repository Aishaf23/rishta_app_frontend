import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/career_info_tile.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/premium_button.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Info",
              style: AppText.heading,
            ),
            const SizedBox(height: 10),
            const CareerInfoTile(
              icon: Icons.phone,
              title: "Phone Number",
              description: "+92 300 1234567",
            ),
            const CareerInfoTile(
              icon: Icons.email,
              title: "Email Address",
              description: "example@mail.com",
            ),
            const Divider(thickness: 1, height: 24),
            Text(
              "To unlock more contact details",
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


