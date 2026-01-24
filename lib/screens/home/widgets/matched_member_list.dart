import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/screens/home/widgets/all_cards_page.dart';
import 'package:rishta_app/screens/matches/widgets/match_card.dart';
import 'package:rishta_app/screens/home/widgets/profile_card.dart';

class MatchedMemberList extends StatelessWidget {
  final String listName;
  final String listDescription;
  final Color color;

  const MatchedMemberList({
    super.key,
    required this.listName,
    required this.listDescription,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    //  Dummy data (later replace with API data)
    final members = [
      {
        "image":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=800&q=80",
        "name": "Ayesha",
        "age": 20,
        "height": "5'4",
        "language": "Urdu, Muslim",
        "location": "Lahore, Pakistan",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1722354980566-ec247cb4f1a8?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Ali",
        "age": 22,
        "height": "5'6",
        "language": "Punjabi, Sunni",
        "location": "Karachi, Pakistan",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=800&q=80",
        "name": "Hina",
        "age": 23,
        "height": "5'5",
        "language": "Urdu, Sunni",
        "location": "Islamabad, Pakistan",
      },
      {
        "image":
            "https://images.unsplash.com/photo-1722354980566-ec247cb4f1a8?q=80&w=627&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "name": "Umer",
        "age": 20,
        "height": "5'4",
        "language": "Urdu, Muslim",
        "location": "Lahore, Pakistan",
      },
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Title + Description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: AppColors.info,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllCardsPage(title: listName),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Text(
                listDescription,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),

          const SizedBox(height: 8),

          //  Horizontal ListView.builder
          SizedBox(
            height: 226,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: members.length,
              itemBuilder: (context, index) {
                final m = members[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ProfileCard(
                    imagePath: m["image"] as String,
                    name: m["name"] as String,
                    age: m["age"] as int,
                    height: m["height"] as String,
                    language: m["language"] as String,
                    location: m["location"] as String,
                  ),
                );
              },
            ),
          ),

          // Divider(),
          // Center(
          //   child: GestureDetector(
          //     child: Text("See all", style: TextStyle(color: AppColors.info)),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => AllCardsPage(title: listName),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
