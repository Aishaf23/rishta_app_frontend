import 'package:flutter/material.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/verify_phone_email.dart';

class MobileSignupBottomSheet extends StatefulWidget {
  const MobileSignupBottomSheet({super.key});

  @override
  State<MobileSignupBottomSheet> createState() => _MobileSignupBottomSheetState();
}

class _MobileSignupBottomSheetState extends State<MobileSignupBottomSheet> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerifyPhoneEmail(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      color: Colors.transparent,
      child: SafeArea(
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              const CircularProgressIndicator(),
              const SizedBox(height: 80),
              Text(
                "Loading your mobile sign-up screen...",
                style: AppText.body.copyWith(
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
