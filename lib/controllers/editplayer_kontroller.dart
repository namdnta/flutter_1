import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditPlayerController extends GetxController {
  final nameController = TextEditingController();
  final jerseyController = TextEditingController();
  final positionController = TextEditingController();

  var errorMessage = ''.obs;

  // Untuk mengisi data awal dari player (Map)
  void setInitialData(Map<String, dynamic> player) {
    nameController.text = player['name'] ?? '';
    jerseyController.text = player['jerseyNumber']?.toString() ?? '';
    positionController.text = player['position'] ?? '';
  }

  // Fungsi ambil data hasil edit
  Map<String, dynamic> getEditedData() {
    return {
      'name': nameController.text,
      'jerseyNumber': int.tryParse(jerseyController.text) ?? 0,
      'position': positionController.text,
    };
  }

  // Validasi sebelum simpan
  bool validate() {
    if (nameController.text.isEmpty ||
        jerseyController.text.isEmpty ||
        positionController.text.isEmpty) {
      errorMessage.value = 'Semua kolom harus diisi!';
      return false;
    }
    errorMessage.value = '';
    return true;
  }

  @override
  void onClose() {
    nameController.dispose();
    jerseyController.dispose();
    positionController.dispose();
    super.onClose();
  }
}