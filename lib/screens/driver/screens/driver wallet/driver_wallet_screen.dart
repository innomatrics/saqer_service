import 'package:flutter/material.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/add_wallet_money.dart';
import 'package:saqer_services/util/util.dart';

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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        tooltip: "Add Wallet Money",
        onPressed: () => justNavigate(context, const AddWalletMoney()),
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
              _customContainer(
                size: size,
                child: Column(
                  spacing: size.height * 0.02,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Informations",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        _customIcons(size: size, icon: Icons.edit),
                      ],
                    ),
                    _customText(text1: "Location: ", text2: "Dubai UAE"),
                    _customText(text1: "Address: ", text2: " UAE"),
                    _customText(text1: "Wallet ID: ", text2: "Dubai UAE"),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text(
                      "\$ 500",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
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
        _customIcons(size: size, icon: icon),
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

  Widget _customContainer({required Size size, required Widget child}) {
    return Container(
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
      child: child,
    );
  }

  Widget _customIcons({required Size size, required IconData icon}) {
    return Container(
      height: size.height * 0.05,
      width: size.width * 0.1,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Icon(icon, color: Colors.white)),
    );
  }

  Widget _customText({required String text1, required String text2}) {
    return Row(
      children: [
        Text(
          text1,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}
