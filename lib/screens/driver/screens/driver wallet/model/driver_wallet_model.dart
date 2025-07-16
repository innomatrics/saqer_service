// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:saqer_services/screens/driver/screens/driver%20wallet/components/credit%20card/model/driver_credit_card_model.dart';

@HiveType(typeId: 1)
class DriverWalletModel extends HiveObject {
  @HiveField(0)
  double balance;

  @HiveField(1)
  DriverCreditCardModel creditCards;
  DriverWalletModel({required this.balance, required this.creditCards});
}
