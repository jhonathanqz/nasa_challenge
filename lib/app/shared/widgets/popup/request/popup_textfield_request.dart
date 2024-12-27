import 'package:flutter/cupertino.dart';

class PopupTextfieldRequest {
  final IconData? icon;
  final String title;
  final String description;
  final Function(String) onTap;
  final String? editLabel;
  final bool obscureText;

  PopupTextfieldRequest({
    this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    this.editLabel,
    this.obscureText = false,
  });
}
