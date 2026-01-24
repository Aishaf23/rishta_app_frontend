import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/dp_default.png"),
            backgroundColor: Colors.white,
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// User name
                Text(
                  "Sophia",
                  style: AppText.heading.copyWith(fontSize: 18.sp),
                ),

                SizedBox(height: 4.h),

                /// User ID pill card
                InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: "01234567890"));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("User ID copied to clipboard"),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.fixed,
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "ID 01234567890",
                          style: TextStyle(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800,
                            letterSpacing: 0.3,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.copy_rounded,
                          size: 13.sp,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
