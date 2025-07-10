import 'package:flutter/material.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';

class DriverLoginPage extends StatelessWidget {
  const DriverLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height * 1,
        width: size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            spacing: size.height * 0.02,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: "Name",
                maxLine: 1,
                controller: TextEditingController(),
              ),
              CustomTextFormField(
                labelText: "Email",
                maxLine: 1,
                controller: TextEditingController(),
              ),
              CustomTextFormField(
                labelText: "Phone Number",
                maxLine: 1,
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
