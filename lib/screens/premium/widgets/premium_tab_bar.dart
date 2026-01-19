import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class PremiumTabBar extends StatelessWidget {
  final TabController controller;

  const PremiumTabBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.info,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.white,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        tabs: const [
          Tab(text: "Premium"),
          Tab(text: "Assisted"),
        ],
      ),
    );
  }
}
