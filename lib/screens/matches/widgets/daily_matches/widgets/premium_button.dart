import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/premium/premium_page.dart';

class PremiumButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PremiumButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed ?? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PremiumPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Go Premium Now",
          style: AppText.button.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
