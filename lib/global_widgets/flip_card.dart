import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/flip_card_list.dart';
import 'package:swipable_stack/swipable_stack.dart';

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({super.key});

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  final SwipableStackController _controller = SwipableStackController();


  static const _cardMargin =
  EdgeInsets.fromLTRB(23.0, 23.0, 23.0, 58.0);
  static const _cardRadius = 25.0;

  @override
  Widget build(BuildContext context) {
    return SwipableStack(
      controller: _controller,
      itemCount: profiles.length,
      swipeAssistDuration: const Duration(milliseconds: 1000),


      overlayBuilder: (context, properties) {
        final progress = properties.swipeProgress.clamp(0.0, 1.0);
        final direction = properties.direction;

        if (direction == null || progress == 0) {
          return const SizedBox.shrink();
        }

        final isLeft = direction == SwipeDirection.left;
        final color = isLeft
            ? Colors.grey.withOpacity(0.7 * progress)
            : Colors.lightGreen.withOpacity(0.6 * progress);
        final text = isLeft ? "Not Now" : "Connect";


        return Padding(
          padding: _cardMargin,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_cardRadius),
            child: Container(
              alignment: Alignment.center,
              color: color,
              child: Opacity(
                opacity: progress,
                child: const Text(
                  "",
                ),
              ),
            ),
          ),
        );
      },

      onSwipeCompleted: (index, direction) {

      },

      onWillMoveNext: (index, direction) => true,

      builder: (context, properties) {
        final index = properties.index;
        final profile = profiles[index];
        return buildProfileCard(profile);
      },
    );
  }

  Widget buildProfileCard(Map<String, dynamic> profile) {
    return Container(
      margin: _cardMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_cardRadius),
        image: DecorationImage(
          image: NetworkImage(profile["image"]),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [

          if (profile['isPlus'] == true)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.workspace_premium,
                        color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "Plus",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            top: profile['isPlus'] == true ? 44 : 12,
            right: 12,
            child: Column(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.camera_alt,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        profile["photoCount"],
                        style: const TextStyle(
                          color: Colors.white,
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
                      size: 18, color: Colors.white),
                ),
              ],
            ),
          ),


          // Name + meta
          Positioned(
            left: 20,
            bottom: 179,
            child: Row(
              children: [
                Text(
                  profile["name"],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.check_circle,
                    color: Colors.amber, size: 20),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 155,
            child: Text(
              "${profile["age"]}, ${profile["height"]} • ${profile["profession"]}",
              style:
              const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 135,
            child: Text(
              "${profile["language"]} • ${profile["location"]}",
              style:
              const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
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
                    profile["timeAgo"],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 12),
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
                      Icon(Icons.people, size: 14, color: Colors.white),
                      SizedBox(width: 5),
                      Text("You & Her",
                          style: TextStyle(
                              fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom actions
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.next(
                          swipeDirection: SwipeDirection.left,
                        );
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Not Now",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.next(
                          swipeDirection: SwipeDirection.right,
                        );
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Connect",
                        style: TextStyle(color: Colors.white)),
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
