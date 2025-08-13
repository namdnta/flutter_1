import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:latihan1_11pplg2/controllers/editplayer_kontroller.dart' as editplayer;
import 'package:latihan1_11pplg2/controllers/football_player_kontroller.dart' as football;
import 'package:latihan1_11pplg2/components/cutom_textfield.dart';
import 'package:latihan1_11pplg2/components/custom_text.dart';
import 'package:latihan1_11pplg2/components/custom_button.dart';
import 'package:latihan1_11pplg2/Model/player_model.dart' as model;

class EditPlayerPage extends StatelessWidget {
  final model.PlayerModel player;
  final int playerIndex;

  const EditPlayerPage({super.key, required this.player, required this.playerIndex});

@override
Widget build(BuildContext context) {
  final editplayer.EditPlayerController editController = Get.put(editplayer.EditPlayerController());
  final football.FootballPlayerController footballController = Get.find<football.FootballPlayerController>();

  // Set initial data - TAMBAHKAN INI
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
                        footballController.players[playerIndex] = editController.getEditedData() as model.PlayerModel;
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
          )],
      ),
    ]),
  ));
}}