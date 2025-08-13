import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/Model/playerModel.dart';

// Dummy PlayerModel class
class PlayerModel {
  String name;
  int jerseyNumber;
  String position;

  PlayerModel({
    required this.name,
    required this.jerseyNumber,
    required this.position,
  });
}

// Dummy FootballPlayerController class
class FootballPlayerController extends GetxController {
  var players = <PlayerModel>[].obs;
}

class EditPlayerController extends GetxController {
  final nameController = TextEditingController();
  final jerseyController = TextEditingController();
  final positionController = TextEditingController();

  var errorMessage = ''.obs;

  void setInitialData(PlayerModel player) {
    nameController.text = player.name;
    jerseyController.text = player.jerseyNumber.toString();
    positionController.text = player.position;
  }

  PlayerModel getEditedPlayer() {
    return PlayerModel(
      name: nameController.text,
      jerseyNumber: int.tryParse(jerseyController.text) ?? 0,
      position: positionController.text,
    );
  }

  bool validate() {
    if (nameController.text.isEmpty ||
        jerseyController.text.isEmpty ||
        positionController.text.isEmpty) {
      errorMessage.value = 'All fields are required';
      return false;
    }
    errorMessage.value = '';
    return true;
  }

  void save(int index) {
    if (validate()) {
      final footballController = Get.find<FootballPlayerController>();
      footballController.players[index] = getEditedPlayer();
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    jerseyController.dispose();
    positionController.dispose();
    super.onClose();
  }

  PlayerModel getEditedData() {}
}