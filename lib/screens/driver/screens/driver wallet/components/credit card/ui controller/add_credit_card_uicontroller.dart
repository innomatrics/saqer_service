import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';

class AddCreditCardUicontroller extends ChangeNotifier {
  //card brand controllers

  CardType? selectedCardbrand;
  List<String> cardBrands = [
    "otherBrand",
    "mastercard",
    "visa",
    "rupay",
    "americanExpress",
    "unionpay",
    "discover",
    "elo",
    "hipercard",
    "mir",
  ];

  void setCardBrands(CardType value) {
    selectedCardbrand = value;
    notifyListeners();
  }

  Widget pickCardBrand() {
    return Consumer<AddCreditCardUicontroller>(
      builder: (context, provider, child) {
        final items = provider.cardBrands
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList();
        return DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.inputBorderColor),
            ),
          ),
          value: provider.selectedCardbrand,
          items: items,
          onChanged: (value) => provider.setCardBrands(value as CardType),
        );
      },
    );
  }
}
