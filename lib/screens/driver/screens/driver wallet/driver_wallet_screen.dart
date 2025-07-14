import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';

class DriverWalletScreen extends StatefulWidget {
  const DriverWalletScreen({super.key});

  @override
  State<DriverWalletScreen> createState() => _DriverWalletScreenState();
}

class _DriverWalletScreenState extends State<DriverWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            spacing: size.height * 0.02,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Wallet",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //card
              Container(
                padding: const EdgeInsets.all(16),
                height: size.height * 0.25,
                width: size.width * 1,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F6FA),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: size.height * 0.02,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Balance",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.mainColor,
                          ),
                          child: const Center(
                            child: Text(
                              "\$",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "\$ 500",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _customIncomeContainer(
                          size: size,
                          icon: Icons.keyboard_arrow_up,
                          text: "54000",
                        ),
                        _customIncomeContainer(
                          size: size,
                          icon: Icons.keyboard_arrow_down,
                          text: "54000",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customIncomeContainer({
    required Size size,
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          height: size.height * 0.05,
          width: size.width * 0.1,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Icon(icon, color: Colors.white)),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
