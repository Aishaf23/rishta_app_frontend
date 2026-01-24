import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart' show AppColors;
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const DrawerTile({required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.fromLTRB(4, 2, 4, 2),
      leading: Icon(icon, color: AppColors.primaryColor, size: 22),
      title: Text(title, style: AppText.body.copyWith(fontSize: 13.sp)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 13),
      onTap: onTap,
    );
  }
}
