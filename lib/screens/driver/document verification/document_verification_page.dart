import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';
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
              CustomTextFormField(labelText: "Name", controller: controller),
              CustomTextFormField(labelText: "Email", controller: controller),
              CustomTextFormField(
                labelText: "Licence No",
                controller: controller,
              ),
              CustomTextFormField(
                labelText: "Address",
                controller: controller,
                maxLine: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _customDottedBorders(
                    logo: Icons.person,
                    title: "Driver's License",
                    size: size,
                    image: File(""),
                  ),
                  _customDottedBorders(
                    image: File(""),
                    logo: Icons.camera_alt_outlined,
                    title: "Id Card Front",
                    size: size,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _customDottedBorders(
                    logo: Icons.camera_alt_outlined,
                    title: "Id Card Back",
                    size: size,
                    image: File(""),
                  ),
                  _customDottedBorders(
                    image: File(""),
                    logo: Icons.camera_alt_outlined,
                    title: "Id Card Front",
                    size: size,
                  ),
                ],
              ),
              CustomTextFormField(
                labelText: "Years of Experience",
                controller: controller,
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

  Widget _customDottedBorders({
    required IconData logo,
    required String title,
    required File image,
    required Size size,
  }) {
    return image.path.isEmpty
        ? SizedBox(
            height: size.height * 0.1,
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
                    child: Icon(logo, size: 30, color: AppColors.mainColor),
                  ),
                  Center(
                    child: Text(
                      title,
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
  }
}
