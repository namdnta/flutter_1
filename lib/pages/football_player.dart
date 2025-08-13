import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/football_player_kontroller.dart';
import 'package:latihan1_11pplg2/components/customText.dart';
import 'package:latihan1_11pplg2/pages/editplayer.dart';

class FootballPlayerPage extends StatelessWidget {
  FootballPlayerPage({super.key});

  final FootballPlayerController footballPlayerController = Get.put(FootballPlayerController());

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      title: const Text(
        'Football Players',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.green[600],
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    body: Container(
      margin: const EdgeInsets.all(16.0),
      child: Obx(
        () => ListView.builder(
          itemCount: footballPlayerController.players.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: footballPlayerController.players[index]["name"],
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      text: "Nomor punggung: ${footballPlayerController.players[index]["jerseyNumber"]}",
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      text: "Posisi: ${footballPlayerController.players[index]["position"]}",
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.left,
                    ),
                                         const SizedBox(width: 8),
                      const SizedBox(height: 8),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue[600], size: 20),
                          onPressed: () {
                            Get.to(() => EditPlayerPage(player: footballPlayerController.players[index], playerIndex: index));
                          },
                        ),
                      ),
                    ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}}