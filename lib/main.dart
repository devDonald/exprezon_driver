import 'package:exprezon_driver/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/intro_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Gideon's 300",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ExprezonColors.primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}


