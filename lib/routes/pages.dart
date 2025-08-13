import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/editplayer.dart'; // harus EditPlayerPage

class AppPages{
  static final pages =[
    GetPage(name: AppRoutes.calculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: () => FootballPlayerPage()),
    GetPage(
      name: AppRoutes.editplayerPage,
      page: () {
        final player = Get.arguments;
        return EditPlayerPage(player: player);
      },
    ),
  ];
}