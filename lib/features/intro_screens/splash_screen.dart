import 'dart:async';
import 'package:exprezon_driver/features/auth/views/initial_auth.dart';
import 'package:exprezon_driver/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/assets.dart';
import '../../constants/sizes.dart';
import '../../services/network_handler.dart';

import '../modules/views/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void isFirstTime() async {
    var token = await NetworkHandler.getToken();

    SharedPreferences prefs = await SharedPreferences
        .getInstance(); //create an instance of shared preference class
    bool? isFirstTime = prefs.getBool('first_time');

    if (isFirstTime != null && !isFirstTime && token == null) {
      prefs.setBool('first_time', false);
      Get.offAll(() => const InitialAuthPage());
      //Get.offAll(() => Onbording());
    } else if (isFirstTime != null && !isFirstTime && token!.isNotEmpty) {
      prefs.setBool('first_time', false);
      Get.offAll(() => const Dashboard());
      //Get.offAll(() => Onbording());
    }
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() async {
    bool isLoggedIn = await getUserLoginStatuss();
    isLoggedIn ? Get.offAll(() => const Dashboard()) : isFirstTime();
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<bool> getUserLoginStatuss() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExprezonDrColors.iconbg,
      body: SizedBox(
        width: ExprezonDrSizes.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                ExprezonDrImages.appicon,
                width: ExprezonDrSizes.width(context) * 0.5000,
                height: ExprezonDrSizes.width(context) * 0.500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
