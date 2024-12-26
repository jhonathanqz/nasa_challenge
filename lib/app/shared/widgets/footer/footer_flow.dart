import 'package:flutter/material.dart';

import '../../style/style_theme.dart';
import '../button/express_button.dart';

class FooterFlow extends StatelessWidget {
  const FooterFlow({
    super.key,
    required this.onBack,
    required this.onNext,
    this.labelBack,
    this.labelNext,
    this.isRemoveIcons = false,
  });

  final Function() onBack;
  final Function() onNext;
  final String? labelBack;
  final String? labelNext;
  final bool isRemoveIcons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ExpressButton(
            onTapped: onBack,
            label: labelBack ?? 'Voltar',
            icon: isRemoveIcons ? null : Icons.arrow_back_ios_new_rounded,
            backgroundColor: Style.theme.grey,
          ),
        ),
        Style.spacing.smW,
        Expanded(
          child: ExpressButton(
            onTapped: onNext,
            label: labelNext ?? 'Continuar',
            icon: isRemoveIcons ? null : Icons.arrow_forward_ios_rounded,
            isRightIconPosition: true,
          ),
        ),
      ],
    );
  }
}
