import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_list.dart';
import 'package:rishta_app/screens/matches/widgets/match_card.dart';
import 'package:swipable_stack/swipable_stack.dart';


class MatchListSection extends StatelessWidget {
  final SwipableStackController controller;
  final int? startIndex;
  final int? count;

  const MatchListSection({
    super.key,
    required this.controller,
    this.startIndex,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    final totalProfiles = profiles.length;
    final itemCount = count ?? totalProfiles;

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 0, top: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final profile = profiles[
        (index + (startIndex ?? 0)) % totalProfiles
        ];
        return SizedBox(
          height: 530,
          child: MatchCard(
            profile: profile,
          ),
        );
      },
    );
  }
}
