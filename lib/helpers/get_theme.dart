import 'package:exprezon_driver/constants/persistence.dart';
import 'package:exprezon_driver/themes/theme_data.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() {
  return box.read('themeIndex') == 1 ? lightTheme : darkTheme;
}
