import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.label,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
    this.controller,
    this.enabled = true,
    this.inputFormatters,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.keyField,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.style,
    this.readOnly = false,
  });

  final String? label;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType textInputType;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Key? keyField;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? style;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: keyField,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      enabled: enabled,
      keyboardType: textInputType,
      obscureText: obscureText,
      focusNode: focusNode,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      enableInteractiveSelection: true,
      style: style,
      readOnly: readOnly,
      selectionControls: MaterialTextSelectionControls(),
      decoration: InputDecoration(
        errorText: errorText,
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
