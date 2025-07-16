import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:saqer_services/constants/constants.dart';

class AddCreditCardUicontroller extends ChangeNotifier {
  int _selectedCardbrandIndex = 0;
  int get selectedCardbrandIndex => _selectedCardbrandIndex;

  CardType? selectedCardbrand = CardType.mastercard;

  // Define the available card types
  final List<CardType> cardBrands = [
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

  // Images matching the card types
  final List<String> selectedCardBrandImages = [
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

  // Get label for card type
  String getCardLabel(CardType type) {
    switch (type) {
      case CardType.visa:
        return 'Visa';
      case CardType.mastercard:
        return 'MasterCard';
      case CardType.americanExpress:
        return 'American Express';
      case CardType.rupay:
        return 'RuPay';
      case CardType.unionpay:
        return 'UnionPay';
      case CardType.discover:
        return 'Discover';
      case CardType.elo:
        return 'Elo';
      case CardType.hipercard:
        return 'Hipercard';
      case CardType.mir:
        return 'Mir';
      default:
        return 'Other';
    }
  }

  // Set selected brand index
  void setSelectedCardBrandIndex(int index) {
    _selectedCardbrandIndex = index;
    notifyListeners();
  }

  // Set selected card brand
  void setCardBrands(CardType value) {
    selectedCardbrand = value;
    final index = cardBrands.indexOf(value);
    if (index != -1) {
      _selectedCardbrandIndex = index;
    }
    notifyListeners();
  }

  // Dropdown widget
  Widget pickCardBrand() {
    return DropdownButtonFormField<CardType>(
      value: selectedCardbrand,
      items: cardBrands.map((cardType) {
        return DropdownMenuItem<CardType>(
          value: cardType,
          child: Text(getCardLabel(cardType)),
        );
      }).toList(),
      onChanged: (CardType? value) {
        if (value != null) {
          setCardBrands(value);
        }
      },
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
    );
  }
}
