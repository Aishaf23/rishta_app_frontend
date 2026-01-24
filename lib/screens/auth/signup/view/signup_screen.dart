import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/screens/auth/login/login_screen.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/mbl_signup.dart';
import 'package:rishta_app/screens/auth/signup/widgets/signup_buttons.dart';

import 'loading_signup.dart';
import 'sign_up_with_email.dart';

class SignupScreen extends StatelessWidget {
  final VoidCallback onTap;

  const SignupScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),

              Image.asset(
                "assets/logo/logo.png",
                height: 50,
                color: AppColors.white,
              ),

              const Spacer(),

              Text(
                "New to Shaadi.com?",
                style: AppText.body.copyWith(color: AppColors.white),
              ),

              const SizedBox(height: 20),

              SignupButton(
                icon: Icons.email_rounded,
                text: "Sign Up with Email",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return LoadingEmailSignUp();
                    },
                  );
                },
              ),

              const SizedBox(height: 15),

              SignupButton(
                icon: Icons.phone_android,
                text: "Sign Up with Mobile",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return MobileSignupBottomSheet();
                    },
                  );
                },
              ),

              const SizedBox(height: 15),

              SignupButton(
                icon: Icons.g_mobiledata_rounded,
                text: "Sign Up with Google",
                onPressed: () {},
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?   ",
                    style: AppText.body.copyWith(color: AppColors.white),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.white, width: 1),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
