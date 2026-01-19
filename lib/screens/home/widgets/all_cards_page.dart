import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bar.dart';
import 'package:rishta_app/global_widgets/custom_drawer/custom_drawer.dart';

import '../../../global_widgets/profile_list.dart';
import '../../matches/widgets/match_card.dart';
import 'package:swipable_stack/swipable_stack.dart';

class AllCardsPage extends StatelessWidget {
  final String title;

  AllCardsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 0, top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            final profile = profiles;
            return SizedBox(
              height: 530,
              child: MatchCard(profile: profile[index]),
            );
          },
        ),
      ),
    );
  }
}
