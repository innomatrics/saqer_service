import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/document%20verification/widget/file_photo_viewer.dart';
import 'package:saqer_services/util/image_pick_util.dart';
import 'package:saqer_services/util/util.dart';
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

  void setDriver(File image) {
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
    if (pickedFile!.path.isNotEmpty && context.mounted) {
      setDriver(pickedFile);
      Navigator.pop(context);
      notifyListeners();
    }
  }

  //id card image
  File? idCartImageFile;

  void setIdCartFront(File image) {
    idCartImageFile = image;
    notifyListeners();
  }

  void setIdCartImageFront({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final File? pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty && context.mounted) {
      setIdCartFront(pickedFile);
      notifyListeners();
      Navigator.pop(context);
    }
  }

  //licence image
  File? licenseFrontSide;
  void setLicenceFront(File image) {
    licenseFrontSide = image;
    notifyListeners();
  }

  void setLicenceFfrontImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty && context.mounted) {
      setLicenceFront(pickedFile);
      notifyListeners();
      Navigator.pop(context);
    }
  }

  //licence backside
  File? idCartBackSideImage;

  void setIdCartBack(File image) {
    idCartBackSideImage = image;
    notifyListeners();
  }

  void setIdCartBackSideFile({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty && context.mounted) {
      setIdCartBack(pickedFile);
      notifyListeners();
      Navigator.pop(context);
    }
  }

  //driver details
  File? licenseBackSideImage;

  void setLicenseBackSide(File image) {
    licenseBackSideImage = image;
    notifyListeners();
  }

  void setLicenseBackSideImageFile({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final pickedFile = await ImagePickUtil.pickImage(
      context: context,
      source: source,
    );
    if (pickedFile!.path.isNotEmpty && context.mounted) {
      setLicenseBackSide(pickedFile);
      notifyListeners();
      Navigator.pop(context);
    }
  }

  //dotted border
  Widget customDottedBorders({
    required IconData logo,
    required String title,
    required BuildContext context,
    required File image,
    required Size size,
    required VoidCallback cameraOnTap,
    required VoidCallback galleryOnTap,
    required VoidCallback removeOnTap,
    required VoidCallback updateOnTap,
  }) {
    return InkWell(
      onTap: () {
        bottomSheetForCameraAndGallery(
          context: context,
          size: size,
          cameraOnTap: cameraOnTap,
          galleryOnTap: galleryOnTap,
        );
      },
      child: SizedBox(
        height: size.height * 0.12,
        width: size.width * 0.3,
        child: DottedBorder(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: image.path.isNotEmpty
                ? InkWell(
                    onTap: () {
                      bottomSheet(
                        context: context,
                        size: size,
                        child: Column(
                          spacing: size.height * 0.01,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text("View Image"),
                              onTap: () {
                                Navigator.pop(context);
                                justNavigate(
                                  context,
                                  FilePhotoViewer(imagePath: image),
                                );
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text("Update Image"),
                              onTap: updateOnTap,
                            ),
                            ListTile(
                              leading: const Icon(Icons.delete),
                              title: const Text("Delete Image"),
                              onTap: removeOnTap,
                            ),
                          ],
                        ),
                      );
                    },
                    child: Image.file(image, fit: BoxFit.cover),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(logo, size: 30, color: AppColors.mainColor),
                      const SizedBox(height: 5),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
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
