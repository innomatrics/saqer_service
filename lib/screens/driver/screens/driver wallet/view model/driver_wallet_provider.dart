import 'package:flutter/material.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/model/driver_credit_card_model.dart';
import 'package:saqer_services/screens/driver/screens/driver%20wallet/model/driver_wallet_model.dart';
import 'package:saqer_services/widgets/custom_snack_bar.dart';

class DriverWalletProvider extends ChangeNotifier {
  final List<DriverWalletModel> _driverWallet = [];

  List<DriverWalletModel> get driverWallet => _driverWallet;

  Future<bool> addMoneyToWallet({
    required BuildContext context,
    required double balance,
    required DriverCreditCardModel creditCards,
  }) async {
    try {
      //wallet model
      final DriverWalletModel model = DriverWalletModel(
        balance: balance,
        creditCards: creditCards,
      );

      _driverWallet.add(model);
      notifyListeners();
      return true;
    } catch (e) {
      if (context.mounted) {
        failedSnackBar(message: e.toString(), context: context);
      }
    }
    return false;
  }

  double get totalAvailableBalance {
    double total = 0.0;

    for (final wallet in _driverWallet) {
      total += wallet.balance;
    }
    return total;
  }
}
