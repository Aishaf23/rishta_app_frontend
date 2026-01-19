import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/global_widgets/premium_banner.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:rishta_app/screens/inbox/widgets/more/more_cards/more_cards.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> profiles = [
    {
      'name': 'Ayesha Khan',
      'age': '27',
      'city': 'Lahore',
      'image': 'https://randomuser.me/api/portraits/women/65.jpg'
    },
    {
      'name': 'Ali Raza',
      'age': '30',
      'city': 'Karachi',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == 0
                    ? AppColors.primaryColor
                    : Colors.transparent,
                side: const BorderSide(color: Colors.grey, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _onButtonPressed(0),
              child: Text(
                'Requests',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedIndex == 1
                    ? AppColors.primaryColor
                    : Colors.transparent,
                side: const BorderSide(color: Colors.grey, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _onButtonPressed(1),
              child: Text(
                'Deleted',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),

        const Divider(),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              ...profiles.map((profile) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ProfileCardWidget(profile: profile),
              )).toList(),

              const SizedBox(height: 5),

              const PremiumBanner(),

              const SizedBox(height: 5),

              ...profiles.map((profile) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ProfileCardWidget(profile: profile),
              )).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
