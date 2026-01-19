import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/basic_details_section.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/career_education_section.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/contact_info_section.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/hobbies_section.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/you_and_her_section.dart';
import 'package:rishta_app/screens/matches/widgets/flip_card.dart';

class DailyMatches extends StatefulWidget {
  const DailyMatches({super.key});

  @override
  State<DailyMatches> createState() => _DailyMatchesState();
}

class _DailyMatchesState extends State<DailyMatches> {
  bool _showFullDescription = false;

  final String description = "I am an open-minded and respectful individual who believes in growing"
      " together as friends. I value communication, space, and understanding in a relationship. "
      "Looking for someone who is kind, mature, and ready to build a strong bond based on trust.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: const FlipCardWidget(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                    bottom: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ayesha", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      maxLines: _showFullDescription ? 7 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showFullDescription = !_showFullDescription;
                        });
                      },
                      child: Center(
                        child: Text(
                          _showFullDescription ? "View Less" : "View More",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const BasicDetailsSection(),
            const SizedBox(height: 20),
            const ContactInfoSection(),
            const SizedBox(height: 20),
            const HobbiesSection(),
            const SizedBox(height: 20),
            const CareerEducationSection(),
            const SizedBox(height: 20),
            const YouAndHerSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
