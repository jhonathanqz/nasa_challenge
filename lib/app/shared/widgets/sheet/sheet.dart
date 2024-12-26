import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

class Sheet extends StatelessWidget {
  final Widget child;
  final double? height;
  const Sheet({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Style.theme.shadow,
                spreadRadius: 10,
                blurRadius: 20,
                offset: const Offset(0, 0),
              ),
            ],
            color: Style.theme.white,
          ),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(10),
          height: height ?? MediaQuery.of(context).size.height * 0.87,
          width: MediaQuery.of(context).size.width * 0.95,
          child: child,
        ),
      ),
    );
  }
}
