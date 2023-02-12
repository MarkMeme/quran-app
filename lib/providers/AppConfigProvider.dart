import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  Future<void> changeLanguage(String newLanguage) async {
    if(newLanguage == appLanguage){
      return;
    }
    else{
      appLanguage = newLanguage ;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('lng',appLanguage);
    notifyListeners() ;
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if(newTheme == appTheme){
      return;
    }
    else{
      appTheme = newTheme ;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme',newTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners() ;
  }
}