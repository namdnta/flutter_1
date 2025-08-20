import 'package:get/get.dart';
import 'package:flutter/material.dart';

class KalkulatorController extends GetxController {
final txtAngkaPertama = TextEditingController();
final txtAngkaKedua = TextEditingController();
var hasil = ''.obs;

void tambah() {
  final angkaPertama = int.tryParse(txtAngkaPertama.text) ?? 0;
  final angkaKedua = int.tryParse(txtAngkaKedua.text) ?? 0;
  hasil.value = (angkaPertama + angkaKedua).toString();

 }

 void kurang() {
  final angkaPertama = int.tryParse(txtAngkaPertama.text) ?? 0;
  final angkaKedua = int.tryParse(txtAngkaKedua.text) ?? 0;
  hasil.value = (angkaPertama - angkaKedua).toString();

 }

 void kali() {
  final angkaPertama = int.tryParse(txtAngkaPertama.text) ?? 0;
  final angkaKedua = int.tryParse(txtAngkaKedua.text) ?? 0;
  hasil.value = (angkaPertama * angkaKedua).toString();

 }

 void bagi() {
  final angkaPertama = int.tryParse(txtAngkaPertama.text) ?? 0;
  final angkaKedua = int.tryParse(txtAngkaKedua.text) ?? 0;
  if (angkaKedua != 0) {
    hasil.value = (angkaPertama / angkaKedua).toString();

  } else {
    hasil.value = "Error: Tidak bisa dibagi nol";
  }
} 

void reset() {
  txtAngkaPertama.clear();
  txtAngkaKedua.clear();
  hasil.value = '';
}

}
