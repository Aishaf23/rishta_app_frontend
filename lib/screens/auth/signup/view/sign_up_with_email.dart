import 'package:flutter/material.dart';
import 'package:rishta_app/api_services/api_services.dart';
import 'package:rishta_app/api_services/token_services.dart';
import 'package:rishta_app/screens/auth/login/login_screen.dart';
import 'signup_controller.dart';
import 'signup_with_email_two.dart';
import '../../../home/home_page.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final SignupController controller = SignupController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _loading = false;

  final Color primaryColor = Colors.red.shade900;

  final _api = ApiServices(); // Your API functions
  final _tokenService = TokenService(); // Save token locally

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
    return controller.firstName.text.trim().isNotEmpty &&
        controller.email.text.contains("@") &&
        controller.password.text.length >= 6;
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SignUpStep2(controller: controller)),
      );
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
            "Create An Account",
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
                      child: Icon(Icons.person, color: primaryColor, size: 32),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "Name",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.firstName,
                    cursorColor: primaryColor,
                    decoration: _inputDecoration("Full Name"),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Email",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.email,
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
                    controller: controller.password,
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
                  const SizedBox(height: 90),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isFormValid ? _nextStep : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isFormValid
                            ? primaryColor
                            : Colors.grey.shade400,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to SignUp
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
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
}

// import 'package:flutter/material.dart';
// import '../../../splash_screen/splash_screen.dart';
// import 'signup_screen.dart';
// import 'screens/religion_screen.dart';
// import 'signup_controller.dart';
// import 'screens/profile_for_screen.dart';
// import 'screens/name_dob_screen.dart';
// import 'screens/contact_screen.dart';

// class SignUpWithEmail extends StatefulWidget {
//   @override
//   _SignUpWithEmailState createState() => _SignUpWithEmailState();
// }

// class _SignUpWithEmailState extends State<SignUpWithEmail> {
//   final SignupController controller = SignupController();
//   final PageController pageController = PageController();

//   int currentStep = 0;

//   void nextPage() {
//     if (currentStep < 3) {
//       setState(() => currentStep++);
//       pageController.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     } else {
//       submit();
//     }
//   }

//   void previousPage() {
//     if (currentStep > 0) {
//       setState(() => currentStep--);
//       pageController.previousPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     } else {
//       Navigator.pop(context); // close modal sheet if back on first step
//     }
//   }

//   void submit() {
//     debugPrint("Profile For: ${controller.profileFor}");
//     debugPrint(
//       "Name: ${controller.firstName.text} ${controller.lastName.text}",
//     );
//     debugPrint("DOB: ${controller.dob}");
//     debugPrint("Religion: ${controller.religion}");
//     debugPrint("Community: ${controller.community}");
//     debugPrint("Living In: ${controller.livingIn}");
//     debugPrint("Email: ${controller.email.text}");
//     debugPrint("Mobile: ${controller.mobile.text}");
//     // Navigate or send data to backend
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   leading: currentStep > 0
//       //       ? IconButton(icon: Icon(Icons.arrow_back), onPressed: previousPage)
//       //       : null, // Show back button only after first screen
//       // ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: pageController,
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 ProfileForStep(
//                   controller: controller,
//                   onBack: previousPage,
//                   onNext: nextPage,
//                   onChanged: () => setState(() {}),
//                 ),
//                 NameDobStep(
//                   controller: controller,
//                   onNext: nextPage,
//                   onBack: previousPage,
//                     onChanged: () => setState(() {}),
//                 ),
//                 MultiStepDropdownScreen(
//                   controller: controller,
//                   onNext: nextPage,
//                   onBack: previousPage,
//                 ),
//                 ContactStep(
//                   controller: controller,
//                   onSubmit: submit,
//                   onBack: previousPage,
//                 ),
//               ],
//             ),
//           ),
//           // Fixed Next/Submit Button
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
//             child: SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed:
//                     (currentStep == 0 &&
//                         (controller.profileFor == null ||
//                             controller.profileFor!.isEmpty ||
//                             controller.gender == null ||
//                             controller.gender!.isEmpty))
//                     ? null
//                     : () {
//                         if (currentStep < 3) {
//                           nextPage();
//                         } else {
//                           submit();
//                         }
//                       },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   backgroundColor:
//                       (currentStep == 0 &&
//                           (controller.profileFor == null ||
//                               controller.profileFor!.isEmpty ||
//                               controller.gender == null ||
//                               controller.gender!.isEmpty))
//                       ? Colors.grey.shade400
//                       : Colors.lightBlueAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text(
//                   currentStep == 3 ? "Submit" : "Continue",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
