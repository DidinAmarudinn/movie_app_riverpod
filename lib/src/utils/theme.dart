import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_riverpod/src/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeConfig {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    indicatorColor: redColor,
       tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
        color: whiteColor
      ),
      labelColor: whiteColor
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    textTheme: const TextTheme(headline1: TextStyle(color: Colors.white)),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
    backgroundColor:
        drawerColor, // will be used as alternative background color
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    indicatorColor: redColor,
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(
        color: blackColor
      ),
       labelColor: blackColor
    ),
    
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    textTheme: const TextTheme(headline1: TextStyle(color: Colors.black)),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: redColor,
    backgroundColor: whiteColor,
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeModes _mode;
  ThemeNotifier({ThemeModes mode = ThemeModes.dark})
      : _mode = mode,
        super(ThemeConfig.darkModeAppTheme) {
    getTheme();
  }
  final key = "theme";
  ThemeModes get mode => _mode;
  void getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final theme = preferences.getString(key);
    if (theme == "light") {
      _mode = ThemeModes.light;
      state = ThemeConfig.lightModeAppTheme;
    } else {
      _mode = ThemeModes.dark;
      state = ThemeConfig.darkModeAppTheme;
    }
  }

  void toogleTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    if (_mode == ThemeModes.dark) {
      _mode = ThemeModes.light;
      state = ThemeConfig.lightModeAppTheme;
      preferences.setString(key, 'light');
    } else {
      _mode = ThemeModes.dark;
      state = ThemeConfig.darkModeAppTheme;
      preferences.setString(key, 'dark');
    }
  }
}
