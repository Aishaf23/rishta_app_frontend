import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  void _showOrderSummary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              child: Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    AppBar(
                      automaticallyImplyLeading: false,
                      title: const Text("Order Summary"),
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: Colors.white38,
                      foregroundColor: AppColors.black,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildRow("Gold Plus (3 months)", "PKR 3950"),
                          const SizedBox(height: 8),
                          _buildRow(
                            "Savings (15% off)",
                            "-PKR 593",
                            valueColor: AppColors.success,
                          ),
                          const SizedBox(height: 16),
                          _buildCheckboxTile("Promote my Profile ?", "PKR 299"),
                          _buildCheckboxTile("Contribute to Shaadi ?", "PKR 20"),
                          const Divider(height: 22),
                          _buildRow(
                            "Total Amount",
                            "PKR 3377",
                            isBold: true,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle proceed action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyanAccent,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "Proceed",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildRow(String title, String value,
      {Color valueColor = Colors.black, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  static Widget _buildCheckboxTile(String label, String amount) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isChecked = false;
        return CheckboxListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(amount),
            ],
          ),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? true;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _showOrderSummary(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "Continue",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class StickyContinueButton extends StatelessWidget {
  const StickyContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      right: 0,
      bottom: 20,
      child: ContinueButton(),
    );
  }
}
