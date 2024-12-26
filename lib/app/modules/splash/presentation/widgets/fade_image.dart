import 'package:flutter/material.dart';

class FadeImage extends StatelessWidget {
  const FadeImage({
    super.key,
    required this.animation,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
  });
  final Animation<double> animation;
  final String imagePath;
  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: imageHeight,
            width: imageWidth,
          ),
        ],
      ),
    );
  }
}
