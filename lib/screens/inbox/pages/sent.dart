import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:provider/provider.dart';

class SentRequestsScreen extends StatelessWidget {
  const SentRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.insert_drive_file,
                size: 50,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "No Sent Requests",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Check out more Profiles and continue your\nPartner search.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: 180,
              child: CustomGradientButton(
                  text: 'View My Matches',
                onPressed  :() {
                  Provider.of<DashboardProvider>(context, listen: false)
                      .updateSelectedIndex(1);

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
            ),
          ],
        ),
    );
  }
}

