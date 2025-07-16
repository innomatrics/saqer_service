import 'package:flutter/material.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/model/driver_credit_card_model.dart';

class CreditCardProvider extends ChangeNotifier {
  List<DriverCreditCardModel> _driverCrediCards = [];

  List<DriverCreditCardModel> get driverCreditCards => _driverCrediCards;

  //loader
  bool _isloader = false;
  bool get isLoader => _isloader;

  void setLaoding(bool value) {
    _isloader = value;
    notifyListeners();
  }

  void addCreditCard({
    required String driverId,
    required String cardid,
    required String maskedNumber,
    required String expiryDate,
    required String cardHolderName,
    required String paymentToken,
    required String cardBrand,
    required String last4Digits,
  }) {
    setLaoding(true);
    //model
    final DriverCreditCardModel model = DriverCreditCardModel(
      cardid: cardid,
      driverId: driverId,
      maskedNumber: maskedNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      paymentToken: paymentToken,
      cardBrand: cardBrand,
      last4Digits: last4Digits,
    );
    _driverCrediCards.add(model);
    setLaoding(false);
    notifyListeners();
  }

  void removeCreditCard({
    required DriverCreditCardModel driverCreditCardModel,
  }) {
    _driverCrediCards.remove(driverCreditCardModel);
    notifyListeners();
  }
}
