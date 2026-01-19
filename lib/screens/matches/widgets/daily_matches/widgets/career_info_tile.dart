import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';

class CareerInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const CareerInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
      leading: Icon(icon, color: AppColors.primaryColor, size: 20),
      title: Text(
        title,
        style: AppText.caption.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        description,
        style: AppText.caption.copyWith(color: Colors.black54),
      ),
    );
  }
}
