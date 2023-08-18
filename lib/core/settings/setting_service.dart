import 'package:flutter/material.dart';

class SettingsService {
//uses users preffered setting by default
  Future<ThemeMode> themeMode() async => ThemeMode.system;

//use with shared prefferences
  Future<void> updateThemeMode(ThemeMode theme) async {}
}
