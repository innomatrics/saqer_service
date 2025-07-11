import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final String imagePath;
  const PhotoViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width * 1,
      color: Colors.white,
      child: PhotoView(
        imageProvider: CachedNetworkImageProvider(
          imagePath,
          cacheKey: imagePath,
        ),
      ),
    );
  }
}
