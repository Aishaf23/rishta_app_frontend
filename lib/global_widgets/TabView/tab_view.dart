import 'package:flutter/material.dart';

enum TabStyle { chips, underline }

class CustomTabView extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> views;
  final Color selectedColor;
  final Color unselectedColor;
  final int initialIndex;
  final TabStyle tabStyle;

  const CustomTabView({
    super.key,
    required this.tabTitles,
    required this.views,
    this.selectedColor = const Color(0xFF6200EE),
    this.unselectedColor = const Color(0xFFE0E0E0),
    this.initialIndex = 0,
    this.tabStyle = TabStyle.chips, // default to chip style
  }) : assert(tabTitles.length == views.length,
  "tabTitles and views must have the same length");

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  late int _selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildTabBar() {
    if (widget.tabStyle == TabStyle.chips) {
      //  Chip Style Tabs
      return SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.tabTitles.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => _onTabSelected(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? widget.selectedColor
                      : widget.unselectedColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    widget.tabTitles[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      //  Underline Style Tabs
      return
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.tabTitles.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => _onTabSelected(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.tabTitles[index],
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 2,
                        width: isSelected ? 30 : 0,
                        color: isSelected ? Colors.black : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),

        // Tab Views
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: widget.views,
          ),
        ),
      ],
    );
  }
}
