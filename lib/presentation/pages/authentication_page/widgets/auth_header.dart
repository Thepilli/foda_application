import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String header;
  const AuthHeader({
    super.key,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Text(header, textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge);
  }
}
