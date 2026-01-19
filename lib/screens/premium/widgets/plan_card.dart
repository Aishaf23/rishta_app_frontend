import 'package:flutter/material.dart';
import 'feature_item.dart';

class PlanCard extends StatelessWidget {
  final Map<String, String> plan;
  const PlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan["title"] ?? "",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            plan["price"] ?? "",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            plan["per"] ?? "",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 15),
          const FeatureItem(text: "Send unlimited Messages"),
          const FeatureItem(text: "View upto 150 Contact Numbers"),
          const FeatureItem(text: "Video call your Matches"),
          const FeatureItem(text: "Standout from other Profiles"),
        ],
      ),
    );
  }
}
