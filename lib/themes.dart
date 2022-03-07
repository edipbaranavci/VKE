import 'package:flutter/material.dart';

class Temalar {
  final ligthTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,
    highlightColor: Colors.orange,
    buttonColor: Colors.black12,
    accentColor: Colors.white,
    indicatorColor: Colors.white,
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black,fontSize: 35),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    highlightColor: Colors.blue,
    buttonColor: Colors.white10,
    indicatorColor: Colors.white,
    accentColor: const Color(0xff303030),
    appBarTheme: const AppBarTheme(
      brightness: Brightness.dark,
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 35),
    ),
  );
}
