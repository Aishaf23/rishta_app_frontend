import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/custom_drawer/widgets/app_rating.dart';
import 'package:rishta_app/global_widgets/custom_drawer/widgets/bottam_sheet.dart';
import 'package:rishta_app/global_widgets/custom_drawer/widgets/drawer_header_widget.dart';
import 'package:rishta_app/global_widgets/custom_drawer/widgets/drawer_tile.dart';
import 'package:rishta_app/partner_prefernces/partner_prefences.dart';
import 'package:rishta_app/screens/chats/chats_page.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:rishta_app/screens/inbox/inbox_page.dart';
import 'package:rishta_app/screens/matches/matches_page.dart';
import 'package:rishta_app/screens/my_profile/my_profile.dart';
import 'package:rishta_app/screens/my_profile/widgets/account_setting/account_setting.dart';
import 'package:rishta_app/screens/my_profile/widgets/help_and_support/help_and_support.dart';
import 'package:rishta_app/screens/premium/premium_page.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _navigate(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 250),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return title == 'Rate the App'
            ? RatingWidget()
            : CustomBottomSheetContent(title: title);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width - 60,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DrawerHeaderWidget(),
          const SizedBox(height: 8),

          DrawerTile(
            icon: Icons.edit_note,
            title: 'View and Edit Your Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              );
            },
          ),
          DrawerTile(
            icon: Icons.download_outlined,
            title: 'Download and Share Profile',
            onTap: () {
              _showBottomSheet(context, 'Download and Share Profile');
            },
          ),
          DrawerTile(
            icon: Icons.upload,
            title: 'Upgrade to Premium',
            onTap: () {
              Provider.of<DashboardProvider>(
                context,
                listen: false,
              ).updateSelectedIndex(4);

              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
                (route) => false,
              );
            },
          ),

          const SizedBox(height: 12),
          Text(
            "Discover Your Matches",
            style: AppText.subheading.copyWith(fontSize: 13.sp),
          ),
          SizedBox(height: 4),
          DrawerTile(
            icon: Icons.person_search_outlined,
            title: 'Matches',
            onTap: () {
              Provider.of<DashboardProvider>(
                context,
                listen: false,
              ).updateSelectedIndex(1);

              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
                (route) => false,
              );
            },
          ),
          DrawerTile(
            icon: Icons.email_outlined,
            title: 'Inbox',
            onTap: () {
              Provider.of<DashboardProvider>(
                context,
                listen: false,
              ).updateSelectedIndex(2);

              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
                (route) => false,
              );
            },
          ),
          DrawerTile(
            icon: Icons.messenger_outline_rounded,
            title: 'Chat',
            onTap: () {
              Provider.of<DashboardProvider>(
                context,
                listen: false,
              ).updateSelectedIndex(3);

              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
                (route) => false,
              );
            },
          ),
          const SizedBox(height: 12),
          Text(
            "Options & Settings",
            style: AppText.subheading.copyWith(fontSize: 13.sp),
          ),
          SizedBox(height: 4),
          DrawerTile(
            icon: Icons.perm_contact_cal_outlined,
            title: 'Partner Preferences',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PartnerPreferences()),
              );
            },
          ),
          DrawerTile(
            icon: Icons.filter_alt,
            title: 'Contact Filter',
            onTap: () {
              _showBottomSheet(context, 'Contact Filter');
            },
          ),
          DrawerTile(
            icon: Icons.settings,
            title: 'Account Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSetting()),
              );
            },
          ),
          DrawerTile(
            icon: Icons.support_agent,
            title: 'Help & Support',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpAndSupport()),
              );
            },
          ),
          DrawerTile(
            icon: Icons.fact_check_outlined,
            title: 'Be Safe Online',
            onTap: () {
              _showBottomSheet(context, 'Be Safe Online');
            },
          ),
          DrawerTile(
            icon: Icons.thumb_up_alt_outlined,
            title: 'Rate the App',
            onTap: () {
              _showBottomSheet(context, 'Rate the App');
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Terms & Conditions\n",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  const TextSpan(
                    text: "Copyright 2025-present Rishta.com\nVersion 0.0.1",
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
