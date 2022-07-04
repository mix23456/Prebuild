import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkmode => themeMode == ThemeMode.dark;

  toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
