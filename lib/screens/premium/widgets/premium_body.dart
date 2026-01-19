import 'package:flutter/material.dart';
import 'package:rishta_app/screens/premium/assisted/assisted_page.dart';
import 'package:rishta_app/screens/premium/premium_plans.dart' show plans;
import 'package:rishta_app/screens/premium/widgets/moneybag_gurantee.dart';
import 'package:rishta_app/screens/premium/widgets/plan_card.dart';
import 'package:rishta_app/screens/premium/widgets/premium_header.dart';
import 'package:rishta_app/screens/premium/widgets/premium_tab_bar.dart';
import 'package:rishta_app/screens/premium/widgets/questions.dart';

import 'circle_selector.dart';

class PremiumBody extends StatefulWidget {
  const PremiumBody({super.key});

  @override
  State<PremiumBody> createState() => _PremiumBodyState();
}

class _PremiumBodyState extends State<PremiumBody> with TickerProviderStateMixin {
  int selectedCircle = 0;
  final PageController _pageController = PageController(viewportFraction: 0.75);
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  double _scrollOffset = 0.0;
  final double _buttonStickOffset = 520;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AssistedScreen()),
          );

          _tabController.index = 0;
        }
      }
    });

    _pageController.addListener(() {
      int newIndex = (_pageController.page ?? 0).round();
      if (newIndex != selectedCircle) {
        setState(() => selectedCircle = newIndex);
      }
    });

    _scrollController.addListener(() {
      setState(() => _scrollOffset = _scrollController.offset);
    });
  }

  void onCircleTap(int index) {
    setState(() {
      selectedCircle = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isButtonFixed = _scrollOffset < _buttonStickOffset;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          const PremiumHeader(),
          PremiumTabBar(controller: _tabController),
          const SizedBox(height: 15),


          CircleSelector(
            labels: labels,
            selectedCircle: selectedCircle,
            onCircleTap: onCircleTap,
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 420,
            child: PageView.builder(
              controller: _pageController,
              itemCount: plans.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = _pageController.position.hasPixels
                        ? _pageController.page! - index
                        : (selectedCircle - index).toDouble();

                    double scale = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                    double translateX = value * 40;

                    return Transform.translate(
                      offset: Offset(translateX, 0),
                      child: Transform.scale(
                        scale: scale,
                        child: Opacity(
                          opacity: (1 - value.abs()).clamp(0.5, 1.0),
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: PlanCard(plan: plans[index]),
                );
              },
            ),
          ),


          const SizedBox(height: 20),

          const MoneyBackGuarantee(),

          Questions(),

          const SizedBox(height: 90),
        ],
      ),
    );
  }
}

// 🔹 Circle Labels
const labels = ["G", "G+", "D", "D+", "P+"];


