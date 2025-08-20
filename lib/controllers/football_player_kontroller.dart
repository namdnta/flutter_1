import 'package:get/get.dart';
import 'package:latihan1_11pplg2/Model/player_model.dart';

class FootballPlayerController extends GetxController {
 var players = <PlayerModel>[
    PlayerModel(name: "Ronaldo", position: "Forward", jerseyNumber: 7, photoAsset: "asset/ronaldo.jpg"),
    PlayerModel(name: "Messi", position: "Forward", jerseyNumber: 10, photoAsset: "asset/messi.jpg"),
    PlayerModel(name: "Neymar", position: "Winger", jerseyNumber: 11, photoAsset: "asset/neymar.jpg"),
  ].obs;
}