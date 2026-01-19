import 'package:flutter/material.dart';
import 'package:rishta_app/global_widgets/profile_card/profile_card.dart';
import 'package:rishta_app/screens/my_profile/widgets/more_about/edit_more_about.dart';

class MoreAbout extends StatefulWidget {
  const MoreAbout({super.key});

  @override
  State<MoreAbout> createState() => _MoreAboutState();
}

class _MoreAboutState extends State<MoreAbout> {
  String aboutText =
      "Hello, here is a little bit about my friend. "
      "He has completed his B.A. He believes in having "
      "a blend of modern & traditional values and "
      "balancing professional & family life. Please "
      "reach out in case you find my friend's profile suitable.";

  @override
  Widget build(BuildContext context) {
    return EditProfileCard(
      title: "More about myself, partner",
      onEdit: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditMoreAbout(initialText: aboutText),
          ),
        ).then((updatedText) {
          if (updatedText != null) {
            setState(() {
              aboutText = updatedText;
            });
          }
        });
      },
      infoItems: {
        null: aboutText,
      },
    );
  }
}
