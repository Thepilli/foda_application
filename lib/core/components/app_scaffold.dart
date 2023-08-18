import 'package:flutter/material.dart';
import 'package:foda/core/themes/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;

  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppTheme.size(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            gradient: backgroundColor != null
                ? null
                : const RadialGradient(
                    radius: 1.5,
                    colors: [
                      AppColors.scaffoldMiddle,
                      AppColors.blackColor,
                    ],
                  )),
        height: size.height,
        width: size.width,
        child: body,
      ),
    );
  }
}
