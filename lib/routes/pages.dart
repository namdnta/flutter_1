import 'package:get/get.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/editplayer.dart'; // harus EditPlayerPage

class AppPages{
  static final pages =[
    GetPage(name: AppRoutes.calculatorPage, page: () => const CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: () => const FootballPlayerPage()),
    GetPage(
      name: AppRoutes.editplayerPage,
      page: () {
        final args = Get.arguments;
        final player = args['player'];
        final index = args['index'];
        return EditPlayerPage(player: player, playerIndex: index);
      },
    ),
  ];
}