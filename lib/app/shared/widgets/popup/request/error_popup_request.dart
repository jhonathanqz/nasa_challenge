import 'package:flutter/material.dart';

class ErrorPopupRequest {
  final String title;
  final String message;
  final String? confirmText;
  final Function()? ontap;
  final IconData? icon;

  ErrorPopupRequest({
    required this.title,
    required this.message,
    this.confirmText,
    this.ontap,
    this.icon,
  });
}
