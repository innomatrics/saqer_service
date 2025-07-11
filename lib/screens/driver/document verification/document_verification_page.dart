import 'dart:io';
import 'package:flutter/material.dart';
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
                  driverUiController.customDottedBorders(
                    logo: Icons.person,
                    title: "Driver's License",
                    size: size,
                    image: File(""),
                  ),
                  driverUiController.customDottedBorders(
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
                  driverUiController.customDottedBorders(
                    logo: Icons.camera_alt_outlined,
                    title: "Id Card Back",
                    size: size,
                    image: File(""),
                  ),
                  driverUiController.customDottedBorders(
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
}
