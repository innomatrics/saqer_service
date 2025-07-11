import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/document%20verification/controller/document_verification_ui_controller.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';

class DocumentVerificationPage extends StatefulWidget {
  const DocumentVerificationPage({super.key});

  @override
  State<DocumentVerificationPage> createState() =>
      _DocumentVerificationPageState();
}

class _DocumentVerificationPageState extends State<DocumentVerificationPage> {
  String? driverImagePath;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final driverUiController = context.read<DocumentVerificationUiController>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height * 1,
        width: size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            spacing: size.height * 0.02,
            children: [
              const SizedBox(height: 30),
              _buildImagePicker(isDriverImage: true),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer<DocumentVerificationUiController>(
                    builder: (context, provider, child) {
                      return provider.customDottedBorders(
                        logo: Icons.person,
                        title: "Driver License\n Front",
                        context: context,
                        image: provider.licenseFrontSide ?? File(""),
                        size: size,
                        cameraOnTap: () {
                          provider.setLicenceFfrontImage(
                            context: context,
                            source: ImageSource.camera,
                          );
                        },
                        galleryOnTap: () {
                          provider.setLicenceFfrontImage(
                            context: context,
                            source: ImageSource.gallery,
                          );
                        },
                      );
                    },
                  ),
                  Consumer<DocumentVerificationUiController>(
                    builder: (context, provider, child) {
                      return provider.customDottedBorders(
                        logo: Icons.person,
                        title: "Driver License\n Back",
                        context: context,
                        image: provider.licenseBackSideImage ?? File(""),
                        size: size,
                        cameraOnTap: () {
                          provider.setLicenseBackSideImageFile(
                            context: context,
                            source: ImageSource.camera,
                          );
                        },
                        galleryOnTap: () {
                          provider.setLicenseBackSideImageFile(
                            context: context,
                            source: ImageSource.gallery,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer<DocumentVerificationUiController>(
                    builder: (context, provider, child) {
                      return provider.customDottedBorders(
                        logo: Icons.person,
                        title: "Id Cart Front",
                        context: context,
                        image: provider.idCartImageFile ?? File(""),
                        size: size,
                        cameraOnTap: () {
                          provider.setIdCartImageFront(
                            context: context,
                            source: ImageSource.camera,
                          );
                        },
                        galleryOnTap: () {
                          provider.setIdCartImageFront(
                            context: context,
                            source: ImageSource.gallery,
                          );
                        },
                      );
                    },
                  ),
                  Consumer<DocumentVerificationUiController>(
                    builder: (context, provider, child) {
                      return provider.customDottedBorders(
                        logo: Icons.person,
                        title: "Id Cart Back",
                        context: context,
                        image: provider.idCartBackSideImage ?? File(""),
                        size: size,
                        cameraOnTap: () {
                          provider.setIdCartBackSideFile(
                            context: context,
                            source: ImageSource.camera,
                          );
                        },
                        galleryOnTap: () {
                          provider.setIdCartBackSideFile(
                            context: context,
                            source: ImageSource.gallery,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              CustomTextFormField(labelText: "Name", controller: controller),
              CustomTextFormField(labelText: "Email", controller: controller),
              CustomTextFormField(labelText: "Phone", controller: controller),
              driverUiController.dobPicker(controller: controller),
              CustomTextFormField(
                labelText: "Licence No",
                controller: controller,
              ),
              CustomTextFormField(
                labelText: "Address",
                controller: controller,
                maxLine: 3,
              ),
              CustomTextFormField(
                labelText: "Years of Experience",
                controller: controller,
              ),
              driverUiController.vehicleTypeDropDown(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker({required bool isDriverImage}) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: isDriverImage && driverImagePath != null
              ? AssetImage(driverImagePath!) as ImageProvider
              : null,
          child: isDriverImage && driverImagePath == null
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
        InkWell(
          onTap: () {},
          child: const CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.mainColor,
            child: Icon(Icons.edit, size: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
