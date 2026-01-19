import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';
import 'package:rishta_app/constants/text/app_text.dart';

class CustomDatePickerField extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePickerField({
    super.key,
    this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? pickedDate;

  void _showBottomDatePicker(BuildContext context) {
    DateTime initialDate = pickedDate ?? widget.selectedDate ?? DateTime.now();
    DateTime tempDate = initialDate;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.mehroon,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.all(16),
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.dark(
                    primary: Colors.black,              // ✅ Selected circle color = BLACK
                    onPrimary: Colors.white,            // ✅ Text inside selected circle = WHITE
                    surface: AppColors.primaryColor,    // ✅ Background (mehroon)
                    onSurface: Colors.white,            // ✅ Default calendar text = white
                  ),
                  textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                    displayColor: Colors.white,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Select Date of Birth",
                      style: AppText.subheading.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),

                    Expanded(
                      child: CalendarDatePicker(
                        initialDate: initialDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        currentDate: DateTime.now(),
                        onDateChanged: (date) {
                          setModalState(() {
                            tempDate = date;
                          });
                        },
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel",
                              style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              pickedDate = tempDate;
                            });
                            widget.onDateSelected(tempDate);
                            Navigator.pop(context);
                          },
                          child: const Text("OK",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateToShow = pickedDate ?? widget.selectedDate ?? DateTime.now();

    return InkWell(
      onTap: () => _showBottomDatePicker(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "${dateToShow.day}/${dateToShow.month}/${dateToShow.year}",
          style: AppText.body.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
