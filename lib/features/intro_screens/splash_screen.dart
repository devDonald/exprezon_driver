import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/network_handler.dart';
import '../../themes/theme_colors.dart';
import '../auth/views/login_screen.dart';
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

    if (isFirstTime != null && !isFirstTime && token==null) {
      prefs.setBool('first_time', false);
      Get.offAll(() => const LoginScreen());
      //Get.offAll(() => Onbording());
    } else if (isFirstTime != null && !isFirstTime && token!.isNotEmpty){
      prefs.setBool('first_time', false);
      Get.offAll(() => const Dashboard());
      //Get.offAll(() => Onbording());
    } else{
      prefs.setBool('first_time', false);
      Get.offAll(() => LoginScreen());
    }
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ExprezonColors.whiteColor,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child:Image.asset("assets/images/logo.png",
                  width: width * 0.79,
                  height: height * 0.300,)
            ),

          ]
        )
    );
  }
}