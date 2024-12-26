import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: Style.theme.darkColor,
    );
  }
}
