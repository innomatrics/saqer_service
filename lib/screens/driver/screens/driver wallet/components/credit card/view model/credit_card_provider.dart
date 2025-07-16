import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/model/driver_credit_card_model.dart';
import 'package:saqer_services/widgets/custom_snack_bar.dart';

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

  Future<bool> addCreditCard({
    required String driverId,
    required String cardid,
    required String maskedNumber,
    required String expiryDate,
    required String cardHolderName,
    required String paymentToken,
    required String cardBrand,
    required String last4Digits,
    required BuildContext context,
  }) async {
    try {
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
      log(_driverCrediCards.toString());
      setLaoding(false);
      notifyListeners();
      return true;
    } catch (e) {
      setLaoding(false);
      failedSnackBar(message: e.toString(), context: context);
    }
    return false;
  }

  void removeCreditCard({
    required DriverCreditCardModel driverCreditCardModel,
  }) {
    _driverCrediCards.remove(driverCreditCardModel);
    notifyListeners();
  }
}
