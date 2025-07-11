import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/util/image_pick_util.dart';

class DocumentVerificationUiController extends ChangeNotifier {
  //vehicle automation type

  List<String> vehicleAutomationType = [
    "Automatic",
    "Manual",
    "Semi-Automatic",
  ];

  String? _vehicleType;
  String? get vehicleType => _vehicleType;
  setVehicleAutomationType(String type) {
    _vehicleType = type;
    notifyListeners();
  }

  //
  Widget vehicleTypeDropDow() {
    return Consumer<DocumentVerificationUiController>(
      builder: (context, provider, child) {
        final items = provider.vehicleAutomationType
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList();
        return DropdownButtonFormField<String>(
          items: items,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
          ),
          onChanged: (newValue) => provider.setVehicleAutomationType(newValue!),
        );
      },
    );
  }

  //images

  //driver image
  File? driverImageFile;

  void setDriverImage(File image) {
    driverImageFile = image;
    notifyListeners();
  }

  void pickDriverImage({required BuildContext context}) async {
    final pickedFile = await ImagePickUtil.pickImage(context: context);
    if (pickedFile!.path.isNotEmpty) {
      setDriverImage(pickedFile);
    }
  }

  //id card image
  File? idCartImageFile;

  void setIdCartImage(File image) {
    idCartImageFile = image;
    notifyListeners();
  }

  void setIdCartImageFile({required BuildContext context}) async {
    final pickedFile = await ImagePickUtil.pickImage(context: context);
    if (pickedFile!.path.isNotEmpty) {
      setIdCartImage(pickedFile);
    }
  }

  //licence image
  File? licenceImageFile;
  void setLicenceImage(File image) {
    licenceImageFile = image;
    notifyListeners();
  }

  void setLicenceImageFile({required BuildContext context}) async {
    final pickedFile = await ImagePickUtil.pickImage(context: context);
    if (pickedFile!.path.isNotEmpty) {
      setLicenceImage(pickedFile);
    }
  }

  //driver details
  File? driverDetailsImageFile;

  void setDriverDetailsImage(File image) {
    driverDetailsImageFile = image;
    notifyListeners();
  }

  void setDriverDetailsImageFile({required BuildContext context}) async {
    final pickedFile = await ImagePickUtil.pickImage(context: context);
    if (pickedFile!.path.isNotEmpty) {
      setDriverDetailsImage(pickedFile);
    }
  }
}
