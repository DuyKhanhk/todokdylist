import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigo,
      brightness: Brightness.dark,
      // backgroundColor: const Color(0xFF212121),
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.indigo,
        onPrimary: Color(0xFFFFFFFF),
        secondary: Colors.indigoAccent,
        onSecondary: Colors.black87,
        error: Color(0xFFF32424),
        onError: Color(0xFFF32424),
        background: Color(0xFF202020),
        onBackground: Color(0xFF505050),
        surface: Colors.indigo,
        onSurface: Colors.white70,
      ),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
          titleMedium: TextStyle(
              color: Colors.black,
              fontFamily: 'kdyfont',
              fontSize: 20,
              fontWeight: FontWeight.w200)

          // subtitle1: TextStyle(color: Colors.white),
          ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 65, 65, 65),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 93, 117, 255),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'kdyfont', fontSize: 20, fontWeight: FontWeight.w500),
        selectedLabelStyle: TextStyle(
            fontFamily: 'kdyfont', fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigo,
      brightness: Brightness.light,
      // backgroundColor: const Color(0xFFE5E5E5),
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.indigo,
        onPrimary: Colors.white,
        secondary: Color(0xFFBBBBBB),
        onSecondary: Color(0xFFEAEAEA),
        error: Color(0xFFF32424),
        onError: Color(0xFFF32424),
        background: Colors.indigo,
        onBackground: Color(0xFFFFFFFF),
        surface: Color(0xFF54B435),
        onSurface: Color(0xFF54B435),
      ),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.indigo),
        ),
      ),
      textTheme: const TextTheme(
          // subtitle1: TextStyle(color: Colors.black),
          titleMedium: TextStyle(
              color: Colors.black,
              fontFamily: 'kdyfont',
              fontSize: 20,
              fontWeight: FontWeight.w200)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.indigo,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.indigo,
        unselectedLabelStyle: TextStyle(
            fontFamily: 'kdyfont', fontSize: 20, fontWeight: FontWeight.w500),
        selectedLabelStyle: TextStyle(
            fontFamily: 'kdyfont', fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),
  };
}
