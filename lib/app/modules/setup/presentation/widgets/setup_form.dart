import 'package:flutter/material.dart';

import '../../../../shared/style/style_theme.dart';
import '../../../../shared/widgets/header/base_header.dart';
import '../../../../shared/widgets/textfield/primary_textfield.dart';

class SetupForm extends StatelessWidget {
  const SetupForm({
    super.key,
    required this.nameController,
    required this.nameFocus,
    this.onChanged,
  });
  final TextEditingController nameController;
  final FocusNode nameFocus;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseHeader(
          children: [
            TextSpan(
              text: 'Olá, seja bem vindo(a)!',
              style: Style.fieldStyle.headingBold(),
            ),
            TextSpan(
              text: '\n\nPara começar, digite seu nome.',
              style: Style.fieldStyle.heading(),
            ),
          ],
        ),
        Style.spacing.xl,
        Style.spacing.xl,
        PrimaryTextField(
          controller: nameController,
          label: 'Nome',
          hintText: 'Digite seu nome',
          focusNode: nameFocus,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
