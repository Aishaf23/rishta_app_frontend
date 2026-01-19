import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bar.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bottom_navbar.dart';
import 'package:rishta_app/global_widgets/custom_drawer/custom_drawer.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:rishta_app/screens/matches/widgets/daily_matches/daily_matches.dart';
import 'package:rishta_app/screens/matches/widgets/more_matches/more_matches.dart';
import 'package:rishta_app/screens/matches/widgets/my_matches/my_matches.dart';
import 'package:rishta_app/screens/matches/widgets/near_me_matches/near_me_matches.dart';
import 'package:rishta_app/screens/matches/widgets/new_matches.dart';
import 'package:rishta_app/screens/matches/widgets/search/search.dart';
import 'package:provider/provider.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  final PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 1;

  final List<String> _buttonTitles = const [
    "Search",
    "New (234)",
    "Daily (20)",
    "My Matches (1000+)",
    "Near Me (1500)",
    "More Matches",
  ];

  final List<Widget> _views = [
    Search(),
    const NewMatches(),
    const DailyMatches(),
    MyMatches(),
    NearMeMatches(),
    MoreMatches(),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Matches"),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _buttonTitles.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => _onTabSelected(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        _buttonTitles[index],
                        style: TextStyle(
                          color: isSelected ? AppColors.white : AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: _views,
            ),
          ),
        ],
      ),
    );
  }
}
