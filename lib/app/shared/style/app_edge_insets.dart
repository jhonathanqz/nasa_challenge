import 'package:flutter/material.dart';

class AppEdgeInsets {
  static AppEdgeInsets? _instance;
  AppEdgeInsets._();
  static AppEdgeInsets getInstance() {
    return _instance ?? AppEdgeInsets._();
  }

  final EdgeInsets minStockAll = const EdgeInsets.symmetric(vertical: 1, horizontal: 2);

  final EdgeInsets minAll = const EdgeInsets.all(2);

  final EdgeInsets sdMin = const EdgeInsets.all(5);

  final EdgeInsets normal = const EdgeInsets.all(8);

  final EdgeInsets sdAll = const EdgeInsets.all(10);

  final EdgeInsets mmAll = const EdgeInsets.all(12);

  final EdgeInsets sd15All = const EdgeInsets.all(15);

  final EdgeInsets intAll = const EdgeInsets.all(20);

  final EdgeInsets mdAll = const EdgeInsets.all(24);

  final EdgeInsets xlAll = const EdgeInsets.all(30);

  final EdgeInsets headerSymmetric = const EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 15,
  );

  final EdgeInsets vmin = const EdgeInsets.symmetric(vertical: 5);

  final EdgeInsets vsd = const EdgeInsets.symmetric(vertical: 10);

  final EdgeInsets vsdm = const EdgeInsets.symmetric(vertical: 15);

  final EdgeInsets vmd = const EdgeInsets.symmetric(vertical: 20);

  final EdgeInsets hmin = const EdgeInsets.symmetric(horizontal: 5);

  final EdgeInsets hsd = const EdgeInsets.symmetric(horizontal: 10);

  final EdgeInsets hsdm = const EdgeInsets.symmetric(horizontal: 15);

  final EdgeInsets hmd = const EdgeInsets.symmetric(horizontal: 20);

  final EdgeInsets hxl = const EdgeInsets.symmetric(horizontal: 30);

  final EdgeInsets sdSymetric = const EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 10,
  );

  final EdgeInsets cardSymetric = const EdgeInsets.symmetric(
    vertical: 5,
    horizontal: 10,
  );

  final EdgeInsets tmin = const EdgeInsets.only(top: 5);

  final EdgeInsets tsd = const EdgeInsets.only(top: 10);

  final EdgeInsets tmd = const EdgeInsets.only(top: 15);

  final EdgeInsets txl = const EdgeInsets.only(top: 20);

  final EdgeInsets t30 = const EdgeInsets.only(top: 30);

  final EdgeInsets t40 = const EdgeInsets.only(top: 40);

  final EdgeInsets drawerHeader = const EdgeInsets.only(top: 60, bottom: 20);

  final EdgeInsets bmin = const EdgeInsets.only(bottom: 5);

  final EdgeInsets bsd = const EdgeInsets.only(bottom: 10);

  final EdgeInsets bmd = const EdgeInsets.only(bottom: 15);

  final EdgeInsets bxl = const EdgeInsets.only(bottom: 20);

  final EdgeInsets rmin = const EdgeInsets.only(right: 5);

  final EdgeInsets rsd = const EdgeInsets.only(right: 10);

  final EdgeInsets rsdplus = const EdgeInsets.only(right: 12);

  final EdgeInsets lmin = const EdgeInsets.only(left: 5);

  final EdgeInsets lsd = const EdgeInsets.only(left: 10);

  final EdgeInsets mlsd = const EdgeInsets.only(left: 15);

  final EdgeInsets onlyProduct = const EdgeInsets.only(
    top: 15,
    bottom: 3,
  );

  final EdgeInsets onlyObsCard = const EdgeInsets.only(
    bottom: 10,
    left: 15,
    right: 10,
  );

  final EdgeInsets priceCard = const EdgeInsets.only(
    bottom: 10,
    right: 10,
  );

  final EdgeInsets onlyAlert = const EdgeInsets.only(
    top: 30,
    bottom: 20,
  );

  final EdgeInsets buttonSelect = const EdgeInsets.symmetric(vertical: 5, horizontal: 20);

  final SliverGridDelegateWithFixedCrossAxisCount sliverGrid = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1.3,
  );
  final EdgeInsets spacingCardCart = const EdgeInsets.fromLTRB(10, 10, 10, 0);

  final EdgeInsets spacingCartAction = const EdgeInsets.only(bottom: 7, left: 10, right: 10);

  final EdgeInsets symmetricStock = const EdgeInsets.symmetric(vertical: 1, horizontal: 5);

  final EdgeInsets roundedTextfield = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 18,
  );

  final EdgeInsets addProductButton = const EdgeInsets.symmetric(
    vertical: 7,
    horizontal: 7,
  );

  final EdgeInsets addFuelButton = const EdgeInsets.symmetric(
    vertical: 7,
    horizontal: 7,
  );

  final EdgeInsets symetricSector = const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  );
}
