import 'package:cocoon/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? icon;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final double borderRadius;
  final double borderWidth;

  const CustomOutlineButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.label,
    this.backgroundColor = Colors.white,
    this.borderColor = AppColors.p1,
    this.textColor = AppColors.p1,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.textStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.borderRadius = 80,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox.shrink(),
      label: Text(label, style: textStyle.copyWith(color: textColor)),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
    );
  }
}