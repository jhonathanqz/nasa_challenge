import 'package:flutter/material.dart';

abstract interface class INavigator<T> {
  Future<void> pushNamed(String routeName, {Object? arguments});
  Future<void> popAndPushNamed(String routeName, {Object? arguments});
  void pop();
  void popContext(BuildContext context);
  Future<void> pushReplacementNamed(String routeName, {Object? arguments});
  Future<void> pushNamedAndRemoveUntil(String routeName, {Object? arguments});
  void push(BuildContext context, Widget widget);
  void pushReplacement(BuildContext context, Widget widget);
  void pushAndRemoveUntil(BuildContext context, Widget widget);
  Future<void> removeUntil(String routeName, {Object? arguments});
  void popUntil();
  Future<void> navigate(String routeName, {Object? arguments});
  bool canPop();
  String get path;
}
