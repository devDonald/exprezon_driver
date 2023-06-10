import 'package:exprezon_driver/features/modules/views/home_screen.dart';
import 'package:exprezon_driver/helpers/close_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'helpers/get_theme.dart';
import 'locale/appwords.dart';
import 'features/intro_screens/splash_screen.dart';
import 'locale/currentlocale.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Status Bar Color
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color.fromARGB(255, 41, 41, 41),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  //Init Storage
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    closekeyboard(context);
    return GetMaterialApp(
      title: "ExprezonDr Driver",
      translations: ExprezonDrTexts(),
      locale: defaultLocale(),
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const HomeScreen(),
    );
  }
}
