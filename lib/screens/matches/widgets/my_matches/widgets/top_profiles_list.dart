import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart' show AppText;
import 'package:rishta_app/global_widgets/profile_list.dart';
import 'package:rishta_app/model/profile_model.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/widgets/tag_chip.dart';

class TopProfilesList extends StatelessWidget {
  const TopProfilesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ProfileCardContainer(
            child: ProfileDetails(profile: profile),
            isPlus: profile.isPlus,
          );
        },
      ),
    );
  }
}

class ProfileCardContainer extends StatelessWidget {
  final Widget child;
  final bool isPlus;

  const ProfileCardContainer({
    super.key,
    required this.child,
    this.isPlus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 170,
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: child,
        ),

        if (isPlus)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.workspace_premium,
                      size: 12, color: Colors.white),
                  const SizedBox(width: 3),
                  Text(
                    "Plus",
                    style: AppText.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final Profile profile;

  const ProfileDetails({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 38,
          backgroundImage: NetworkImage(profile.image),
        ),
        const SizedBox(height: 4),
        Text(
          profile.name,
          style: AppText.button,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          "${profile.age} • ${profile.height} • ${profile.language}",
          textAlign: TextAlign.center,
          style: AppText.caption,
        ),
        const SizedBox(height: 2),
        Text(
          profile.location,
          textAlign: TextAlign.center,
          style: AppText.caption,
        ),
        const SizedBox(height: 10),
        const TagChip("Continue"),
      ],
    );
  }
}
