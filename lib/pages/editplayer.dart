import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/editplayer_kontroller.dart';
import 'package:latihan1_11pplg2/controllers/football_player_kontroller.dart';
import 'package:latihan1_11pplg2/components/cutomTextfield.dart';
import 'package:latihan1_11pplg2/components/customText.dart';
import 'package:latihan1_11pplg2/components/customButton.dart';

class EditPlayerPage extends StatelessWidget {
  final Map<String, dynamic> player;
  final int playerIndex;

  EditPlayerPage({Key? key, required this.player, required this.playerIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditPlayerController editController = Get.put(EditPlayerController());
    final FootballPlayerController footballController = Get.find<FootballPlayerController>();

    // Set initial data
    editController.setInitialData(player);

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
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: editController.jerseyController,
                      label: 'Nomor Punggung',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: editController.positionController,
                      label: 'Posisi',
                    ),
                    const SizedBox(height: 16),
                    Obx(() => Text(
                      editController.errorMessage.value,
                      style: TextStyle(color: Colors.red),
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
                      if (editController.validate()) {
                        // Update list player di controller utama
                        footballController.players[playerIndex] = editController.getEditedData();
                        Get.back();
                        Get.snackbar(
                          "Success",
                          "Player updated successfully!",
                          backgroundColor: Colors.green[100],
                          colorText: Colors.green[800],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}