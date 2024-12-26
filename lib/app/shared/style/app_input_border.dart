import 'package:flutter/material.dart';

import 'style_theme.dart';

class AppInputBorder {
  static AppInputBorder? _instance;
  AppInputBorder._();
  static AppInputBorder getInstance() {
    return _instance ?? AppInputBorder._();
  }

  final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );

  final OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey[900]!,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  final OutlineInputBorder focusedInputBorderLight = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey[100]!,
    ),
    borderRadius: BorderRadius.circular(15),
  );

  final BoxDecoration borderRadius = BoxDecoration(
    color: Style.theme.white,
    borderRadius: BorderRadius.circular(10),
  );

  final BoxDecoration borderRadiusColor = BoxDecoration(
    color: Style.theme.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Style.theme.primaryColor,
    ),
  );

  final BoxDecoration borderRadiusBottom = BoxDecoration(
    color: Style.theme.white,
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(10),
      //bottomRight: Radius.circular(10),
    ),
  );

  final BoxDecoration roundedBorder = BoxDecoration(
    borderRadius: const BorderRadius.all(
      Radius.circular(20),
    ),
    border: Border.all(
      color: Style.theme.darkColor,
    ),
  );

  final BoxDecoration outlineBorder = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.grey[900]!,
      width: 1,
    ),
  );

  final BoxDecoration outlineBorderWhite = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.white,
      width: 1,
    ),
  );

  final BoxDecoration outlineBorderSelected = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Style.theme.buttonColor,
      width: 1,
    ),
  );

  final BorderRadius borderRadius25 = const BorderRadius.all(
    Radius.circular(25),
  );

  final BorderRadius borderRadiusAll = BorderRadius.circular(10);

  final BorderRadius borderRadiusRound = BorderRadius.circular(20);

  final Border borderInputInformation = Border.all(
    width: 2,
    color: Style.theme.white,
  );

  final Border borderInputInformationDark = Border.all(
    width: 2,
    color: Colors.grey,
  );

  final BoxDecoration boxCardSupplyPoints = BoxDecoration(
    color: Style.theme.grey3,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(30),
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ),
  );

  final BoxDecoration boxRadius4 = BoxDecoration(
    color: Style.theme.primaryColor,
    borderRadius: BorderRadius.circular(4),
  );
  final BoxDecoration stockBorder = BoxDecoration(
    color: Style.theme.primaryColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(4),
    ),
  );

  final BoxDecoration boxButton = BoxDecoration(
    color: Style.theme.primaryColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(50),
    ),
  );
}
