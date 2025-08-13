import 'package:get/get.dart';
import 'package:latihan1_11pplg2/Model/playerModel.dart';

class FootballPlayerController extends GetxController {
 var players = <PlayerModel>[
    PlayerModel(name: "Ronaldo", position: "Forward", jerseyNumber: 7),
    PlayerModel(name: "Messi", position: "Forward", jerseyNumber: 10),
    PlayerModel(name: "Neymar", position: "Winger", jerseyNumber: 11),
  ].obs;
}