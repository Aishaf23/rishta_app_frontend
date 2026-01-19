import 'package:flutter/material.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutTile({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Logout',
        style: TextStyle(color: Colors.red),
      ),
      leading: const Icon(Icons.logout, color: Colors.red),
      onTap: onLogout,
    );
  }
}
