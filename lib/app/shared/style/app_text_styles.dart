import 'package:flutter/material.dart';

import 'style_theme.dart';

class AppTextStyles {
  static AppTextStyles? _instance;
  AppTextStyles._();
  static AppTextStyles getInstance() {
    return _instance ?? AppTextStyles._();
  }

  TextStyle small8({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 8,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle small10({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 10,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle small12({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 12,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle small14({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle medium16({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle medium18({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 18,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle medium20({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 20,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle big22({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 22,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle big25({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 25,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle big28({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 28,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle big32({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 32,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle big54({
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: 54,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  TextStyle title = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  TextStyle titleBold = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  TextStyle title25 = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  TextStyle title25Bold = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 25,
    fontWeight: FontWeight.w700,
  );

  TextStyle title16 = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  TextStyle title16Bold = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  TextStyle heading({bool isMobile = false}) => TextStyle(
        color: Style.theme.primaryTextColor,
        fontSize: isMobile ? 20 : 35,
      );

  TextStyle simple = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 14,
  );

  TextStyle titleButton = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  TextStyle textSnackInformation = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  TextStyle labelStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Style.theme.primaryTextColor,
    fontSize: 16,
  );

  TextStyle headingBold({bool isMobile = false}) => TextStyle(
        color: Style.theme.primaryTextColor,
        fontSize: isMobile ? 20 : 35,
        fontWeight: FontWeight.bold,
      );

  TextStyle simpleStyle = TextStyle(
    color: Style.theme.white,
    fontSize: 14,
  );

  TextStyle lighStyleBlack = TextStyle(
    fontWeight: FontWeight.w300,
    color: Style.theme.black,
    fontSize: 14,
  );

  TextStyle simpleDarkStyle = TextStyle(
    color: Style.theme.primaryTextColor,
    fontSize: 14,
  );
}
