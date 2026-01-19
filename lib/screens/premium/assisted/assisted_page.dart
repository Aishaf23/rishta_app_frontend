import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bottom_navbar.dart';
import 'package:rishta_app/screens/dashboard/dashboard_page.dart';
import 'package:rishta_app/screens/dashboard/provider/provider.dart';
import 'package:rishta_app/screens/premium/assisted/widgets/VIP_shaddi_card.dart';
import 'package:rishta_app/screens/premium/assisted/widgets/assisted_background.dart';
import 'package:rishta_app/screens/premium/premium_page.dart';
import 'package:rishta_app/screens/premium/widgets/premium_tab_bar.dart';
import 'package:provider/provider.dart';

class AssistedScreen extends StatefulWidget {
  const AssistedScreen({super.key});

  @override
  State<AssistedScreen> createState() => _AssistedScreenState();
}

class _AssistedScreenState extends State<AssistedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging && _tabController.index == 0) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => DashboardPage()),
                (route) => false,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assisted Screen'),
      backgroundColor: Colors.purple,),



      body: Stack(
        children: [
          const AssistedBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/vip.png',
                            height: 70,
                          //  fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'No.1   Elite Matchmaking Service',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "assets/men.png",
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                PremiumTabBar(controller: _tabController),

                const SizedBox(height: 20),

                VipShaddiCard(),

                const SizedBox(height: 80),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: AppColors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            foregroundColor: AppColors.black,
                            side: const BorderSide(color: AppColors.black),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Book Free Consultation'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavbar(
        currentIndex: 4,
        onTap: (index) {
          Provider.of<DashboardProvider>(context, listen: false)
              .updateSelectedIndex(index);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const DashboardPage()),
                (route) => false,
          );
        },
      ),
    );
  }
}
