import 'package:flutter/material.dart';

import '../style/style_theme.dart';

class SnackHelper {
  static void showSnackInformation(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 3,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Style.fieldStyle.textSnackInformation,
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }

  static void showSnackDark(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 3,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Style.fieldStyle.textSnackInformation.copyWith(
            color: Style.theme.primaryTextColor,
          ),
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }

  static void removeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
  }

  static void showSnackException(
    String message,
    Color color,
    BuildContext context, {
    int seconds = 5,
  }) {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Style.fieldStyle.textSnackInformation,
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: seconds,
        ),
      ),
    );
  }
}
