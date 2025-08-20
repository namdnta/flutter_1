  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  // import 'package:get/get.dart';
  import 'package:latihan1_11pplg2/components/custom_button.dart';
  import 'package:latihan1_11pplg2/components/custom_date.dart';
  import 'package:latihan1_11pplg2/components/custom_radio.dart';
  import 'package:latihan1_11pplg2/components/custom_text.dart';
  import 'package:latihan1_11pplg2/components/cutom_textfield.dart';
 




  class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
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
                CustomText(
                  text: "Welcome to Fleur App, please login before using the app",
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: usernameController,
                  label: 'Email',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: usernameController,
                  label: 'Username',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  obscure: true,
                                    inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                  
                ),
                CustomText(
                  text: "Pilih Jenis Kelamin",
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
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
                DatePickerButton(
                  selectedDate: selectedDate,
                  onDatePicked: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                SizedBox(height: 10),
                CustomButton(myText: "Login", onPressed: () {
                  setState(() {
                    statusLogin = "Username: ${usernameController.text}, Login Successful";
                  });
                }),
                CustomButton(myText: "Sign up", onPressed: () {
                  setState(() {
                    statusLogin = "Username: ${usernameController.text}, Sign Up Successful, Gender: ${_selectedValue == 1 ? 'Perempuan' : 'Laki-laki'}";
                  });
                }),
                SizedBox(height: 10),
                CustomText(
                  text: statusLogin,
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

