import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/model/dummy_credit_card_model.dart';
import 'package:saqer_services/widgets/custom_elevated_button.dart';
import 'package:saqer_services/widgets/custom_text_form_field.dart';

class AddWalletMoney extends StatefulWidget {
  const AddWalletMoney({super.key});

  @override
  State<AddWalletMoney> createState() => _AddWalletMoneyState();
}

class _AddWalletMoneyState extends State<AddWalletMoney> {
  //controllers
  final amountController = TextEditingController();
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
        width: size.width * 1,
        child: CustomElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Add Amount",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: size.width * 1,
                child: ListView.builder(
                  itemCount: creditCards.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final cards = creditCards[index];
                    return CreditCardWidget(
                      cardNumber: cards.cardNumber,
                      expiryDate: cards.expiryDate,
                      cardHolderName: cards.cardHolderName,
                      cvvCode: cards.cvvCode,
                      showBackView: true,
                      onCreditCardWidgetChange: (_) {},
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.1),
              CustomTextFormField(
                labelText: "Enter Amount",
                controller: amountController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
