import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_calculator_app/theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData? _selectedTheme;
  late SharedPreferences prefs;

  ThemeProvider({bool isdark: false}) {
    this._selectedTheme = isdark ? darkTheme : lightTheme;
  }

  ThemeData? get geTheme => _selectedTheme;

  Future<void> changeTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == darkTheme) {
      _selectedTheme = lightTheme;
      await prefs.setBool('isDark', false);
    } else {
      _selectedTheme = darkTheme;
      await prefs.setBool('isDark', true);
    }
    notifyListeners();
  }
}
