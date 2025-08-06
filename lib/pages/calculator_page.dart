import 'package:flutter/material.dart';
import 'package:latihan1_11pplg2/components/customButton.dart';
import 'package:latihan1_11pplg2/components/customText.dart';
import 'package:latihan1_11pplg2/components/cutomTextfield.dart';
import 'package:latihan1_11pplg2/controllers/kalkulator_kontroller.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final KalkulatorController kalkulatorController = Get.put(KalkulatorController());

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
    ),
    body: Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: "Simple Calculator",
              color: Colors.blue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: kalkulatorController.txtAngkaPertama,
              label: "Angka pertama",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: kalkulatorController.txtAngkaKedua,
              label: "Angka kedua",
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(myText: "+", onPressed: () {
                  kalkulatorController.tambah();
                }),
                CustomButton(myText: "-", onPressed: () {
                  kalkulatorController.kurang();
                }),
                CustomButton(myText: "*", onPressed: () {
                  kalkulatorController.kali();
                }),
                CustomButton(myText: "/", onPressed: () {
                  kalkulatorController.bagi();
                }),
              ],
            ),
            const SizedBox(height: 32),
            Obx(() => CustomText(
              text: "Hasil: ${kalkulatorController.hasil.value}",
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            )),
            CustomButton(myText: "Reset", onPressed: () {
              kalkulatorController.reset();
            })
          ],
        ),
      ),
    ),
  );
}
}
