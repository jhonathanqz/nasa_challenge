import 'package:flutter/material.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/shared/widgets/cache_image/cache_image_widget.dart';
import 'package:nasa_challenge/app/shared/widgets/cache_video/cache_video_widget.dart';

class ApodView extends StatelessWidget {
  const ApodView({
    super.key,
    required this.apodEntity,
    this.isHightQuality = false,
    this.height,
  });
  final ApodEntity apodEntity;
  final bool isHightQuality;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final url = isHightQuality ? apodEntity.hdurl : apodEntity.url;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: apodEntity.isImage ? CacheImageWidget(imageUrl: url) : CacheVideoWidget(videoUrl: url),
    );
  }
}
