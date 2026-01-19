import 'package:flutter/material.dart';
import 'package:rishta_app/constants/color/app_color.dart';

class EditProfileCard extends StatefulWidget {
  final String title;
  final VoidCallback onEdit;
  final Map<String?, String> infoItems;

  const EditProfileCard({
    super.key,
    required this.title,
    required this.onEdit,
    required this.infoItems,
  });

  @override
  State<EditProfileCard> createState() => _EditProfileCardState();
}

class _EditProfileCardState extends State<EditProfileCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 17),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onEdit,
                    icon: Icon(Icons.edit, color: AppColors.primaryColor),
                    tooltip: "Edit ${widget.title}",
                  ),
                  IconButton(
                    onPressed: _toggleExpand,
                    icon: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            if (_isExpanded) ...[
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.infoItems.entries.map((entry) {
                    return _infoRow(entry.key, entry.value);
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String? label, String value) {
    const textStyle = TextStyle(
      height: 1.7,
      wordSpacing: 2.1,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: (label == null || label.trim().isEmpty)
          ? Text(value, style: textStyle)
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 190,
            child: Text(
              "$label:",
              style: textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value, style: textStyle)),
        ],
      ),
    );
  }

}


