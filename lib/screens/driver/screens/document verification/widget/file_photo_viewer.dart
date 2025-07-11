import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FilePhotoViewer extends StatelessWidget {
  final File imagePath;
  const FilePhotoViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width * 1,
      color: Colors.white,
      child: PhotoView(imageProvider: FileImage(imagePath)),
    );
  }
}
