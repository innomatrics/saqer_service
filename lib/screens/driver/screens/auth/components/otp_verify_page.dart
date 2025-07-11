import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/document%20verification/document_verification_page.dart';
import 'package:saqer_services/util/util.dart';
import 'package:saqer_services/widgets/custom_elevated_button.dart';

class OtpVerifyPage extends StatefulWidget {
  final String phoneNumber;
  const OtpVerifyPage({super.key, required this.phoneNumber});

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              SizedBox(
                height: size.height * 0.3,
                width: size.width * 1,
                child: Image.asset(AppImages.appLogo),
              ),
              const SizedBox(height: 20),
              const Text(
                "Code Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Enter the OTP send to ${widget.phoneNumber}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              OtpTextField(
                showFieldAsBox: true,
                numberOfFields: 4,
                clearText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.inputBorderColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.inputBorderColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.inputBorderColor,
                    ),
                  ),
                ),
                fieldWidth: size.width * 0.14,
                onCodeChanged: (value) {},
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 1,
                child: CustomElevatedButton(
                  onPressed: () =>
                      justNavigate(context, const DocumentVerificationPage()),
                  color: AppColors.mainColor,
                  child: const Text(
                    "Sumbit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code? "),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(color: AppColors.mainColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
