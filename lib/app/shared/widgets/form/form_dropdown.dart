import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

class FormDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<DropdownMenuItem<String>> items;
  final String hint;
  final void Function(String?) onChanged;

  const FormDropdown({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey[500]!,
        ),
      ),
      padding: Style.edgeInsets.cardSymetric,
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        hint: Padding(
          padding: Style.edgeInsets.vsd,
          child: Text(
            hint,
            style: Style.fieldStyle.title.copyWith(fontSize: 14),
          ),
        ),
        style: Style.fieldStyle.title.copyWith(fontSize: 14),
        underline: const SizedBox(),
        icon: Icon(
          Icons.expand_more_rounded,
          color: Style.theme.primaryColor,
        ),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
