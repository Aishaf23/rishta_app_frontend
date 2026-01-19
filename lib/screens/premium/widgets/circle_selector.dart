import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class CircleSelector extends StatelessWidget {
  final List<String> labels;
  final int selectedCircle;
  final Function(int) onCircleTap;

  const CircleSelector({
    super.key,
    required this.labels,
    required this.selectedCircle,
    required this.onCircleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(labels.length, (index) {
        bool isSelected = selectedCircle == index;
        return GestureDetector(
          onTap: () => onCircleTap(index),
          child: CircleAvatar(
            radius: 20,
            backgroundColor:
            isSelected ? AppColors.white : AppColors.info,
            child: Text(
              labels[index],
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }
}
