import 'package:flutter/cupertino.dart';

class ConfirmationPopupRequest {
  final String title;
  final String message;
  final String cancelText;
  final String confirmText;
  final Function() ontap;
  final Function()? ontapBack;
  final IconData? icon;
  final String? messageBold;
  final bool disableCloseButton;

  ConfirmationPopupRequest({
    required this.title,
    required this.message,
    required this.cancelText,
    required this.confirmText,
    required this.ontap,
    this.ontapBack,
    this.icon,
    this.messageBold,
    this.disableCloseButton = false,
  });
}
