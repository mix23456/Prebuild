import 'package:flutter/material.dart';
import 'package:responsive/constructor/colorpalette.dart';

class PresetTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor:
          ColorPalette().backgroundDarkLightmodePalette['Darkmode40%'],
      colorScheme: const ColorScheme.dark(),
      primaryColor:
          ColorPalette().backgroundDarkLightmodePalette['Darkmode30%'],
      iconTheme: IconThemeData(color: Colors.white, opacity: 0.8));

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor:
          ColorPalette().backgroundDarkLightmodePalette['Lightmode40%'],
      colorScheme: const ColorScheme.light(),
      primaryColor:
          ColorPalette().backgroundDarkLightmodePalette['Lightmode30%'],
      iconTheme: IconThemeData(color: Colors.black, opacity: 0.8));
}
