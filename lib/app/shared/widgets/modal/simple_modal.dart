import 'package:flutter/material.dart';

import '../../style/style_theme.dart';
import '../button/express_button.dart';

class SimpleModal extends StatelessWidget {
  const SimpleModal({
    super.key,
    required this.title,
    required this.subtitle,
    this.backText = 'Voltar',
    this.nextText = 'Continuar',
    required this.backTap,
    required this.nextTap,
  });

  final String title;
  final String subtitle;
  final String backText;
  final String nextText;
  final Function() backTap;
  final Function() nextTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Style.edgeInsets.mdAll,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: Style.fieldStyle.titleBold.copyWith(fontSize: 18),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Style.spacing.sm,
          Text(
            subtitle,
            style: Style.fieldStyle.labelStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: Style.edgeInsets.hmd,
            child: ExpressButton(
              onTapped: nextTap(),
              label: nextText,
              backgroundColor: Style.theme.buttonColor,
              textColor: Style.theme.buttonTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
