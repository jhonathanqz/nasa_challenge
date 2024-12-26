import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../loading/loading_circular.dart';

class CacheImageWidget extends StatelessWidget {
  final String imageUrl;
  final Color iconColor;
  final bool isVisibilityError;
  final BoxFit? fit;
  final bool isProduct;
  final String? imageErrorPath;

  const CacheImageWidget({
    super.key,
    required this.imageUrl,
    this.iconColor = Colors.black,
    this.isVisibilityError = true,
    this.fit,
    this.imageErrorPath,
    this.isProduct = true,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: key,
      fit: fit ?? BoxFit.contain,
      imageUrl: imageUrl,
      fadeInDuration: const Duration(milliseconds: 2500),
      fadeOutDuration: const Duration(milliseconds: 2500),
      cacheManager: DefaultCacheManager(),
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.contain,
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: loadingWithValue(downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => Visibility(
        visible: isVisibilityError,
        child: imageErrorPath != null ? Image.asset(imageErrorPath!) : Image.asset('assets/images/image_not_found.jpeg'),
      ),
    );
  }
}
