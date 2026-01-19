import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationTile({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Notifications'),
      subtitle: const Text('Enable or disable notifications'),
      value: value,
      onChanged: onChanged,
      secondary: const Icon(Icons.notifications),
    );
  }
}
