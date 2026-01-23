// import 'package:flutter/material.dart';
// import 'package:rishta_app/constants/color/app_color.dart';
// import 'package:rishta_app/constants/text/app_text.dart';
// import 'package:rishta_app/global_widgets/auth/auth_background.dart';
// import 'package:rishta_app/screens/auth/signup/widgets/mbl_signup/mbl_signup.dart';
// import 'package:rishta_app/screens/auth/signup/widgets/signup_buttons.dart';

// class SignupScreen extends StatelessWidget {
//   final VoidCallback onTap;

//   const SignupScreen({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AuthBackground(
//         child: SafeArea(
//           child: Column(
//             children: [
//               const SizedBox(height: 60),

//               Image.asset(
//                 "assets/logo/logo.png",
//                 height: 50,
//                 color: AppColors.white,
//               ),

//               const Spacer(),

//               Text(
//                 "New to Shaadi.com?",
//                 style: AppText.body.copyWith(
//                   color: AppColors.white,
//                 ),
//               ),

//               const SizedBox(height: 20),

//               SignupButton(
//                 icon: Icons.email_rounded,
//                 text: "Sign Up with Email",
//                 onPressed: () {},
//               ),

//               const SizedBox(height: 15),

//               SignupButton(
//                 icon: Icons.phone_android,
//                 text: "Sign Up with Mobile",
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     backgroundColor: Colors.transparent,
//                     builder: (context) {
//                       return MobileSignupBottomSheet();
//                     },
//                   );
//                 },
//               ),

//               const SizedBox(height: 15),

//               SignupButton(
//                 icon: Icons.g_mobiledata_rounded,
//                 text: "Sign Up with Google",
//                 onPressed: () {},
//               ),

//               const SizedBox(height: 30),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Already have an account?   ",
//                     style: AppText.body.copyWith(
//                       color: AppColors.white,
//                     ),
//                   ),

//                   GestureDetector(
//                     onTap: onTap,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
//                       decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.circular(50),
//                         border: Border.all(
//                           color: AppColors.white,
//                           width: 1,
//                         ),
//                       ),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: AppColors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../../api services/api_services.dart';
import '../../../../api services/token_services.dart';
import '../../../../model/user_model.dart';
import '../../../home/home_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiServices _api = ApiServices();
  final TokenService _tokenService = TokenService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loading = false;

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final res = await _api.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (res?['success'] == true) {
        // Save token
        await _tokenService.saveToken(res!['token']);

        // Parse user
        final user = UserModel.fromJson(res['user_data']);
        debugPrint('Registered User: ${user.name}, Email: ${user.email}');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Welcome, ${user.name}!')));

        // Navigate to home or dashboard
        // Navigator.pushReplacement(...);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res?['message'] ?? 'Registration failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Shaadi.com Text
              Center(
                child: Text(
                  'Shaadi.com',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade800,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name
                    TextFormField(
                      controller: _nameController,
                      decoration: _inputDecoration('Full Name'),
                      validator: (v) =>
                          v!.isEmpty ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      decoration: _inputDecoration('Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => v!.isEmpty || !v.contains('@')
                          ? 'Enter valid email'
                          : null,
                    ),
                    const SizedBox(height: 16),

                    // Phone

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      decoration: _inputDecoration('Password'),
                      obscureText: true,
                      validator: (v) => v!.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                    ),
                    const SizedBox(height: 32),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.orange),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orange),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orange, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    );
  }
}
