import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.textColor,
  });
  final Function() onTap;
  final String label;
  final IconData icon;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Style.theme.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onTap,
      label: Padding(
        padding: Style.edgeInsets.vsd,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textColor ?? Style.theme.white,
          ),
        ),
      ),
      icon: Icon(
        icon,
        color: textColor ?? Style.theme.white,
      ),
    );
  }
}
