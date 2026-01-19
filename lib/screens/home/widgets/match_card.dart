import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import '';

class MatchCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int age;
  final String height;
  final String language;
  final String location;

  const MatchCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.age,
    required this.height,
    required this.language,
    required this.location,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.Linear_gradient,
        ),
        child: Container(
          margin: const EdgeInsets.all(3), // border thickness
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // 🔹 Image
                Image.asset(
                  imagePath,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // 🔹 Gradient overlay
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(120, 252, 96, 118),
                      ],
                    ),
                  ),
                ),

                // 🔹 Location badge
                Positioned(
                  top: 0,
                  left: 30,
                  child: _LocationBadge(location: location),
                ),

                // 🔹 Info text (bottom)
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "$name, $age",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "$height | $language",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Extracted reusable location badge
class _LocationBadge extends StatelessWidget {
  final String location;
  const _LocationBadge({required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        gradient: AppColors.Linear_gradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Text(
        location,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
