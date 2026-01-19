import 'package:flutter/material.dart';

class LanguageSelectorTile extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  const LanguageSelectorTile({
    Key? key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
  }) : super(key: key);

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: ['English', 'Urdu'].map((lang) {
            return RadioListTile<String>(
              title: Text(lang),
              value: lang,
              groupValue: selectedLanguage,
              onChanged: (value) {
                onLanguageSelected(value!);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Language'),
      subtitle: Text('Choose app language ($selectedLanguage)'),
      trailing: const Icon(Icons.language),
      onTap: () => _showLanguageBottomSheet(context),
    );
  }
}
