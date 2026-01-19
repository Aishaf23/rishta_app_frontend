import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart' show CustomGradientButton;
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:provider/provider.dart';

class Accepted extends StatefulWidget {
  const Accepted({super.key});

  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedIndex == 0 ? AppColors.primaryColor : Colors.transparent,
                  side: const BorderSide(color: Colors.grey, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _onButtonPressed(0);
                },
                child: Text(
                  'Accepted By Him',
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedIndex == 1 ? AppColors.primaryColor : Colors.transparent,
                  side: const BorderSide(color: Colors.grey, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _onButtonPressed(1);
                },
                child: Text(
                  'Accepted By Me',
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),

          const SizedBox(height: 16),
          const Icon(
            Icons.request_page_sharp,
            color: AppColors.primaryColor,
            size: 90,
          ),
          const SizedBox(height: 16),

          _selectedIndex == 0
              ? const Text(
            'No Accepted Requests by Him',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
              : const Text(
            'No Accepted Requests by Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please review pending Requests under Received Tab. Once you Accept a Request, it will be visible here.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          CustomGradientButton(
            text: 'View Receive Requests',
            onPressed: () {
                  Provider.of<DashboardProvider>(context, listen: false)
                      .updateSelectedIndex(2);

                  Navigator.pop(context);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardPage()),
                        (route) => false,
                  );
            },
            textColor: Colors.white,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
