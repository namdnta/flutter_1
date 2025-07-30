import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// CustomTextField widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}

// CustomRadioOption widget
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
    return RadioListTile<int>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

// DatePickerButton widget
class DatePickerButton extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDatePicked;

  const DatePickerButton({
    super.key,
    required this.selectedDate,
    required this.onDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(selectedDate == null
          ? 'Pilih Tanggal'
          : 'Tanggal: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
      onPressed: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          onDatePicked(picked);
        }
      },
    );
  }
}

// CustomButton widget
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class _LoginPageState extends State<LoginPage> {
  String statusLogin = "";
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int? _selectedValue;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'asset/logo.jpeg',
                  width: 150,
                  height: 150,
                ),
              ),
              Text(
                "Welcome to Fleur App, please login before using the app",
                style: TextStyle(
                  
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Enter your Email and Password",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: usernameController,
                label: 'Username',
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscure: true,
              ),
              Text(
                "Pilih Jenis Kelamin",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              CustomRadioOption(
                title: 'Perempuan',
                value: 1,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              CustomRadioOption(
                title: 'Laki-laki',
                value: 2,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              SizedBox(height: 10),
              DatePickerButton(
                selectedDate: selectedDate,
                onDatePicked: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
SizedBox(height: 10),
CustomButton(
  label: 'Login',
  onPressed: () {
    setState(() {
      if (usernameController.text == "admin" &&
          passwordController.text == "admin") {
        statusLogin = "Login Successful!";
      } else {
        statusLogin = "Login Failed!";
      }
    });
  },
),
if (statusLogin.isNotEmpty)
  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        statusLogin,
        style: TextStyle(
          fontSize: 18,
          color: statusLogin == "Login Successful!"
              ? Colors.green
              : Colors.red,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      if (selectedDate != null)
        Text(
          "Tanggal Lahir: ${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      if (_selectedValue != null)
        Text(
          "Jenis Kelamin: ${_selectedValue == 1 ? 'Perempuan' : 'Laki-laki'}",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
    ],
  ),
            ],
          ),
        ),
      ),
    );
  }
}