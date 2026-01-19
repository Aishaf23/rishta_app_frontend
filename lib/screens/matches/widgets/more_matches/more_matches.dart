import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bar.dart';
import 'package:rishta_app/global_widgets/custom_drawer/custom_drawer.dart';

import '../../../../constants/color/app_color.dart';
import '../../../home/widgets/matched_member_list.dart';

class MoreMatches extends StatelessWidget {
  const MoreMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MatchedMemberList(
            listName: 'Premium Matches',
            listDescription: 'Recently upgraded Premium members ',
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 10),
          MatchedMemberList(
            listName: 'New Matches',
            listDescription: 'Members who joined recently',
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 10),
          MatchedMemberList(
            listName: 'Premium Matches',
            listDescription: 'Recently upgraded Premium members ',
            color: AppColors.primaryColor,
          ),
      
        ],
      ),
    );
  }
}



