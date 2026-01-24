// import 'package:flutter/material.dart';
// import '../signup_controller.dart';

// class ProfileForStep extends StatefulWidget {
//   final SignupController controller;
//   final VoidCallback onBack;
//   final VoidCallback onNext;
//   final VoidCallback onChanged;

//   ProfileForStep({
//     required this.controller,
//     required this.onBack,
//     required this.onNext,
//     required this.onChanged,
//   });

//   @override
//   State<ProfileForStep> createState() => _ProfileForStepState();
// }

// class _ProfileForStepState extends State<ProfileForStep> {
//   // Lists for each section
//   final List<List<String>> profileForList = [
//     ["Myself", "Son"],
//     ["Daughter", "Brother"],
//     ["Sister", "Friend"],
//     ["Relative"],
//   ];

//   final List<List<String>> genderFamilyList = [
//     ["Male", "Female"],
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Back button
//             IconButton(icon: Icon(Icons.arrow_back), onPressed: widget.onBack),

//             // Avatar
//             Center(
//               child: CircleAvatar(
//                 radius: 42,
//                 backgroundColor: Colors.orange.shade100,
//                 child: Icon(Icons.person, size: 35, color: Colors.orange),
//               ),
//             ),

//             SizedBox(height: 15),

//             // Profile section title
//             Text(
//               "This Profile is for",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 20),

//             // Build profile options dynamically
//             ...profileForList.map((row) {
//               return Row(
//                 children: row.map((option) {
//                   bool isSelected = widget.controller.profileFor == option;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 12, bottom: 12),
//                     child: _buildOption(option, isSelected, isProfile: true),
//                   );
//                 }).toList(),
//               );
//             }).toList(),

//             // Show Gender section only if a profile is selected
//             if (widget.controller.profileFor != null) ...[
//               SizedBox(height: 30),
//               Text(
//                 "Gender",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 20),

//               ...genderFamilyList.map((row) {
//                 return Row(
//                   children: row.map((option) {
//                     bool isSelected = widget.controller.gender == option;
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 12, bottom: 12),
//                       child: _buildOption(option, isSelected, isProfile: false),
//                     );
//                   }).toList(),
//                 );
//               }).toList(),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOption(
//     String option,
//     bool isSelected, {
//     required bool isProfile,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (isProfile) {
//             widget.controller.profileFor = option;
//             widget.controller.gender = ""; // reset gender if profile changes
//           } else {
//             widget.controller.gender = option;
//           }
//           widget.onChanged(); // notify parent
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(color: Colors.grey.shade400, width: 1.2),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isSelected ? Colors.cyan : Colors.grey.shade300,
//               ),
//               padding: EdgeInsets.all(4),
//               child: Icon(Icons.check, size: 16, color: Colors.white),
//             ),
//             SizedBox(width: 10),
//             Text(
//               option,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 17,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
