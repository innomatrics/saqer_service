import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:saqer_services/widgets/custom_snack_bar.dart';

class ImagePickUtil {
  static Future<File?> pickImage({required BuildContext context}) async {
    try {
      File? image;
      final List<String> allowedExtensions = ['jpg', 'jpeg', 'png'];
      final FilePickerResult? pickerResult = await FilePicker.platform
          .pickFiles(
            type: FileType.image,
            allowedExtensions: allowedExtensions,
            allowMultiple: false,
          );

      if (pickerResult!.files.isNotEmpty) {
        image = File(pickerResult.files.first.path!);
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
