import 'package:flutter/material.dart';

import '../../style/style_theme.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({
    super.key,
    required this.message,
    this.isEnabledImage = false,
    this.image,
  });
  final String message;
  final String? image;
  final bool isEnabledImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Style.edgeInsets.sdAll,
      child: Center(
        child: isEnabledImage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Style.size.plusSize,
                    width: Style.size.plusSize,
                    child: const Icon(Icons.help),
                  ),
                  Text(
                    message,
                    style: Style.fieldStyle.titleButton,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Text(
                message,
                style: Style.fieldStyle.titleButton,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
