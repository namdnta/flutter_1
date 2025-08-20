import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1_11pplg2/controllers/navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController navbarController = Get.put(NavbarController());

    return Obx(() => Scaffold(
      body: navbarController.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navbarController.currentIndex.value,
        onTap: navbarController.changePage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: navbarController.currentAppBarColor,
        unselectedItemColor: Colors.grey[600],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        elevation: 10,
        items: navbarController.bottomNavItems,
      ),
    ));
  }
}