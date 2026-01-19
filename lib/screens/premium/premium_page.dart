import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/screens/premium/assisted/assisted_page.dart';
import 'package:rishta_app/screens/premium/widgets/premium_app_bar.dart';
import 'package:rishta_app/screens/premium/widgets/premium_background.dart';
import 'package:rishta_app/screens/premium/widgets/premium_body.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AssistedScreen()),
          );
        }
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
      appBar: const PremiumAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            const PremiumBackground(),
            const PremiumBody(),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomGradientButton(
                  text: "Continue",   textColor: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
