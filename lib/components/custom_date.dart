import 'package:flutter/material.dart';

class DatePickerButton extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDatePicked;

  const DatePickerButton({
    super.key,
    required this.selectedDate,
    required this.onDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        onDatePicked(pickedDate);
      },
      child: Text(
        selectedDate != null
            ? 'Selected Date: ${selectedDate!.toLocal()}'.split(' ')[0]
            : 'Select Date',
      ),
    );
  }
}
