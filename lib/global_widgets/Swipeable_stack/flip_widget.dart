import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

import '../../model/profile_model.dart';

class ReusableSwipeStack extends StatelessWidget {
  final List<Profile> list;
  final Widget Function(Profile profile) cardBuilder;

  ReusableSwipeStack({
    super.key,
    required this.list,
    required this.cardBuilder,
  });

  final SwipableStackController _controller = SwipableStackController();

  static const _cardMargin = EdgeInsets.fromLTRB(23.0, 23.0, 23.0, 58.0);
  static const _cardRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    return SwipableStack(
      controller: _controller,
      itemCount: list.length,
      swipeAssistDuration: const Duration(milliseconds: 300),
      detectableSwipeDirections: const {
        SwipeDirection.right,
        SwipeDirection.left,
      },
      allowVerticalSwipe: false,
      stackClipBehaviour: Clip.none,
      builder: (context, properties) {
        final index = properties.index;
        final profile = list[index];

        // shift stacked cards slightly
        final visibleIndex = (list.length - index - 1).clamp(0, 5);

        return Transform.translate(
          offset: Offset(0, visibleIndex * 10), // stack depth effect
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: cardBuilder(profile),
            ),
          ),
        );
      },
      overlayBuilder: (context, properties) {
        final progress = properties.swipeProgress.clamp(0.0, 1.0);
        final direction = properties.direction;
        if (direction == null || progress == 0) {
          return const SizedBox.shrink();
        }

        final isLeft = direction == SwipeDirection.left;
        final color = isLeft
            ? Colors.red.withOpacity(0.4 * progress)
            : Colors.green.withOpacity(0.4 * progress);

        return Padding(
          padding: _cardMargin,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_cardRadius),
            child: Container(
              alignment: Alignment.center,
              color: color,
              child: Opacity(
                opacity: progress,
                child: Text(
                  isLeft ? "NOPE" : "LIKE",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
