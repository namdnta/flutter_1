import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/components/cutomTextfield.dart';
import 'package:latihan1_11pplg2/components/customText.dart';
import 'package:latihan1_11pplg2/components/customButton.dart';

class EditPlayerPage extends StatefulWidget {
  final Map<String, dynamic> player;

  const EditPlayerPage({super.key, required this.player});

  @override
  State<EditPlayerPage> createState() => _EditPlayerPageState();
}

class _EditPlayerPageState extends State<EditPlayerPage> {
  late TextEditingController nameController;
  late TextEditingController jerseyController;
  late TextEditingController positionController;

  @override
  void initState() {
    super.initState();
    // Isi TextField dengan data existing
    nameController = TextEditingController(text: widget.player["name"]);
    jerseyController = TextEditingController(text: widget.player["jerseyNumber"].toString());
    positionController = TextEditingController(text: widget.player["position"]);
  }

  @override
  void dispose() {
    nameController.dispose();
    jerseyController.dispose();
    positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      controller: nameController,
                      label: 'Nama Player',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      controller: jerseyController,
                      label: 'Nomor Punggung',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    CustomTextField(
                      controller: positionController,
                      label: 'Posisi',
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      ],
                    ),
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
                      // Update data player
                      widget.player["name"] = nameController.text;
                      widget.player["jerseyNumber"] = int.parse(jerseyController.text);
                      widget.player["position"] = positionController.text;
                      
                      Get.back();
                      Get.snackbar(
                        "Success", 
                        "Player updated successfully!",
                        backgroundColor: Colors.green[100],
                        colorText: Colors.green[800],
                      );
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