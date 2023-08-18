import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foda/core/settings/setting_controller.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_state.dart';
import 'package:foda/wrapper.dart';
import 'package:provider/provider.dart';

class FodaApp extends StatelessWidget {
  const FodaApp({super.key, required this.settingsController});
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    return ScreenUtilInit(
        designSize: const Size(411.4, 866.3),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AuthenticationState()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'FODA application',
              theme: AppTheme.theme,
              darkTheme: AppTheme.theme,
              themeMode: settingsController.themeMode,
              home: const Wrapper(),
            ),
          );
        });
  }
}
