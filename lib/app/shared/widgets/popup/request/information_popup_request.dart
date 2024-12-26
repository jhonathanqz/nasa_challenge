import 'package:flutter/material.dart';

class InformationPopupRequest {
  final String title;
  final String message;
  final String? confirmText;
  final Function()? ontap;
  final IconData? icon;

  InformationPopupRequest({
    required this.title,
    required this.message,
    this.confirmText,
    this.ontap,
    this.icon,
  });
}
