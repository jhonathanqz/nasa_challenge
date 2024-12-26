// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class GramsToKgFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     String newText = newValue.text.replaceAll('.', '').replaceAll(',', '');

//     if (newText.isEmpty) return newValue; // Se o texto estiver vazio, retorne o valor atual

//     double grams = double.parse(newText) / 1000.0; // Converter de gramas para quilogramas

//     String newTextWithFraction = grams.toStringAsFixed(3); // Formatar para exibir até 3 casas decimais

//     // Verificar se o texto novo tem mais de 2 dígitos antes do ponto decimal
//     if (newTextWithFraction.contains('.')) {
//       String wholePart = newTextWithFraction.split('.')[0];
//       if (wholePart.length > 2) {
//         // Limitar a parte inteira a 2 dígitos
//         wholePart = wholePart.substring(0, 2);
//         newTextWithFraction = '$wholePart.${newTextWithFraction.split('.')[1]}';
//       }
//     }

//     return TextEditingValue(
//       text: newTextWithFraction,
//       selection: TextSelection.collapsed(offset: newTextWithFraction.length),
//     );
//   }
// }

import 'package:flutter/services.dart';

class GramsToKgFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('.', '').replaceAll(',', '');

    if (newText.isEmpty) return newValue;
    double grams = double.parse(newText) / 1000.0;

    String newTextWithFraction = grams.toStringAsFixed(3);
    if (newTextWithFraction.contains('.')) {
      String wholePart = newTextWithFraction.split('.')[0];
      if (wholePart.length > 2) {
        wholePart = wholePart.substring(0, 2);
        newTextWithFraction = '$wholePart.${newTextWithFraction.split('.')[1]}';
      }
    }

    return TextEditingValue(
      text: newTextWithFraction,
      selection: TextSelection.collapsed(offset: newTextWithFraction.length),
    );
  }
}
