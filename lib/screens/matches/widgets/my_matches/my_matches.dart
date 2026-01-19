import 'package:flutter/material.dart';
import 'package:rishta_app/screens/matches/widgets/my_matches/widgets/match_list_section.dart';
import 'package:rishta_app/global_widgets/premium_banner.dart';
import 'package:rishta_app/screens/matches/widgets/my_matches/widgets/top_profiles_list.dart';
import 'package:swipable_stack/swipable_stack.dart';

class MyMatches extends StatelessWidget {
  MyMatches({super.key});

  final SwipableStackController _controller = SwipableStackController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopProfilesList(),
          MatchListSection(
            controller: _controller,
            startIndex: 0,
            count: 3,
          ),
          const PremiumBanner(),

          MatchListSection(
            controller: _controller,
            startIndex: 1,
            count: 3,
          ),
        ],
      ),
    );
  }
}
