import 'package:brainiaccommerce2/shared/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetWorkWidget extends StatelessWidget {
  const ImageNetWorkWidget({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      fit: BoxFit.cover,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator.adaptive(
          value: downloadProgress.progress,
          valueColor: AlwaysStoppedAnimation(kPrimaryColor),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
