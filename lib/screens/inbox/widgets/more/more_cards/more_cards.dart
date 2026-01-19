import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:rishta_app/screens/inbox/widgets/more/delete_request.dart';

class ProfileCardWidget extends StatelessWidget {
  final Map<String, String> profile;

  const ProfileCardWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    profile['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile['name'] ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text("Age: ${profile['age']}"),
                    const SizedBox(height: 4),
                    Text("City: ${profile['city']}"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "This user's full profile is hidden. This is a very long message to test the overflow behavior in Flutter layout.",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Provider.of<DashboardProvider>(context, listen: false)
                          .updateSelectedIndex(4);
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const DashboardPage()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Upgrade to view >",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const DeclinedRequestWidget(),
          ],
        ),
      ),
    );
  }
}
