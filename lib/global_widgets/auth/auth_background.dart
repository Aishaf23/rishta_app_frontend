import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  static const Color mehroon = Color(0xFF800000);

  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            mehroon.withOpacity(0.91),
            mehroon.withOpacity(0.95),
            mehroon.withOpacity(0.98),
            mehroon.withOpacity(0.95),
            mehroon.withOpacity(0.91),
          ],
          stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
      child: child, // 👈 Jo screen ka content hoga wo yahan show hoga
    );
  }
}
