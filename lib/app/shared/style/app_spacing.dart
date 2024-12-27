import 'package:flutter/material.dart';

class AppSpacing {
  static AppSpacing? _instance;
  AppSpacing._();
  static AppSpacing getInstance() {
    return _instance ?? AppSpacing._();
  }

  final Widget min = const SizedBox(
    height: 5,
  );

  final Widget sm = const SizedBox(
    height: 10,
  );

  final Widget md = const SizedBox(
    height: 15,
  );

  final Widget xl = const SizedBox(
    height: 30,
  );

  final Widget smW = const SizedBox(
    width: 10,
  );

  final Widget mdW = const SizedBox(
    width: 15,
  );

  final Widget xlW = const SizedBox(
    width: 30,
  );

  final Widget minW = const SizedBox(
    width: 5,
  );

  final Widget spacingCardProduct = const SizedBox(
    width: 43,
    height: 20,
  );

  final Widget spaceAlert = const SizedBox(
    height: 2,
    width: 2,
  );

  //
  final SizedBox space4w = const SizedBox(width: 4);
  final SizedBox space6w = const SizedBox(width: 6);
  final SizedBox space10w = const SizedBox(width: 10);
  final SizedBox space12w = const SizedBox(width: 12);
  final SizedBox space20w = const SizedBox(width: 20);

  final SizedBox space4 = const SizedBox(height: 4);
  final SizedBox space8 = const SizedBox(height: 8);
  final SizedBox space10 = const SizedBox(height: 10);
  final SizedBox space12 = const SizedBox(height: 12);
  final SizedBox space15 = const SizedBox(height: 15);
  final SizedBox space16 = const SizedBox(height: 16);
  final SizedBox space18 = const SizedBox(height: 18);
  final SizedBox space20 = const SizedBox(height: 20);
  final SizedBox space24 = const SizedBox(height: 24);
  final SizedBox space26 = const SizedBox(height: 26);
  final SizedBox space30 = const SizedBox(height: 30);
  final SizedBox space32 = const SizedBox(height: 32);
  final SizedBox space40 = const SizedBox(height: 40);
  final SizedBox space44 = const SizedBox(height: 44);
  final SizedBox space50 = const SizedBox(height: 50);
  final SizedBox space60 = const SizedBox(height: 60);
  final SizedBox space64 = const SizedBox(height: 64);
  final SizedBox space65 = const SizedBox(height: 65);
  final SizedBox space100 = const SizedBox(height: 100);
}
