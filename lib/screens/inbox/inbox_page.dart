import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/PrimaryWidgets/app_bar.dart';
import 'package:rishta_app/global_widgets/custom_drawer/custom_drawer.dart';
import 'package:rishta_app/global_widgets/TabView/tab_view.dart';
import 'package:rishta_app/screens/inbox/pages/received_page.dart';
import 'package:rishta_app/screens/inbox/pages/accepted.dart';
import 'package:rishta_app/screens/inbox/widgets/contacts.dart';
import 'package:rishta_app/screens/inbox/widgets/more/more.dart';
import 'package:rishta_app/screens/inbox/pages/sent.dart';
import 'package:swipable_stack/swipable_stack.dart';
import '../../constants/color/app_color.dart';
import '../matches/widgets/search/search.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final SwipableStackController _controller = SwipableStackController();
  final int requests = 67;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Inbox"),
      drawer: const CustomDrawer(),
      body: CustomTabView(
        tabTitles: [
          "Search",
          "Received ($requests)",
          "Accepted",
          "Contacts",
          "Sent",
          "More",

        ],
        views: [
          Search(),
          ReceivedPage(
            requests: requests,
            controller: _controller,
          ),
          const Accepted(),
          const ContactScreen(),
          SentRequestsScreen(),
          MoreScreen(),
        ],
        selectedColor: AppColors.primaryColor,
        unselectedColor: Colors.grey[200]!,
        initialIndex: 1,
        tabStyle: TabStyle.underline,
      ),
    );
  }
}
