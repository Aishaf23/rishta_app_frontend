// import 'package:flutter/material.dart';
// import '../signup_controller.dart';

// class NameDobStep extends StatefulWidget {
//   final SignupController controller;
//   final VoidCallback onNext;
//   final VoidCallback onBack;
//   final VoidCallback onChanged;

//   NameDobStep({
//     required this.controller,
//     required this.onNext,
//     required this.onBack,
//     required this.onChanged,
//   });

//   @override
//   State<NameDobStep> createState() => _NameDobStepState();
// }

// class _NameDobStepState extends State<NameDobStep> {
//   late TextEditingController dayController;
//   late TextEditingController monthController;
//   late TextEditingController yearController;

//   @override
//   void initState() {
//     super.initState();
//     dayController = TextEditingController(
//       text: widget.controller.dob != null
//           ? widget.controller.dob!.day.toString()
//           : '',
//     );
//     monthController = TextEditingController(
//       text: widget.controller.dob != null
//           ? widget.controller.dob!.month.toString()
//           : '',
//     );
//     yearController = TextEditingController(
//       text: widget.controller.dob != null
//           ? widget.controller.dob!.year.toString()
//           : '',
//     );

//     // Listen to changes and notify parent
//     widget.controller.firstName.addListener(widget.onChanged);
//     widget.controller.lastName.addListener(widget.onChanged);
//     dayController.addListener(_updateDob);
//     monthController.addListener(_updateDob);
//     yearController.addListener(_updateDob);
//   }

//   void _updateDob() {
//     int? day = int.tryParse(dayController.text);
//     int? month = int.tryParse(monthController.text);
//     int? year = int.tryParse(yearController.text);

//     if (day != null && month != null && year != null) {
//       widget.controller.dob = DateTime(year, month, day);
//     } else {
//       widget.controller.dob = null;
//     }

//     widget.onChanged();
//   }

//   @override
//   void dispose() {
//     dayController.dispose();
//     monthController.dispose();
//     yearController.dispose();
//     widget.controller.firstName.removeListener(widget.onChanged);
//     widget.controller.lastName.removeListener(widget.onChanged);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             IconButton(icon: Icon(Icons.arrow_back), onPressed: widget.onBack),
//             SizedBox(height: 20),
//             Center(
//               child: CircleAvatar(
//                 radius: 30,
//                 backgroundColor: Colors.purple.shade100,
//                 child: Icon(Icons.person, color: Colors.purple, size: 30),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Your name",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 15),
//             TextField(
//               controller: widget.controller.firstName,
//               decoration: InputDecoration(
//                 hintText: "First name",
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12),
//             TextField(
//               controller: widget.controller.lastName,
//               decoration: InputDecoration(
//                 hintText: "Last name",
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               "Date of birth",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   width: 80,
//                   child: TextField(
//                     controller: dayController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "DD",
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 14,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 80,
//                   child: TextField(
//                     controller: monthController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "MM",
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 14,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 100,
//                   child: TextField(
//                     controller: yearController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "YYYY",
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 14,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
