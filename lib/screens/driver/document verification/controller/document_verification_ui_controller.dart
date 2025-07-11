import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/util/image_pick_util.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';

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
  Widget vehicleTypeDropDown() {
    return Consumer<DocumentVerificationUiController>(
      builder: (context, provider, child) {
        final items = provider.vehicleAutomationType
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList();
        return DropdownButtonFormField<String>(
          items: items,
          decoration: InputDecoration(
            hintText: "Vehicle Automation Type",
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

  void pickDriverImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
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

  void setIdCartImageFile({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final File? pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
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

  void setLicenceImageFile({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty) {
      setLicenceImage(pickedFile);
    }
  }

  //licence backside
  File? idCartBackSideImage;

  void setLicenceBacksideImage(File image) {
    idCartBackSideImage = image;
    notifyListeners();
  }

  void setIdCartBackSideImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty) {
      setLicenceBacksideImage(pickedFile);
    }
  }

  //driver details
  File? idCartBackSideImageFile;

  void setidCartBackSide(File image) {
    idCartBackSideImageFile = image;
    notifyListeners();
  }

  void setDriverDetailsImageFile({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty) {
      setidCartBackSide(pickedFile);
    }
  }

  //dotted border
  Widget customDottedBorders({
    required IconData logo,
    required String title,
    required File image,
    required Size size,
  }) {
    return Consumer<DocumentVerificationUiController>(
      builder: (context, provider, child) {
        return image.path.isEmpty
            ? GestureDetector(
                onTap: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(20),
                      height: size.height * 0.2,
                      width: size.width * 1,
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              if (title == "Driver's License") {
                                provider.setIdCartImageFile(
                                  context: context,
                                  source: ImageSource.camera,
                                );
                              } else if (title == "Driver's Licence\n Back") {
                                provider.setLicenceImageFile(
                                  context: context,
                                  source: ImageSource.camera,
                                );
                              } else if (title == "Id Card Front") {
                                provider.setIdCartImageFile(
                                  context: context,
                                  source: ImageSource.camera,
                                );
                              } else {
                                provider.setIdCartBackSideImage(
                                  context: context,
                                  source: ImageSource.camera,
                                );
                              }
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.image_outlined,
                              color: AppColors.mainColor,
                            ),
                            title: const Text(
                              "Gallery",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              if (title == "Driver's License") {
                                provider.setIdCartImageFile(
                                  context: context,
                                  source: ImageSource.gallery,
                                );
                              } else if (title == "Driver's Licence\n Back") {
                                provider.setLicenceImageFile(
                                  context: context,
                                  source: ImageSource.gallery,
                                );
                              } else if (title == "Id Card Front") {
                                provider.setIdCartImageFile(
                                  context: context,
                                  source: ImageSource.gallery,
                                );
                              } else {
                                provider.setIdCartBackSideImage(
                                  context: context,
                                  source: ImageSource.gallery,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                  log(title);
                },
                child: SizedBox(
                  height: size.height * 0.12,
                  width: size.width * 0.3,
                  child: DottedBorder(
                    options: const RectDottedBorderOptions(
                      dashPattern: [10, 5, 10, 5],
                      strokeWidth: 1,
                      color: AppColors.mainColor,
                      padding: EdgeInsets.all(16),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Icon(
                            logo,
                            size: 30,
                            color: AppColors.mainColor,
                          ),
                        ),
                        Center(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: size.height * 0.1,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
      },
    );
  }

  //date picker
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  void setDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  int calculateAge(DateTime dob) {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }

  Widget dobPicker({required TextEditingController controller}) {
    return Consumer<DocumentVerificationUiController>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDate: provider.selectedDate ?? DateTime(2000),
            );

            if (pickedDate != null) {
              provider.setDate(pickedDate);

              controller.text =
                  "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
            }
          },
          child: AbsorbPointer(
            child: CustomTextFormField(
              labelText: "Date of Birth",
              controller: controller,
            ),
          ),
        );
      },
    );
  }
}
