import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class MatchesFilterBar extends StatefulWidget {
  final List<String> buttonTitles;
  final List<Widget> views;
  final int initialIndex;

  const MatchesFilterBar({
    super.key,
    required this.buttonTitles,
    required this.views,
    this.initialIndex = 0,
  });

  @override
  State<MatchesFilterBar> createState() => _MatchesFilterBarState();
}

class _MatchesFilterBarState extends State<MatchesFilterBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.buttonTitles.length == widget.views.length,
    "Titles and Views list must be of same length.");

    return Column(
      children: [
        const SizedBox(height: 10),

        // 🔁 Filter Buttons Row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 10),

              // ⚡ Flash icon
              const Icon(FontAwesomeIcons.bolt, color: Colors.orange),

              const SizedBox(width: 10),

              // Vertical divider
              Container(
                width: 1,
                height: 25,
                color: Colors.grey.shade400,
              ),

              const SizedBox(width: 10),

              // 🔘 Buttons
              ...List.generate(widget.buttonTitles.length, (index) {
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryColor.withOpacity(0.1)
                            : Colors.transparent,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.buttonTitles[index],
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primaryColor
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              }),

              const SizedBox(width: 10),
            ],
          ),
        ),

        const SizedBox(height: 15),

        // 🧱 Matching View
        Expanded(
          child: widget.views[selectedIndex],
        ),
      ],
    );
  }
}
