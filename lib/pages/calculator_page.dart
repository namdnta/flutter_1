import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan1_11pplg2/components/custom_button.dart';
import 'package:latihan1_11pplg2/components/custom_text.dart';
import 'package:latihan1_11pplg2/components/cutom_textfield.dart';
import 'package:latihan1_11pplg2/controllers/kalkulator_kontroller.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final KalkulatorController kalkulatorController = Get.put(KalkulatorController());

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[50],
    appBar: AppBar(
      title: const Text(
        'Calculator',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue[600],
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Header Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.blue[400]!, Colors.blue[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomText(
                  text: "✨ Simple Calculator ✨",
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Input Fields Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: kalkulatorController.txtAngkaPertama,
                      label: "🔢 Angka Pertama",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: kalkulatorController.txtAngkaKedua,
                      label: "🔢 Angka Kedua",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Operation Buttons
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Pilih Operasi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildOperationButton("+", Colors.green, () {
                          kalkulatorController.tambah();
                        }),
                        _buildOperationButton("−", Colors.orange, () {
                          kalkulatorController.kurang();
                        }),
                        _buildOperationButton("×", Colors.purple, () {
                          kalkulatorController.kali();
                        }),
                        _buildOperationButton("÷", Colors.red, () {
                          kalkulatorController.bagi();
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Result Card
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.green[300]!, Colors.green[500]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Obx(() => CustomText(
                  text: "🎯 Hasil: ${kalkulatorController.hasil.value}",
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            const SizedBox(height: 24),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    myText: "🔄 Reset",
                    onPressed: () {
                      kalkulatorController.reset();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    myText: "⚽ Football Page",
                    onPressed: () {
                      Get.toNamed(AppRoutes.footballPage);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildOperationButton(String symbol, Color color, VoidCallback onPressed) {
  return Container(
    width: 60,
    height: 60,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Center(
          child: Text(
            symbol,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}}