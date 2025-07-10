import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final int? maxLine;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.maxLine,
    this.suffixIcon,
    this.validator,
    this.maxLength,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      validator: validator,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        counterText: "",
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorderColor),
        ),
      ),
    );
  }
}
