import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

class BaseHeader extends StatelessWidget {
  final List<InlineSpan> children;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? margin;

  const BaseHeader({
    super.key,
    required this.children,
    this.textAlign = TextAlign.start,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? Style.edgeInsets.vsd,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          style: Style.fieldStyle.heading(),
          children: children,
        ),
      ),
    );
  }
}
