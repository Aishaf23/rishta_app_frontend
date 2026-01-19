import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class MoneyBackGuarantee extends StatelessWidget {
  const MoneyBackGuarantee({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Auto renews on expiry.Cancel anytime. "
                "\n"
                "\nThe safest, smartest, & the most secure matchmaking service in India.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),


        SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: AppColors.black,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/moneybag.png",
                height: 80,
              ),
              const SizedBox(height: 8),
              const Text(
                "Money Back Guarantee!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "If you do not find a match within 30 days,\nget a full refund without any questions asked",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.black),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _FeatureItem(
                    icon: Icons.person,
                    label: "Best Matches",
                  ),
                  _FeatureItem(
                    icon: Icons.verified,
                    label: "Verified Profiles",
                  ),
                  _FeatureItem(
                    icon: Icons.lock,
                    label: "100% Privacy",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.success, size: 30),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
