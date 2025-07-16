import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/ui%20controller/add_credit_card_uicontroller.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/view%20model/credit_card_provider.dart';
import 'package:saqer_services/widgets/custom_elevated_button.dart';
import 'package:saqer_services/widgets/loader.dart';

class AddCreditCard extends StatefulWidget {
  const AddCreditCard({super.key});

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Add Money to Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer<AddCreditCardUicontroller>(
              builder: (context, provider, child) {
                final cardType =
                    provider.selectedCardbrand ?? CardType.mastercard;

                final cardImage = provider
                    .selectedCardBrandImages[provider.selectedCardbrandIndex];

                return CreditCardWidget(
                  enableFloatingCard: false,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  bankName: '',
                  cardType: cardType,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange: (CreditCardBrand _) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: cardType,
                      cardImage: Image.asset(cardImage, height: 48, width: 48),
                    ),
                  ],
                );
              },
            ),

            CreditCardForm(
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              formKey: formKey,
              onCreditCardModelChange: onCreditCardModelChange,
              inputConfiguration: const InputConfiguration(
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: InputDecoration(
                  labelText: 'Expired Date',
                  hintText: 'MM/YY',
                ),
                cvvCodeDecoration: InputDecoration(
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(labelText: 'Card Holder'),
              ),
            ),
            const SizedBox(height: 10),
            context.read<AddCreditCardUicontroller>().pickCardBrand(),
            SizedBox(height: size.height * 0.2),
            SizedBox(
              height: size.height * 0.07,
              width: size.width * 1,
              child: Consumer<CreditCardProvider>(
                builder: (context, provider, child) {
                  final isLoading = provider.isLoader;
                  return CustomElevatedButton(
                    child: isLoading
                        ? const Loader()
                        : const Text(
                            "Add Your Credit Card",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () {
                      provider.addCreditCard(
                        driverId: 'driver-1',
                        cardid: 'card-1',
                        maskedNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        paymentToken: 'tok-1',
                        cardBrand: 'MasterCard',
                        last4Digits: '1234',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
