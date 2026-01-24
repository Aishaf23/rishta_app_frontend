import 'package:flutter/material.dart';
import 'package:rishta_app/api_services/api_services.dart';
import 'package:rishta_app/api_services/token_services.dart';

import '../../home/home_page.dart';
import '../signup/view/sign_up_with_email.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _loading = false;

  final Color primaryColor = Colors.red.shade900;

  final ApiServices _api = ApiServices();
  final TokenService _tokenService = TokenService();

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 1.5),
      ),
    );
  }

  bool get isFormValid {
    return emailController.text.contains("@") &&
        passwordController.text.length >= 6;
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    final response = await _api.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() => _loading = false);

    if (response != null && response['success'] == true) {
      // Save token locally
      await _tokenService.saveToken(response['token']);

      // Navigate to home page
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      final message = response != null ? response['message'] : "Login failed";
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: primaryColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Login",
            style: TextStyle(
              color: primaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              onChanged: () => setState(() {}),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: primaryColor.withOpacity(.12),
                      child: Icon(Icons.lock, color: primaryColor, size: 32),
                    ),
                  ),

                  //  Center(
                  //   child: Image.asset(
                  //     'assets/logo/app_logo.png',
                  //     width: 120,
                  //     height: 120,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  const SizedBox(height: 40),
                  Text(
                    "Email",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _inputDecoration("Email"),
                    validator: (v) =>
                        v == null || !v.contains("@") ? "Invalid email" : null,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Password",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: passwordController,
                    cursorColor: primaryColor,
                    obscureText: _obscurePassword,
                    decoration: _inputDecoration("Password").copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primaryColor,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    validator: (v) =>
                        v == null || v.length < 6 ? "Min 6 characters" : null,
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isFormValid && !_loading
                          ? _goToHomePage
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFormValid
                            ? primaryColor
                            : Colors.grey.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to SignUp
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignUpWithEmail(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _goToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }
}
