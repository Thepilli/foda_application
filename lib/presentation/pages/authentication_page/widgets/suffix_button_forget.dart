import 'package:flutter/material.dart';
import 'package:foda/core/themes/app_theme.dart';

class TextFieldForget extends StatelessWidget {
  const TextFieldForget({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: TextButton(
          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99))),
          onPressed: onPressed,
          child: Text(
            "Forgot?",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 15, color: AppColors.txtLight.withOpacity(.6)),
          )),
    );
  }
}
