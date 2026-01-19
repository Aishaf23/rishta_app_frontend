import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const SettingTile({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
