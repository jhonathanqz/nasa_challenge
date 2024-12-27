import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

@immutable
class ExpressButton extends StatelessWidget {
  final Function() onTapped;
  final String label;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double elevation;
  final bool isRightIconPosition;

  const ExpressButton({
    super.key,
    required this.onTapped,
    required this.label,
    this.labelStyle,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.elevation = 5,
    this.isRightIconPosition = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTapped,
      color: backgroundColor ?? Style.theme.buttonColor,
      elevation: elevation,
      padding: Style.edgeInsets.sd15All,
      child: icon != null
          ? Row(
              children: isRightIconPosition
                  ? [
                      Expanded(
                        child: Text(
                          label,
                          style: labelStyle ??
                              Style.fieldStyle.title.copyWith(
                                color: textColor ?? Style.theme.buttonTextColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        icon,
                        color: textColor ?? Style.theme.buttonTextColor,
                      )
                    ]
                  : [
                      Icon(
                        icon,
                        color: textColor ?? Style.theme.buttonTextColor,
                      ),
                      Expanded(
                        child: Text(
                          label,
                          style: labelStyle ??
                              Style.fieldStyle.title.copyWith(
                                color: textColor ?? Style.theme.buttonTextColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
            )
          : Text(
              label,
              style: labelStyle ??
                  Style.fieldStyle.title.copyWith(
                    color: textColor ?? Style.theme.buttonTextColor,
                  ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
