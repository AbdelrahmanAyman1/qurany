import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'ar';
  bool isArabic = false;
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String lang) {
    languageCode = lang;
    languageCode == 'en' ? isArabic = true : isArabic = false;
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
