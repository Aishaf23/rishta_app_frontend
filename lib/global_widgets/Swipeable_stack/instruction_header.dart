import 'package:flutter/material.dart';

import '../../constants/color/app_color.dart';

class InstructionHeader extends StatelessWidget {
  final String text;
  const InstructionHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     AppColors.primaryColor.withOpacity(0.8),
          //     AppColors.primaryColor.withOpacity(0.2),
          //     AppColors.primaryColor.withOpacity(0.8),
          //   ],
          //   stops: const [0.0, 0.5, 1.0],
          // ),
          color: AppColors.primaryColor.withOpacity(0.4),
          border: const Border(
            top: BorderSide(color: AppColors.mehroon, width: 1.0),
            bottom: BorderSide(color: AppColors.mehroon, width: 1.0),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.mehroon,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 12
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
