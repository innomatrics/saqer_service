import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/auth/components/otp_verify_page.dart';
import 'package:saqer_services/util/util.dart';
import 'package:saqer_services/widgets/custom_elevated_button.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';

class DriverLoginPage extends StatefulWidget {
  const DriverLoginPage({super.key});

  @override
  State<DriverLoginPage> createState() => _DriverLoginPageState();
}

class _DriverLoginPageState extends State<DriverLoginPage> {
  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
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
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: size.height * 0.2,
                width: size.width * 1,
                child: Image.asset(AppImages.appLogo),
              ),
              const Text(
                "Driver Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "We will send you a verification code",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: "Mobile Number",
                controller: mobileController,
              ),
              SizedBox(height: size.height * 0.2),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 1,
                child: CustomElevatedButton(
                  onPressed: () => justNavigate(context, const OtpVerifyPage()),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
