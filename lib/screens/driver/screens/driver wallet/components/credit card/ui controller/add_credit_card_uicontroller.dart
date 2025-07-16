import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:saqer_services/constants/constants.dart';

class AddCreditCardUicontroller extends ChangeNotifier {
  //card brand controllers

  int _selectedCardbrandIndex = 0;
  int get selectedCardbrandIndex => _selectedCardbrandIndex;

  CardType? selectedCardbrand;
  List<CardType> cardBrands = [
    CardType.mastercard,
    CardType.visa,
    CardType.rupay,
    CardType.americanExpress,
    CardType.unionpay,
    CardType.discover,
    CardType.elo,
    CardType.hipercard,
    CardType.mir,
  ];

  List<String> selectedCardBrandImages = [
    CreditCardImages.masterCard,
    CreditCardImages.visa,
    CreditCardImages.rupay,
    CreditCardImages.americanExpress,
    CreditCardImages.unionpay,
    CreditCardImages.discover,
    CreditCardImages.elo,
    CreditCardImages.hipercard,
    CreditCardImages.mir,
  ];

  //to change the index
  void setSelectedCardBrandIndex(int index) {
    _selectedCardbrandIndex = index;
    notifyListeners();
  }

  // to change the card brand
  void setCardBrands(CardType value) {
    selectedCardbrand = value;
    notifyListeners();
  }

  CardType mapBrandToCardType(String brand) {
    switch (brand.toLowerCase()) {
      case 'visa':
        return CardType.visa;
      case 'mastercard':
        return CardType.mastercard;
      case 'americanexpress':
        return CardType.americanExpress;
      case 'rupay':
        return CardType.rupay;
      case 'unionpay':
        return CardType.unionpay;
      case 'discover':
        return CardType.discover;
      case 'elo':
        return CardType.elo;
      case 'hipercard':
        return CardType.hipercard;
      case 'mir':
        return CardType.mir;
      default:
        return CardType.otherBrand;
    }
  }

  Widget pickCardBrand() {
    return Consumer<AddCreditCardUicontroller>(
      builder: (context, provider, child) {
        return DropdownButtonFormField<CardType>(
          value: provider.selectedCardbrand,
          items: provider.cardBrands
              .map(
                (cardType) => DropdownMenuItem(
                  value: cardType,
                  child: Text(cardType.toString().split('.').last),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              provider.setCardBrands(value);
            }
          },
        );
      },
    );
  }
}
