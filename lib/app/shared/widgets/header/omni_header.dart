import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';

class OmniHeader extends StatelessWidget {
  const OmniHeader({
    super.key,
    this.logo,
    this.onTapClose,
    this.onTapBack,
    this.isBackButton = true,
  });
  final String? logo;
  final Function? onTapClose;
  final Function? onTapBack;
  final bool isBackButton;

  @override
  Widget build(BuildContext context) {
    final theme = Style.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !isBackButton
            ? Container(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 56.0),
                child: Image.asset(
                  logo ?? 'assets/images/logo_login.png',
                  fit: BoxFit.contain,
                  height: Style.size.size40,
                  width: Style.size.size122,
                ),
              )
            : GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: theme.buttonColor,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Style.theme.buttonTextColor,
                      size: Style.size.size24,
                    ),
                  ),
                ),
                onTap: () => _ontapBack(),
              ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: theme.buttonColor,
              ),
              child: Icon(
                Icons.close,
                color: Style.theme.buttonTextColor,
                size: Style.size.size24,
              ),
            ),
          ),
          onTap: () => _ontapClose(),
        ),
      ],
    );
  }

  void _ontapClose() {
    if (onTapClose != null) {
      onTapClose!();
      return;
    }
    Modular.to.pop();
  }

  void _ontapBack() {
    if (onTapBack != null) {
      onTapBack!();
      return;
    }
    Modular.to.pop();
  }
}
