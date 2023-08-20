import 'package:flutter/material.dart';
import 'package:foda/core/themes/app_theme.dart';

enum ButtonState { idle, loading, disabled }

enum CircleState { pressed, notPressed }

class FodaButton extends StatefulWidget {
  final String label;
  final double? width;
  final double? height;
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
    this.height = AppTheme.buttonHeight,
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
            height: widget.height,
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
                      widget.prefixIcon == null ? Container() : const SizedBox(width: 10),
                      Text(
                        widget.label,
                        style: widget.labelStyle ?? Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  )));
  }
}

class FodaCircleButton extends StatefulWidget {
  final double height;

  final VoidCallback onTap;

  final Widget icon;
  final Color? color;
  final List<Color> gradientColors;
  final CircleState? state;
  const FodaCircleButton({
    super.key,
    required this.height,
    required this.onTap,
    this.color = AppColors.buttonColor,
    this.gradientColors = const [],
    this.state = CircleState.notPressed,
    required this.icon,
  });

  @override
  State<FodaCircleButton> createState() => _FodaCircleButtonState();
}

class _FodaCircleButtonState extends State<FodaCircleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: widget.height,
        width: widget.height,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: widget.gradientColors.length > 1 ? widget.gradientColors : [widget.color!, widget.color!]),
          shape: BoxShape.circle,
        ),
        child: Center(child: widget.icon),
      ),
    );
  }
}
