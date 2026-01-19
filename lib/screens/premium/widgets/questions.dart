import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final List<Map<String, String>> _faqList = [
    {
      'question': 'What is the purpose of this app?',
      'answer': 'This app helps you find suitable rishtas through advanced filters and matchmaking.'
    },
    {
      'question': 'How can I upgrade to premium?',
      'answer': 'Go to the Premium section and choose a plan that suits your needs.'
    },
    {
      'question': 'Is my data safe?',
      'answer': 'Yes, we ensure your privacy with end-to-end encryption and data protection.'
    },
    {
      'question': 'How do I contact support?',
      'answer': 'You can reach out via the Help section or email us at support@example.com.'
    },
  ];

  int? _expandedIndex;

  void _toggleExpand(int index) {
    setState(() {
      _expandedIndex = (_expandedIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),

        ...List.generate(_faqList.length, (index) {
          final item = _faqList[index];
          final isExpanded = _expandedIndex == index;

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () => _toggleExpand(index),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['question']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(Icons.chevron_right, size: 28),
                      ),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      item['answer']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
