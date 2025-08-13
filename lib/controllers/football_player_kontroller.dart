import 'package:get/get.dart';

class FootballPlayerController extends GetxController {
  var players = <Map<String, dynamic>>[
    {
      "name": "Ronaldo",
      "position": "Forward", 
      "jerseyNumber": 7
    },
    {
      "name": "Messi",
      "position": "Forward",
      "jerseyNumber": 10
    },
    {
      "name": "Neymar", 
      "position": "Winger",
      "jerseyNumber": 11
    }
  ].obs;
}