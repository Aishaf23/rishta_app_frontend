import 'package:flutter/material.dart';

class AssistedBackground extends StatelessWidget {
  const AssistedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE8E8E8),
            Color(0xFF876D8D),
            Colors.white,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
