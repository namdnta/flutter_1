import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:latihan1_11pplg2/routes/pages.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.calculatorPage,
      getPages: AppPages.pages,
    );
  }
}

