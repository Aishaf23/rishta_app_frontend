import 'package:flutter/material.dart';
import '../../../../constants/text/app_text.dart';
import 'sign_up_with_email.dart';

class LoadingEmailSignUp extends StatefulWidget {
  const LoadingEmailSignUp({super.key});

  @override
  State<LoadingEmailSignUp> createState() => _MobileSignupBottomSheetState();
}

class _MobileSignupBottomSheetState extends State<LoadingEmailSignUp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => SignUpWithEmail()));
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
                "Loading your email sign-up screen...",
                style: AppText.body.copyWith(color: Colors.black87),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
