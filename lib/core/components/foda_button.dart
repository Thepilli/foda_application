import 'package:flutter/material.dart';
import 'package:foda/core/themes/app_theme.dart';

enum ButtonState { idle, loading, diabled }

class FodaButton extends StatefulWidget {
  final String label;
  final double? width;
  final TextStyle? labelStyle;
  final ButtonState state;
  final Widget? prefixIcon;
  final List<Color> gradientColors;
  final Color? color;
  final Function()? onTap;
  const FodaButton({
    super.key,
    required this.label,
    this.labelStyle,
    this.state = ButtonState.idle,
    this.prefixIcon,
    this.gradientColors = const [],
    required this.onTap,
    this.color = Colors.transparent,
    this.width = 200,
  });

  @override
  State<FodaButton> createState() => _FodaButtonState();
}

class _FodaButtonState extends State<FodaButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
            width: widget.width,
            height: AppTheme.buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.fullyRounded),
              gradient: LinearGradient(
                  colors: widget.gradientColors.length > 1 ? widget.gradientColors : [widget.color!, widget.color!]),
            ),
            child: widget.state == ButtonState.loading
                ? const Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.prefixIcon == null ? Container() : widget.prefixIcon!,
                      const SizedBox(width: 10),
                      Text(
                        widget.label,
                        style: widget.labelStyle ?? Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  )));
  }
}
