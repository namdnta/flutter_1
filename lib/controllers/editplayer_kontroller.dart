import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class FootballPlayerController extends GetxController {
  var players = <PlayerModel>[].obs;
}

class EditPlayerController extends GetxController {
  final nameController = TextEditingController();
  final jerseyController = TextEditingController();
  final positionController = TextEditingController();

  var errorMessage = ''.obs;
  late int playerIndex;

  @override
  void onInit() {
    super.onInit();
    // Ambil data dari Get.arguments
    final args = Get.arguments;
    if (args != null) {
      setInitialData(args['player']);
      playerIndex = args['index'];
    }
  }

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

  void save() {
    if (validate()) {
      final footballController = Get.find<FootballPlayerController>();
      footballController.players[playerIndex] = getEditedPlayer();
      Get.back();
      Get.snackbar(
        "Success", 
        "Player updated successfully!",
        backgroundColor: Colors.green[100],
        colorText: Colors.green[800],
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    jerseyController.dispose();
    positionController.dispose();
    super.onClose();
  }
}