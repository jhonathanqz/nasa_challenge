import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';

@immutable
class AlertConfirm extends StatelessWidget {
  final String message;
  final Function() function;
  final VoidCallback? backFunction;
  final String? textConfirm;
  final String? textBack;
  final String title;
  final String? image;
  final IconData? icon;
  final bool isBackButton;
  const AlertConfirm({
    super.key,
    required this.title,
    required this.message,
    required this.function,
    this.backFunction,
    this.textConfirm,
    this.textBack,
    this.image,
    this.icon,
    this.isBackButton = true,
  });
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: Style.inputBorder.borderRadiusAll,
        ),
        elevation: 2,
        backgroundColor: Style.theme.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      icon ?? Icons.info,
                      size: 45,
                    ),
                  ),
                  Style.spacing.sm,
                  Center(
                    child: Text(
                      title,
                      style: Style.fieldStyle.titleBold.copyWith(
                        color: Style.theme.darkColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: Style.edgeInsets.tmd,
                      child: Text(
                        message,
                        style: Style.fieldStyle.title.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //content: Visibility(
        //  visible: isBackButton,
        //  child: ButtonPrimary(
        //    colorButton: colorButton,
        //    onTap: function,
        //    title: textConfirm!,
        //  ),
        //),
        actions: [
          Row(
            children: [
              Visibility(
                visible: isBackButton,
                child: Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.pressed)) {
                            return Style.theme.grey7;
                          }
                          return Style.theme.grey7; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      if (backFunction != null) {
                        backFunction!();
                        return;
                      }
                      Modular.to.pop();
                    },
                    child: Padding(
                      padding: Style.edgeInsets.vsd,
                      child: Text(
                        textBack ?? 'Voltar',
                        style: Style.fieldStyle.titleButton.copyWith(
                          color: Style.theme.lightTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              isBackButton ? Style.spacing.smW : Container(),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Style.theme.buttonColor;
                        }
                        return Style.theme.buttonColor; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: function,
                  child: Padding(
                    padding: Style.edgeInsets.vsd,
                    child: Text(
                      textConfirm ?? 'Sim',
                      style: Style.fieldStyle.titleButton.copyWith(
                        color: Style.theme.buttonTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
