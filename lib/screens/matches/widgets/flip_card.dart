import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/Swipeable_stack/instruction_header.dart';
import 'package:rishta_app/screens/matches/widgets/match_card.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../../../constants/color/app_color.dart';
import '../../../global_widgets/Swipeable_stack/flip_widget.dart';
import '../../../global_widgets/profile_list.dart';

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  final SwipableStackController _controller = SwipableStackController();

  static const _cardMargin = EdgeInsets.fromLTRB(23.0, 23.0, 23.0, 58.0);
  static const _cardRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InstructionHeader(
          text: "Swipe right if you like, left if you want to skip!",
        ),
        Expanded(
          child: ReusableSwipeStack(
            list: profiles,
            cardBuilder: (profile) {
              return MatchCard(profile: profile, );
            },
          ),

        ),
      ],
    );
  }
}
