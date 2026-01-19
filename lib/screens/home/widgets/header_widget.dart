import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/color/app_color.dart';
import '../../../constants/text/app_text.dart';
import '../../../constants/custom_button.dart';

class HeaderWidget extends StatelessWidget {
  final String imgUrl;
  final String userName;
  final int age;
  final String location;
  final bool isPremium;
  final bool isOnline;
  final String tagline;

  final String likes;
  final String matches;
  final String views;

  const HeaderWidget({
    super.key,
    required this.imgUrl,
    required this.userName,
    required this.age,
    required this.location,
    this.isPremium = false,
    this.isOnline = false,
    this.tagline = '',
    required this.likes,
    required this.matches,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: InwardArchClipper(),
      child: Container(
        height: size.height * 0.35,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          //   gradient:AppColors.Linear_gradient,
          boxShadow: const [
            BoxShadow(
              color: Color(0x33FF9A44),
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            // Avatar & Info Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(imgUrl),
                      backgroundColor: Colors.white,
                    ),
                    if (isOnline)
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "$userName, $age",
                                style: AppText.subheading.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isPremium) ...[
                              const SizedBox(width: 4),
                              const Icon(
                                FontAwesomeIcons.crown,
                                color: Colors.amber,
                                size: 15,
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "Lives in $location",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        if (tagline.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            tagline,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Profile Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(Icons.favorite, "Likes", "120"),
                _StatItem(Icons.person, "Matches", "85"),
                _StatItem(Icons.view_headline, "Views", "2.3k"),
              ],
            ),
            const SizedBox(height: 10),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const _ActionButton(Icons.favorite, 'Like'),
                const _ActionButton(Icons.share, 'Share'),
                if (!isPremium)
                  CustomGradientButton(
                    text: 'Upgrade',
                    textColor: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    isBold: true,
                    icon: Icons.arrow_upward,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable stat widget
/// Reusable stat widget
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem(this.icon, this.value, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Reusable action button
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white24,
          radius: 18,
          child: Icon(icon, color: Colors.white, size: 15),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class InwardArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 30,
        size.width,
        size.height - 40,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
