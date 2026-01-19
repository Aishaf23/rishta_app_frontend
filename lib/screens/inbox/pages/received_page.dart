import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../../constants/color/app_color.dart';
import '../../../global_widgets/Swipeable_stack/flip_widget.dart';
import '../../../global_widgets/profile_list.dart';
import '../../../global_widgets/Swipeable_stack/instruction_header.dart';
import '../../../model/profile_model.dart';
import '../../filter/filter_page.dart';
import '../widgets/flip_ib_card.dart';

class ReceivedPage extends StatelessWidget {
  final int requests;
  final SwipableStackController controller;

  const ReceivedPage({
    super.key,
    required this.requests,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filtered out requests ($requests)"),
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FilterPage()),
                    );
                  },
                  icon: const Icon(Icons.filter_alt),
                ),
              ],
            ),
          ),
      
          const InstructionHeader(
            text: "Swipe right if you like, left if you want to skip!",
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 480,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableSwipeStack(
                  list: profiles,
                  cardBuilder: (profile) {
                    return FlipIbCard(
                      profile: profile,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
