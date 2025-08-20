import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/editplayer_kontroller.dart';
import 'package:latihan1_11pplg2/components/cutom_textfield.dart';
import 'package:latihan1_11pplg2/components/custom_text.dart';
import 'package:latihan1_11pplg2/components/custom_button.dart';

class EditPlayerPage extends StatelessWidget {
const EditPlayerPage({super.key});

@override
Widget build(BuildContext context) {
  final EditPlayerController editController = Get.put(EditPlayerController());
  
  // Ambil data dari Get.arguments dengan null check
  final args = Get.arguments;
  
  if (args == null) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Player'),
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('No player data provided'),
      ),
    );
  }
  
  final player = args['player'];
  
  // Set initial data
  editController.nameController.text = player.name;
  editController.jerseyController.text = player.jerseyNumber.toString();
  editController.positionController.text = player.position;

  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Edit Player',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[600],
      foregroundColor: Colors.white,
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomText(
                    text: "Edit Player Information",
                    color: Colors.green[600]!,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  CustomTextField(
                    controller: editController.nameController,
                    label: 'Nama Player',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  CustomTextField(
                    controller: editController.jerseyController,
                    label: 'Nomor Punggung',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  CustomTextField(
                    controller: editController.positionController,
                    label: 'Posisi',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  Obx(() => Text(
                    editController.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  myText: "❌ Cancel",
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  myText: "💾 Save",
                  onPressed: () {
                    editController.save();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}}