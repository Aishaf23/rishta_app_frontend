import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/custom_button.dart';
import 'package:rishta_app/constants/text/app_text.dart';
import 'package:rishta_app/global_widgets/auth/auth_background.dart';
import 'package:rishta_app/global_widgets/auth/text_fields.dart';
import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/widgets/profile_selection.dart';

class VerifyPhoneEmail extends StatefulWidget {
  const VerifyPhoneEmail({super.key});

  @override
  State<VerifyPhoneEmail> createState() => _VerifyPhoneEmailState();
}

class _VerifyPhoneEmailState extends State<VerifyPhoneEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String countryCode = "+92";
  final List<String> countryCodes = ["+92", "+91", "+1", "+44"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Verify Email & Phone",
          style: AppText.subheading.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox.expand(
        child: AuthBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),

                  const Center(
                    child: Icon(Icons.verified_user_rounded, size: 80, color: AppColors.white),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Text(
                      "An active email ID & phone no. are required to secure your profile",
                      textAlign: TextAlign.center,
                      style: AppText.caption.copyWith(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text("Email ID", style: AppText.subheading.copyWith(color: Colors.white)),
                  const SizedBox(height: 8),

                  // ✅ Email Field
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Enter your email",
                    labelText: "Email ID",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  Text("Mobile no.", style: AppText.subheading.copyWith(color: Colors.white)),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: AppColors.mehroon,
                            value: countryCode,
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            style: AppText.body.copyWith(color: Colors.white),
                            onChanged: (String? newValue) {
                              setState(() {
                                countryCode = newValue!;
                              });
                            },
                            items: countryCodes
                                .map<DropdownMenuItem<String>>((String code) {
                              return DropdownMenuItem<String>(
                                value: code,
                                child: Text(code, style: AppText.body.copyWith(color: Colors.white)),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          labelText: 'Mobile Number',
                          controller: _phoneController,
                          hintText: "Enter mobile number",
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Mobile number is required";
                            }
                            if (value.length != 10) {
                              return "Enter a valid 10-digit number";
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: CustomGradientButton(
                        text: 'Submit',
                        textColor: AppColors.primaryColor,
                        backgroundColor: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileSelection(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please fill your details",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: "By creating account, you agree to our ",
                        style: AppText.caption.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                            text: " Privacy Policy ",
                            style: AppText.button.copyWith(color: AppColors.black),
                          ),
                          const TextSpan(text: " and "),
                          TextSpan(
                            text: " T&C",
                            style: AppText.button.copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
