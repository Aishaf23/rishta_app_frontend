import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/screens/my_profile/my_profile.dart';
import 'package:rishta_app/screens/my_profile/widgets/account_setting/widgets/setting_list.dart';
import 'package:rishta_app/screens/my_profile/widgets/help_and_support/help_and_support.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';

  void _onLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  void _showPopup(String title, String description) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handleItemTap(String title) {
    switch (title) {
      case 'Profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyProfile()),
        );
        break;
      case 'Help & Support':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelpAndSupport()),
        );
        break;
      case 'Appearance':
        _showPopup(
          'Appearance',
          'Switch between Light and Dark themes.\n'
              'Dark theme is easier on the eyes at night, while Light theme is recommended during the day.',
        );
        break;
      case 'Privacy':
        _showPopup(
          'Privacy',
          'Manage your privacy preferences:\n'
              '- Control who can view your profile\n'
              '- Hide your last seen activity\n'
              '- Manage blocked users',
        );
        break;
      case 'Security':
        _showPopup(
          'Security',
          'Secure your account:\n'
              '- Change your password regularly\n'
              '- Enable Two-Factor Authentication (2FA)\n'
              '- Get alerts for suspicious login attempts',
        );
        break;
      case 'About App':
        _showPopup(
          'About Rishta App',
          'Rishta App v1.0.0\n\n'
              'Rishta App helps you connect with potential matches securely and easily.\n'
              'Developed with ❤️ to simplify the way people find their life partner.\n\n'
              '© 2025 Rishta App. All rights reserved.',
        );
        break;
      default:
        _showPopup(title, 'You tapped on $title');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settings = [
      {
        'title': 'Profile',
        'description': 'Edit your profile',
      },
      {
        'title': 'Notifications',
        'description': 'Enable or disable notifications',
      },
      {
        'title': 'Privacy',
        'description': 'Manage your privacy preferences',
      },
      {
        'title': 'Security',
        'description': 'Protect your account and data',
      },
      {
        'title': 'Language',
        'description': 'Choose app language',
      },
      {
        'title': 'Appearance',
        'description': 'Switch between light or dark theme',
      },
      {
        'title': 'Help & Support',
        'description': 'FAQs and contact support',
      },
      {
        'title': 'About App',
        'description': 'Version info and app details',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account Setting",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SettingsList(
        settings: settings,
        notificationsEnabled: _notificationsEnabled,
        onNotificationsChanged: (val) {
          setState(() => _notificationsEnabled = val);
        },
        selectedLanguage: _selectedLanguage,
        onLanguageChanged: (lang) {
          setState(() => _selectedLanguage = lang);
        },
        onLogout: () => _onLogout(context),
        onItemTap: _handleItemTap,
      ),
    );
  }
}
