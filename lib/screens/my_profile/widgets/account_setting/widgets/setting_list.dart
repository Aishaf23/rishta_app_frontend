import 'package:flutter/material.dart';
import 'package:rishta_app/screens/my_profile/widgets/account_setting/widgets/app_language.dart';
import 'package:rishta_app/screens/my_profile/widgets/account_setting/widgets/logout.dart' show LogoutTile;
import 'package:rishta_app/screens/my_profile/widgets/account_setting/widgets/notification_tile.dart';
import 'package:rishta_app/screens/my_profile/widgets/account_setting/widgets/setting_tile.dart';

class SettingsList extends StatelessWidget {
  final List<Map<String, dynamic>> settings;
  final bool notificationsEnabled;
  final ValueChanged<bool> onNotificationsChanged;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback onLogout;
  final Function(String title) onItemTap;

  const SettingsList({
    Key? key,
    required this.settings,
    required this.notificationsEnabled,
    required this.onNotificationsChanged,
    required this.selectedLanguage,
    required this.onLanguageChanged,
    required this.onLogout,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: settings.length + 1,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        if (index < settings.length) {
          final item = settings[index];
          final title = item['title'];
          final description = item['description'];

          if (title == 'Notifications') {
            return NotificationTile(
              value: notificationsEnabled,
              onChanged: onNotificationsChanged,
            );
          }

          if (title == 'Language') {
            return LanguageSelectorTile(
              selectedLanguage: selectedLanguage,
              onLanguageSelected: onLanguageChanged,
            );
          }

          return SettingTile(
            title: title,
            description: description,
            onTap: () => onItemTap(title),
          );
        } else {
          return LogoutTile(onLogout: onLogout);
        }
      },
    );
  }
}
