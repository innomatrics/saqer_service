import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/view%20model/credit_card_provider.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/money/ui%20controller/add_wallet_money_controller.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/view%20model/driver_wallet_provider.dart';
import 'package:saqer_services/widgets/custom_elevated_button.dart';
import 'package:saqer_services/widgets/custom_snack_bar.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';

class AddWalletMoney extends StatefulWidget {
  const AddWalletMoney({super.key});

  @override
  State<AddWalletMoney> createState() => _AddWalletMoneyState();
}

class _AddWalletMoneyState extends State<AddWalletMoney> {
  final amountController = TextEditingController();
  final CardSwiperController swiperController = CardSwiperController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          "Add Wallet Money",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        height: size.height * 0.07,
        width: double.infinity,
        child:
            Consumer3<
              CreditCardProvider,
              AddWalletMoneyController,
              DriverWalletProvider
            >(
              builder:
                  (context, cardProvider, uiController, driverWallet, child) {
                    return CustomElevatedButton(
                      onPressed: () async {
                        final selectedCard = cardProvider
                            .driverCreditCards[uiController.selectedCardIndex];
                        final enteredAmount = amountController.text.trim();

                        if (enteredAmount.isEmpty) {
                          warningSnackBar(
                            message: "Please enter amount",
                            context: context,
                          );
                          return;
                        }
                        final bool isSuccess = await driverWallet
                            .addMoneyToWallet(
                              context: context,
                              balance: double.parse(enteredAmount),
                              creditCards: selectedCard,
                            );
                        log("Amount: $enteredAmount");
                        log("Card: ${selectedCard.maskedNumber}");

                        if (isSuccess && context.mounted) {
                          successSnackBar(
                            message: "Amount added successfully",
                            context: context,
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        "Add Amount",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                child: Consumer2<CreditCardProvider, AddWalletMoneyController>(
                  builder: (context, creditCard, uiController, child) {
                    return CardSwiper(
                      controller: swiperController,
                      cardsCount: creditCard.driverCreditCards.length,
                      onSwipe: (previousIndex, currentIndex, direction) {
                        uiController.changeIndex = currentIndex!;
                        return true;
                      },
                      cardBuilder: (context, index, percentX, percentY) {
                        final card = creditCard.driverCreditCards[index];
                        return AbsorbPointer(
                          absorbing: true,
                          child: CreditCardWidget(
                            cardNumber: card.maskedNumber,
                            expiryDate: card.expiryDate,
                            cardHolderName: card.cardHolderName,
                            cvvCode: card.last4Digits,
                            showBackView: false,
                            cardBgColor: AppColors.mainColor,
                            onCreditCardWidgetChange: (_) {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                labelText: "Enter Amount",
                controller: amountController,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
