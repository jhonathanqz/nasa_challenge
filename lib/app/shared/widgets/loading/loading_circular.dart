import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

loadingCircular() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Style.theme.loadingColor),
    ),
  );
}

loadingWithValue(double? value) {
  final progress = (value ?? 0) * 100;
  return Stack(
    alignment: Alignment.center,
    children: [
      CircularProgressIndicator(
        backgroundColor: Style.theme.white,
        color: Style.theme.loadingColor,
        strokeWidth: 4.0,
      ),
      Text(
        '${progress.toInt()} %', // Seu texto de progresso aqui
        style: const TextStyle(fontSize: 14),
      ),
    ],
  );
}
