import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latihan1_11pplg2/pages/calculator_page.dart';
import 'package:latihan1_11pplg2/pages/football_player.dart';
import 'package:latihan1_11pplg2/pages/profile_page.dart';

class NavbarController extends GetxController {
  // Observable untuk current index
  var currentIndex = 0.obs;

  // List pages yang akan ditampilkan
  final List<Widget> pages = [
    CalculatorPage(),
    FootballPlayerPage(),
    const ProfilePage(),
  ];

  // List data untuk bottom navigation items
  final List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate),
      activeIcon: Icon(Icons.calculate_outlined),
      label: 'Calculator',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      activeIcon: Icon(Icons.sports_soccer_outlined),
      label: 'Players',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];

  // Method untuk change page
  void changePage(int index) {
    currentIndex.value = index;
  }

  // Method untuk get current page
  Widget get currentPage => pages[currentIndex.value];

  // Method untuk get page title
  String get currentTitle {
    switch (currentIndex.value) {
      case 0:
        return 'Calculator';
      case 1:
        return 'Football Players';
      case 2:
        return 'Profile';
      default:
        return 'App';
    }
  }

  // Method untuk get app bar color
  Color? get currentAppBarColor {
    switch (currentIndex.value) {
      case 0:
        return Colors.blue[600];
      case 1:
        return Colors.green[600];
      case 2:
        return Colors.purple[600];
      default:
        return Colors.blue[600];
    }
  }

  // Method untuk get icon badge (optional)
  bool hasNotification(int index) {
    // Contoh logic untuk notification badge
    if (index == 1) {
      // Misalnya players page ada notifikasi baru
      return true;
    }
    return false;
  }

  // Method untuk reset ke home page
  void goToHome() {
    currentIndex.value = 0;
  }

  // Method untuk navigate to specific page
  void navigateToPage(int index) {
    if (index >= 0 && index < pages.length) {
      currentIndex.value = index;
    }
  }
}