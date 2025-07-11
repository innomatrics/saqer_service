import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:saqer_services/constants/constants.dart';

void justNavigate(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void justNavigateReplacement(context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

void normalDialogBox({
  required BuildContext context,
  required String title,
  required Widget child,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: child,
    ),
  );
}

void bottomSheet({
  required BuildContext context,
  required Widget child,
  required Size size,
}) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.all(20),
      height: size.height * 0.3,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: child,
    ),
  );
}

void bottomSheetForCameraAndGallery({
  required BuildContext context,
  required Size size,
  required VoidCallback cameraOnTap,
  required VoidCallback galleryOnTap,
}) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => Container(
      padding: const EdgeInsets.all(20),
      height: size.height * 0.2,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.mainColor,
            ),
            title: const Text(
              "Camera",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: cameraOnTap,
          ),
          ListTile(
            leading: const Icon(
              Icons.image_outlined,
              color: AppColors.mainColor,
            ),
            title: const Text(
              "Gallery",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            onTap: galleryOnTap,
          ),
        ],
      ),
    ),
  );
}
