import 'package:flutter/material.dart';

class CustomRadioOption extends StatelessWidget {
  final String title;
  final int value;
  final int? groupValue;
  final ValueChanged<int?> onChanged;

  const CustomRadioOption({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Radio<int>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
