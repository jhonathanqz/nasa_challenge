import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'i_navigator.dart';

class AppNavigator implements INavigator {
  @override
  void pop() {
    if (Modular.to.canPop()) {
      Modular.to.pop();
    }
  }

  @override
  Future<void> popAndPushNamed(String routeName, {Object? arguments}) async {
    await Modular.to.popAndPushNamed(routeName, arguments: arguments);
  }

  @override
  void popUntil() {
    Modular.to.popUntil((p0) => false);
  }

  @override
  void push(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  @override
  void pushAndRemoveUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
      (_) => false,
    );
  }

  @override
  Future<void> pushNamed(String routeName, {Object? arguments}) async {
    await Modular.to.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<void> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) async {
    await Modular.to.pushNamedAndRemoveUntil(routeName, (p0) => false, arguments: arguments);
  }

  @override
  void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  @override
  Future<void> pushReplacementNamed(String routeName, {Object? arguments}) async {
    await Modular.to.pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future<void> removeUntil(String routeName, {Object? arguments}) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  @override
  Future<void> navigate(String routeName, {Object? arguments}) async {
    Modular.to.navigate(routeName, arguments: arguments);
  }

  @override
  bool canPop() {
    return Modular.to.canPop();
  }

  @override
  String get path => Modular.to.path;

  @override
  void popContext(BuildContext context) {
    Navigator.of(context).pop();
  }
}
