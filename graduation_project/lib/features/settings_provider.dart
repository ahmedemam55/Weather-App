import 'package:flutter/material.dart';
import 'package:graduation_project/features/search/page/seach_view.dart';
import 'package:graduation_project/models/weather_model.dart';
import 'settings/pages/settings_view.dart';

class SettingsProvider extends ChangeNotifier {
  List<Widget> screens = [
    SearchView(),
    SettingsView(),
  ];

  int currentIndex = 0;

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String currentLanguage = "en";
  ThemeMode currentThemeMode = ThemeMode.dark;

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeTheme(ThemeMode newThemeMode) {
    if (currentThemeMode == newThemeMode) return;

    currentThemeMode = newThemeMode;
    notifyListeners();
  }

  bool isDark() {
    return currentThemeMode == ThemeMode.dark;
  }

  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
