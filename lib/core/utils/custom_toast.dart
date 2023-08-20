import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foda/core/themes/app_theme.dart';

void showCustomToast(String message, {Color? color, Color? textColor, bool isError = false}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? AppColors.notCompleted : (color ?? AppColors.blackColor),
      textColor: textColor ?? AppColors.whiteColor,
      fontSize: 16,
    );
