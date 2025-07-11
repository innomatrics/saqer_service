import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/bottom%20nav/bottom_nav_bar.dart';
import 'package:saqer_services/screens/driver/screens/document%20verification/controller/document_verification_ui_controller.dart';
import 'package:saqer_services/screens/driver/provider/driver_document_provider.dart';
import 'package:saqer_services/util/util.dart';
import 'package:saqer_services/widgets/custom_elevated_button.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';
import 'package:saqer_services/widgets/loader.dart';

class DocumentVerificationPage extends StatefulWidget {
  const DocumentVerificationPage({super.key});

  @override
  State<DocumentVerificationPage> createState() =>
      _DocumentVerificationPageState();
}

class _DocumentVerificationPageState extends State<DocumentVerificationPage> {
  String? driverImagePath;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController yearsOfExperienceController =
      TextEditingController();
  final TextEditingController licenceNumberController = TextEditingController();

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
              CustomTextFormField(
                labelText: "Name",
                controller: nameController,
              ),
              CustomTextFormField(
                labelText: "Email",
                controller: emailController,
              ),
              CustomTextFormField(
                labelText: "Phone",
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                prefixIcon: Text(
                  "+971",
                  style: TextStyle(color: Colors.grey.shade300),
                ),
                maxLength: 10,
              ),
              driverUiController.dobPicker(controller: dobController),
              CustomTextFormField(
                labelText: "Licence No",
                controller: licenceNumberController,
              ),
              CustomTextFormField(
                labelText: "Address",
                controller: addressController,
                maxLine: 3,
              ),
              CustomTextFormField(
                labelText: "City",
                controller: cityController,
              ),
              CustomTextFormField(
                labelText: "Years of Experience",
                controller: yearsOfExperienceController,
              ),
              driverUiController.vehicleTypeDropDown(),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 1,
                child:
                    Consumer2<
                      DriverDocumentProvider,
                      DocumentVerificationUiController
                    >(
                      builder: (context, provider, uiController, child) {
                        final isLoading = provider.isLoader;
                        return CustomElevatedButton(
                          child: isLoading
                              ? const Loader()
                              : const Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          onPressed: () async {
                            final int age = uiController.calculateAge(
                              DateTime.parse(dobController.text),
                            );
                            final bool
                            isSuccess = await provider.addDriverDetails(
                              context: context,
                              name: nameController.text,
                              email: emailController.text,
                              mobileNumber: phoneNumberController.text,
                              age: age,
                              dob: DateTime.parse(dobController.text),
                              address: addressController.text,
                              city: cityController.text,
                              driverImage: uiController.driverImageFile!,
                              idCartImage: uiController.idCartImageFile!,
                              licenceImage: uiController.licenseFrontSide!,
                              licenceBack: uiController.licenseBackSideImage!,
                              licenceNumber: licenceNumberController.text,
                              yearsOfExperience: int.parse(
                                yearsOfExperienceController.text,
                              ),
                              joinedAt: Timestamp.now(),
                              vehicleAutomationType: uiController.vehicleType!,
                            );

                            if (isSuccess && context.mounted) {
                              justNavigateReplacement(
                                context,
                                const BottomNavBar(),
                              );
                            }
                          },
                        );
                      },
                    ),
              ),
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
