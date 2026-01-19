import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isBold;
  final double borderRadius;
  final IconData? icon;
  final bool iconOnRight;
  final Color textColor;  // Text color
  final Color backgroundColor;  // Background color

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isBold = true,
    this.borderRadius = 30,
    this.icon,
    this.iconOnRight = false,
    required this.textColor,  // Make textColor required
    required this.backgroundColor,  // Make backgroundColor required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,  // Use the passed background color
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && !iconOnRight) ...[
              Icon(icon, color: textColor, size: 16),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,  // Use the passed text color
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
                fontSize: 15,
              ),
            ),
            if (icon != null && iconOnRight) ...[
              const SizedBox(width: 8),
              Icon(icon, color: textColor, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
