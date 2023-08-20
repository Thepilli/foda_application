import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foda/core/themes/applystyle.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.scaffoldLight,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryLight,
      onPrimary: AppColors.onPrimaryLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.onSecondaryLight,
      surface: AppColors.primaryLight.withOpacity(.7),
      onSurface: AppColors.onPrimaryLight,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.scaffoldDark,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primaryDark,
      onPrimary: AppColors.onPrimaryDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.onSecondaryDark,
      surface: AppColors.primaryDark.withOpacity(.7),
      onSurface: AppColors.onPrimaryDark,
    ),
  );

//spaces
  static const double cardPadding = 20;
  static const double elementSpacing = cardPadding / .5;
  static const double bottomNavBarHeight = 64;
  static const double iconSize = cardPadding;
  static const Duration animationDuration = Duration(milliseconds: 400);
  static BorderRadius cardRadius = BorderRadius.circular(14);

  static const double buttonHeight = 70;

  static double fullyRounded = 99;
  static Size size(BuildContext context) => MediaQuery.of(context).size;

//textTheme
  static TextTheme textTheme = TextTheme(
    displayLarge: appstyle(30, AppColors.orange, FontWeight.w400),
    displayMedium: appstyle(27, AppColors.txtLight, FontWeight.w400),
    displaySmall: appstyle(21, AppColors.txtLight, FontWeight.w600),
    headlineMedium: appstyleNormal(20, AppColors.txtLight, FontWeight.w400),
    headlineSmall: appstyleNormal(18, AppColors.txtLight, FontWeight.w600),
    titleLarge: appstyleNormal(17, AppColors.txtLight, FontWeight.w400),
    titleMedium: appstyleNormal(15, AppColors.txtLight, FontWeight.w500),
    titleSmall: appstyleNormal(11, AppColors.txtLight, FontWeight.w500),
    bodyLarge: appstyleNormal(13, AppColors.txtLight, FontWeight.w500),
    bodyMedium: appstyleNormal(12, AppColors.txtLight, FontWeight.w500),
    bodySmall: appstyleNormal(11, AppColors.txtLight, FontWeight.w400),
    labelLarge: appstyleNormal(18, AppColors.txtLight, FontWeight.w500),
    labelSmall: appstyleNormal(8, AppColors.txtLight, FontWeight.w400),
  );

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    primaryColor: AppColors.red,
    hintColor: AppColors.whiteColor,
    indicatorColor: AppColors.red,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.purple),
      splashRadius: 24,
    ),
    iconTheme: const IconThemeData(color: AppColors.grey),
    splashColor: AppColors.red.withOpacity(.4),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.blackColor,
      filled: true,
      labelStyle: textTheme.bodyMedium,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.whiteColor.withOpacity(.8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: cardPadding),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(99),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(99),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(99),
      ),
    ),
    primaryIconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: AppColors.whiteColor,
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.red),
  );
}

class AppColors {
  static const scaffoldMiddle = Color(0xFF261C2D);
  static const navBarColor = Color(0xFF261C2D);
  static const buttonColor = Color(0xFF333060);

  const AppColors._();

  static const scaffoldLight = Color(0xFFF9CE60);
  static const primaryLight = Color(0xFF191818);
  static const onPrimaryLight = Color(0xFFDEDEDE);
  static const secondaryLight = Color(0xFFFFE9B1);
  static const onSecondaryLight = Color(0xFF191818);

  static const scaffoldDark = Color(0xFF181B2E);
  static const primaryDark = Color(0xFFED648D);
  static const onPrimaryDark = Color(0xFFFAC8D7);
  static const secondaryDark = Color(0xFF45485F);
  static const onSecondaryDark = Color(0xFFED648D);

  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const completed = Color(0xFFCCFBAD);
  static const notCompleted = Color(0xFFFFB0A6);
  static const txtLight = Colors.white;
  static const txtDark = Color(0xFF121212);
  static const gradient1 = Color(0xFFFF6363);
  static const gradient2 = Color(0xFF1F1D3A);
  static const gradient3 = Color(0xFFE7A864);
  static const gradient4 = Color(0xFFFF6D5B);

  static const red = Colors.red;
  static const blue = Colors.blue;
  static const yellow = Colors.yellow;
  static const green = Colors.green;
  static const orange = Colors.orange;
  static const purple = Colors.purple;
  static const grey = Color(0xFFABB2BF);

  static const backgroundColors = [
    Color(0xFFCCE5FF), // light blue
    Color(0xFFD7F9E9), // pale green
    Color(0xFFFFF8E1), // pale yellow
    Color(0xFFF5E6CC), // beige
    Color(0xFFFFD6D6), // light pink
    Color(0xFFE5E5E5), // light grey
    Color(0xFFFFF0F0), // pale pink
    Color(0xFFE6F9FF), // pale blue
    Color(0xFFD4EDDA), // mint green
    Color(0xFFFFF3CD), // pale orange
  ];
  static Color randomColor() {
    final random = Random();
    int randomIndex = random.nextInt(AppColors.backgroundColors.length);
    return AppColors.backgroundColors[randomIndex];
  }
}
