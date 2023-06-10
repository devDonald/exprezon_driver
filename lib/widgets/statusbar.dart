import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExprezonDrStatusBar extends StatelessWidget {
  Color? color;
  ExprezonDrStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color:
          Get.isDarkMode ? Colors.black.withOpacity(.0) : color ?? Colors.teal,
    );
  }
}
