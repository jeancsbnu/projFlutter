import 'package:flutter/material.dart';

class ThemeDataApp {
  ThemeData themeData = new ThemeData(
    //fontFamily: FontFamily.segoeUi,
    brightness: Brightness.light,
    //primaryColor: Color(0xFF12420b),
    primaryColor: Color(0xFF0B1C43),
    primaryColorBrightness: Brightness.light,
    //accentColor: Color(0xFFf0df5d),
    accentColor: Color(0xFFF0F1F2),
    accentColorBrightness: Brightness.light,
    backgroundColor: Color(0xFFFFFFFF),
  );

  ThemeData themeDataDark = new ThemeData(
    //fontFamily: FontFamily.segoeUi,
    brightness: Brightness.dark,
    primaryColor: Color(0xFF0B1C43),
    primaryColorBrightness: Brightness.dark,
    accentColor: Color(0xFF0B1C43),
    accentColorBrightness: Brightness.dark,
    backgroundColor: Color(0xFF0B1C43),
  );
}
