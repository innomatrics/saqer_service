import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  const CustomElevatedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = AppColors.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
