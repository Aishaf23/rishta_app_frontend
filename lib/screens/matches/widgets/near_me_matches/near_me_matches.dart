import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/matches/widgets/my_matches/widgets/match_list_section.dart';
import 'package:rishta_app/global_widgets/premium_banner.dart';
import 'package:rishta_app/screens/matches/widgets/near_me_matches/widgets/location_service.dart';
import 'package:swipable_stack/swipable_stack.dart';

class NearMeMatches extends StatefulWidget {
  const NearMeMatches({super.key});

  @override
  State<NearMeMatches> createState() => _NearMeMatchesState();
}

class _NearMeMatchesState extends State<NearMeMatches> {
  bool locationAllowed = false;
  late final SwipableStackController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController();
    _getLocation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getLocation() async {
    final position = await LocationService.getCurrentLocation();
    if (position != null) {
      setState(() {
        locationAllowed = true;
      });
    } else {
      setState(() {
        locationAllowed = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location permission denied!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: !locationAllowed
            ? const CircularProgressIndicator()
            : ListView(
          children: [
            MatchListSection(
              controller: _controller,
            ),
            const PremiumBanner(),
          ],
        ),
    );
  }
}
