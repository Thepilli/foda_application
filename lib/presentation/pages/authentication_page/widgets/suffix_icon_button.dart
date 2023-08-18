import 'package:flutter/material.dart';
import 'package:foda/core/themes/app_theme.dart';

class SuffixIconButton extends StatelessWidget {
  final IconData icondata;
  final VoidCallback onPressed;
  const SuffixIconButton({
    super.key,
    required this.icondata,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icondata,
        color: AppColors.whiteColor.withOpacity(.8),
      ),
    );
  }
}
