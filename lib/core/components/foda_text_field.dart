import 'package:flutter/material.dart';

class FodaTextField extends StatelessWidget {
  const FodaTextField({
    super.key,
    required this.size,
    required this.label,
    this.isObscured = false,
    this.suffixIcon,
  });
  final Size size;
  final String label;
  final bool isObscured;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .9,
      child: TextFormField(
        obscureText: isObscured,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: label,
        ),
      ),
    );
  }
}
