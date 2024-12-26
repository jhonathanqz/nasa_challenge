import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/alert/express_alert_dialog.dart';

class DialogHelper {
  static void open({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = false,
  }) async {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => content,
      );
    }
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => content,
    );
  }

  static void omniAlert({
    required BuildContext context,
    required String message,
    bool barrierDismissible = false,
    String? imagePath,
    String? buttonLabel,
    VoidCallback? closeAction,
    VoidCallback? leaveStoreAction,
    Function? action,
    bool showCloseButton = true,
    bool isButtonAux = false,
    String? labelButtonAux,
    VoidCallback? functionAux,
  }) async {
    try {
      if (Platform.isIOS) {
        return showCupertinoDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          builder: (context) => ExpressAlertDialog(
            message: message,
            imagePath: imagePath,
            buttonLabel: buttonLabel,
            closeAction: closeAction,
            leaveStoreAction: leaveStoreAction,
            action: action,
            showCloseButton: showCloseButton,
            isButtonAuxVisible: isButtonAux,
            labelButtonAux: labelButtonAux ?? 'Voltar',
            auxAction: functionAux,
          ),
        );
      }
      showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => ExpressAlertDialog(
          message: message,
          imagePath: imagePath,
          buttonLabel: buttonLabel,
          closeAction: closeAction,
          leaveStoreAction: leaveStoreAction,
          action: action,
          showCloseButton: showCloseButton,
          isButtonAuxVisible: isButtonAux,
          labelButtonAux: labelButtonAux ?? 'Voltar',
          auxAction: functionAux,
        ),
      );
    } catch (e) {
      log('*****Erro ao renderizar alert: $e');
    }
  }
}
