import 'package:get/get.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/pages/profile.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/editplayer.dart';

class AppPages{
  static final pages =[
    GetPage(name: AppRoutes.calculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballPage, page: () => FootballPlayerPage()),
    GetPage(
      name: AppRoutes.editplayerPage,
      page: () => const EditPlayerPage(),
    ),
    GetPage(name: AppRoutes.profilePage, page: () => const ProfilePage())
  ];
} 