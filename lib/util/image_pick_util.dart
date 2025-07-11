import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saqer_services/widgets/custom_snack_bar.dart';

class ImagePickUtil {
  static Future<File?> pickImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    try {
      File? image;
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
      return image;
    } catch (e) {
      if (context.mounted) {
        failedSnackBar(message: e.toString(), context: context);
      }
    }
    return null;
  }
}
