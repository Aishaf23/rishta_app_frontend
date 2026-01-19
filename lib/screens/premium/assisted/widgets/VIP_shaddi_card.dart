import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class VipShaddiCard extends StatelessWidget {
  const VipShaddiCard({super.key});

  Widget _buildTickWithText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check, color: Colors.green, size: 20),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/vip.png',
            height: 100,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 2),

          Row(
            children: const [
              Expanded(child: Divider(thickness: 1)),
              SizedBox(width: 1),
              Text(
                'Starting from',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(width: 8),
              Expanded(child: Divider(thickness: 1)),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            'PKR 0',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTickWithText('Top consultant'),
              const SizedBox(height: 8),
              _buildTickWithText('Assured Meeting with handpicked Matches'),
              const SizedBox(height: 8),
              _buildTickWithText('100% discrete & Private'),
              const SizedBox(height: 8),
              _buildTickWithText('50000+ Satisfied VIPs'),
            ],
          ),
        ],
      ),
    );
  }
}
