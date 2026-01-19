import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bottom_navbar.dart';
import '../../constants/color/app_color.dart';
import '../chats/chats_page.dart';
import '../home/home_page.dart';
import '../inbox/inbox_page.dart';
import '../matches/matches_page.dart';
import '../premium/premium_page.dart';
import 'provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static final List<Widget> _pages = [
    HomePage(),
    MatchesPage(),
    InboxPage(),
    ChatsPage(),
    PremiumPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, _) {
        final selectedIndex = dashboardProvider.selectedIndex;

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: AppBottomNavbar(
            currentIndex: selectedIndex,
            onTap: (index) => dashboardProvider.updateSelectedIndex(index),
          ),
        );
      },
    );
  }
}
