import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheetContent extends StatelessWidget {
  final String title;

  const CustomBottomSheetContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppText.heading.copyWith(fontSize: 18.sp)),
          SizedBox(height: 16),
          Text(
            "Here you can add custom content for the $title section. For now, it is just a placeholder.",
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
