import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

void bottomSheet({required BuildContext context, required Widget child}) {
  showMaterialModalBottomSheet(
    context: context,
    expand: true,
    builder: (context) => child,
  );
}
