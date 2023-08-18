import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foda/app.dart';
import 'package:foda/core/settings/setting_controller.dart';
import 'package:foda/core/settings/setting_service.dart';
import 'package:foda/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // GetItService.initializeService();
  await settingsController.loadSettings();
  runApp(FodaApp(
    settingsController: settingsController,
  ));
}
