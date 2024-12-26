import 'package:flutter/cupertino.dart';

class PopupTextfieldQuantityRequest {
  final IconData? icon;
  final String description;
  final Function(String) onTap;
  final String? editLabel;
  final String productDescription;
  final String unity;

  PopupTextfieldQuantityRequest({
    this.icon,
    required this.description,
    required this.onTap,
    this.editLabel,
    required this.productDescription,
    this.unity = '',
  });
}
