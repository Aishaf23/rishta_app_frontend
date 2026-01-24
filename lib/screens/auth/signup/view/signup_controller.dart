import 'package:flutter/material.dart';

class SignupController {
  // Step 1
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // Step 2
  String? gender;
  String? religion;
  String? community;
  String? livingIn;
  TextEditingController mobile = TextEditingController();
}

// import 'package:flutter/material.dart';

// class SignupController {
//   // Profile for whom
//   String? profileFor;
//   String? gender;

//   // Name & DOB
//   TextEditingController firstName = TextEditingController();
//   TextEditingController lastName = TextEditingController();
//   DateTime? dob;

//   // Religion & Community
//   String? religion;
//   String? community;

//   // Living location
//   String? livingIn;

//   // Contact info
//   TextEditingController email = TextEditingController();
//   TextEditingController mobile = TextEditingController();
// }
