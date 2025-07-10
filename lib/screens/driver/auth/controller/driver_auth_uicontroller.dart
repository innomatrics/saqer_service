import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';

class DriverAuthUicontroller extends ChangeNotifier {
  //gender drop down
  List<String> genderTypes = ["Male", "Female", "Other"];

  String? selectedGender;

  void selectGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  Widget genderDropDown() {
    return Consumer<DriverAuthUicontroller>(
      builder: (context, provider, child) {
        final items = provider.genderTypes
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList();
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Gender",
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
          ),
          items: items,
          onChanged: (value) => provider.selectGender(value!),
        );
      },
    );
  }

  //checkbox
  bool _accepted = false;

  bool get acceptedTerms => _accepted;

  void setAccepted(bool value) {
    _accepted = value;
    notifyListeners();
  }

  Widget acceptedCheckBox() {
    return Consumer<DriverAuthUicontroller>(
      builder: (context, provider, child) {
        return Checkbox(
          activeColor: AppColors.mainColor,
          checkColor: Colors.white,
          value: provider.acceptedTerms,
          onChanged: (value) => provider.setAccepted(value!),
        );
      },
    );
  }
}
