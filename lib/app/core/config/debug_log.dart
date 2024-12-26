import 'package:flutter/material.dart';

import 'app_environment_setup.dart';

abstract class DebugLog {
  static void print(String message) {
    if (AppEnvironmentSetup.appSetup.isDebugPrint) {
      debugPrint('***** $message');
    }
  }

  static void printOperation(String operation, dynamic message) {
    if (AppEnvironmentSetup.appSetup.isDebugPrint) {
      debugPrint('''
    *******************************
    ***** Operation: $operation
    ***** Log: $message
    ***** now: ${DateTime.now()}
    *******************************
    ''');
    }
  }

  static void payment(String message) {
    if (AppEnvironmentSetup.appSetup.isDebugPayment) {
      debugPrint('***** $message');
    }
  }
}
