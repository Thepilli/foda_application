import 'package:flutter/material.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: FodaButton(
          state: ButtonState.idle,
          label: 'label',
          onTap: () {},
          color: AppColors.completed,
        ),
      ),
    );
  }
}
