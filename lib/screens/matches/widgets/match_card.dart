import 'package:flutter/material.dart';
import '../../../constants/color/app_color.dart';
import '../../../model/profile_model.dart';

class MatchCard extends StatelessWidget {
  final Profile profile;

  static const _cardRadius = 25.0;
  static const _cardMargin = EdgeInsets.fromLTRB(13.0, 13.0, 13.0, 13.0);

  const MatchCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _cardMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_cardRadius),
        image: DecorationImage(
          image: NetworkImage(profile.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 🔹 Premium Badge
          if (profile.isPlus)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.workspace_premium,
                        color: AppColors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "Plus",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // 🔹 Photo count + more button
          Positioned(
            top: profile.isPlus ? 44 : 12,
            right: 12,
            child: Column(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.camera_alt,
                          color: AppColors.white, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        profile.photoCount,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.more_horiz,
                      size: 18, color: AppColors.white),
                ),
              ],
            ),
          ),

          // 🔹 Name + age + profession
          Positioned(
            left: 20,
            bottom: 179,
            child: Row(
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.check_circle,
                    color: AppColors.amber, size: 20),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 155,
            child: Text(
              "${profile.age}, ${profile.height} • ${profile.profession}",
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 135,
            child: Text(
              "${profile.language} • ${profile.location}",
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),

          // 🔹 Time + common tag
          Positioned(
            left: 20,
            bottom: 98,
            child: Row(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    profile.timeAgo,
                    style:
                    const TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.people, size: 14, color: AppColors.white),
                      SizedBox(width: 5),
                      Text("You & Her",
                          style:
                          TextStyle(fontSize: 12, color: AppColors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Bottom buttons (static — no swiping)
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.close, color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    const Text("Not Now",
                        style: TextStyle(color: AppColors.white)),
                  ],
                ),
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.success,
                      child: Icon(Icons.check, color: AppColors.white),
                    ),
                    const SizedBox(height: 4),
                    const Text("Connect",
                        style: TextStyle(color: AppColors.white)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
