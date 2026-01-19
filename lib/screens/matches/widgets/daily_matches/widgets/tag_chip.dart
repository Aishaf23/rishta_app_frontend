import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart' show AppText;

class TagChip extends StatelessWidget {
  final String text;

  const TagChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        text,
        style: AppText.caption.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}
