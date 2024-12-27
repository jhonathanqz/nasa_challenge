import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();
  static AppColors getInstance() {
    return _instance ?? AppColors._();
  }

  final Color primaryColor = const Color(0xff030140); //0xFF3f454f
  // final Color primaryColor = const Color.fromARGB(255, 27, 177, 0); //0xFF3f454f
  final Color accentColor = const Color(0xFF8D9FA6);
  final Color lightColor = const Color(0xFFfc6a4c);
  final Color mediumColor = const Color(0xFF154A5F);
  final Color mediumDarkColor = const Color(0xFF154A5F);
  final Color splashColor = const Color(0xff404040);
  final Color darkColor = const Color(0xff732257); //0xFF435359
  final Color loadingColor = const Color.fromARGB(255, 255, 255, 255);
  final Color primaryOrange = const Color(0xff732257);

  final Color primaryTextColor = const Color(0xFF303030);
  final Color lightTextColor = Colors.white;
  final Color textSplashColor = Colors.white;
  final Color accentTextColor = const Color(0xFFd8300c);
  final Color appBarColor = const Color(0xff030140); //0xFF70848C
  final Color background = Colors.grey[100]!;
  final Color backgroundCard = Colors.grey[200]!;
  final Color iconColor = Colors.white;
  final Color blurredBackground = Colors.black45;
  final Color borderDark = Colors.black;

  //Colors
  final Color black = Colors.black;
  final Color white = Colors.white;
  final Color grey = Colors.grey;
  final Color mediumGrey = Colors.grey[400]!;
  final Color grey3 = Colors.grey.shade300;
  final Color grey4 = Colors.grey.shade400;
  final Color grey7 = Colors.grey[700]!;
  final Color lightGreen = const Color(0xFF57C79A);
  final Color lightRed = const Color(0xff732257);
  final Color redInformation = Colors.red[800]!;
  final Color greenInformation = Colors.lightGreen[800]!;
  final Color green = const Color.fromARGB(255, 89, 163, 36);
  final Color yellowInformation = Colors.yellow[700]!;
  final Color yellowInformation900 = Colors.yellow[800]!;
  final Color lightOrange = Colors.orangeAccent[100]!;
  final Color redColor = Colors.red;
  //Buttons
  // final Color buttonColor = Colors.green.shade800;
  final Color buttonColor = Color(0xff732257);
  final Color buttonTextColor = Colors.white;
  final Color buttonIconColor = Colors.white;

  final Color shadow = const Color(0x4D787878);
  final Color barrier = const Color(0x99C6C6C6);
  final Color blue = Colors.blue;
}
