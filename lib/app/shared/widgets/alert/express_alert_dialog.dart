import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../style/style_theme.dart';
import '../button/express_button.dart';

@immutable
class ExpressAlertDialog extends StatelessWidget {
  final String message;
  final String? imagePath;
  final String? buttonLabel;
  final VoidCallback? closeAction;
  final VoidCallback? leaveStoreAction;
  final Function? action;
  final bool showCloseButton;
  final bool isButtonAuxVisible;
  final VoidCallback? auxAction;
  final String labelButtonAux;

  const ExpressAlertDialog({
    super.key,
    required this.message,
    this.action,
    this.imagePath,
    this.buttonLabel,
    this.closeAction,
    this.leaveStoreAction,
    this.showCloseButton = true,
    this.isButtonAuxVisible = false,
    this.auxAction,
    this.labelButtonAux = 'Voltar',
  });

  @override
  Widget build(BuildContext context) {
    final bool isServerError = message.contains('Erro de conexão com o servidor');

    final backButton = showCloseButton
        ? GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.red,
                ),
                child: Icon(
                  Icons.close,
                  color: Style.theme.buttonTextColor,
                  size: Style.size.size24,
                ),
              ),
            ),
            onTap: () async {
              if (closeAction != null) {
                closeAction!();
                // return;
              }
              //   Navigator.of(context).pop();
              Modular.to.pop();
            },
          )
        : const SizedBox();

    final closeHeader = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [backButton],
    );

    final centerImage = Image.asset(
      isServerError ? '' : imagePath ?? 'images/error_large.png',
      fit: BoxFit.contain,
      height: Style.size.size60,
      width: Style.size.size60,
    );

    final centerMessage = Text(
      message,
      style: Style.fieldStyle.medium16(
        textColor: Style.theme.primaryTextColor,
      ),
      textAlign: TextAlign.center,
    );

    final actionButton = action != null
        ? ExpressButton(
            label: buttonLabel ?? "Tentar novamente",
            onTapped: () {
              action!();
              //Navigator.of(context).pop();
            },
            textColor: Style.theme.buttonTextColor,
            backgroundColor: Style.theme.buttonColor,
          )
        : const SizedBox();

    return Material(
      color: Colors.transparent,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 150,
            minHeight: 150,
            maxWidth: 312,
            maxHeight: 500,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Style.theme.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                closeHeader,
                centerImage,
                Style.spacing.space10,
                centerMessage,
                Style.spacing.space16,
                actionButton,
                Visibility(
                  visible: isButtonAuxVisible,
                  child: ExpressButton(
                    onTapped: () {
                      if (auxAction != null) {
                        auxAction!();
                        return;
                      }
                      Modular.to.pop();
                    },
                    label: labelButtonAux,
                    textColor: Style.theme.textSplashColor,
                    backgroundColor: Colors.transparent,
                    labelStyle: Style.fieldStyle.medium16(
                      textColor: Style.theme.textSplashColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leaveStoreAction != null ? getLeaveStoreWidget(context) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getLeaveStoreWidget(BuildContext context) {
    return Padding(
      padding: Style.edgeInsets.tsd,
      child: GestureDetector(
        child: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(bottom: 64),
          child: Text(
            "Abandonar loja",
            style: Style.fieldStyle.small14(
              textColor: Style.theme.primaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        onTap: () {
          if (leaveStoreAction != null) {
            leaveStoreAction!();
          }
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
