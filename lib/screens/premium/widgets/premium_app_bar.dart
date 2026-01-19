import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart' show AppColors;

class PremiumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PremiumAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: const Text(
        "Upgrade to Premium",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text("Skip",
              style: TextStyle(color: AppColors.white, fontSize: 16)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
