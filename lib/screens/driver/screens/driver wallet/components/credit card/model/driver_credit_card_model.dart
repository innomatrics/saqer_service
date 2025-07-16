// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'driver_credit_card_model.g.dart';

@HiveType(typeId: 1)
class DriverCreditCardModel extends HiveObject {
  //unique id of the card
  @HiveField(0)
  final String cardid;
  //card holder id in database
  @HiveField(1)
  final String driverId;

  //masked number for encrypted card number
  @HiveField(3)
  final String maskedNumber;

  //expiry date of the card
  @HiveField(4)
  final String expiryDate;

  //card holder name
  @HiveField(5)
  final String cardHolderName;

  //payment token of the card
  @HiveField(6)
  final String paymentToken;

  //card brand
  @HiveField(7)
  final String cardBrand;

  //last 4 digits of the card
  @HiveField(8)
  final String last4Digits;
  DriverCreditCardModel({
    required this.cardid,
    required this.driverId,
    required this.maskedNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.paymentToken,
    required this.cardBrand,
    required this.last4Digits,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardid': cardid,
      'driverId': driverId,
      'maskedNumber': maskedNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'paymentToken': paymentToken,
      'cardBrand': cardBrand,
      'last4Digits': last4Digits,
    };
  }

  factory DriverCreditCardModel.fromMap(Map<String, dynamic> map) {
    return DriverCreditCardModel(
      cardid: map['cardid'] as String,
      driverId: map['driverId'] as String,
      maskedNumber: map['maskedNumber'] as String,
      expiryDate: map['expiryDate'] as String,
      cardHolderName: map['cardHolderName'] as String,
      paymentToken: map['paymentToken'] as String,
      cardBrand: map['cardBrand'] as String,
      last4Digits: map['last4Digits'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverCreditCardModel.fromJson(String source) =>
      DriverCreditCardModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

final dummyCreditCards = [
  DriverCreditCardModel(
    cardid: '1',
    driverId: 'driver1',
    maskedNumber: '1457 7894 5123 1234',
    expiryDate: '12/24',
    cardHolderName: 'John Doe',
    paymentToken: 'token1',
    cardBrand: 'Visa',
    last4Digits: '1234',
  ),
  DriverCreditCardModel(
    cardid: '2',
    driverId: 'driver2',
    maskedNumber: '7845 2148 4785 5678',
    expiryDate: '11/25',
    cardHolderName: 'Jane Smith',
    paymentToken: 'token2',
    cardBrand: 'MasterCard',
    last4Digits: '5678',
  ),
  DriverCreditCardModel(
    cardid: '3',
    driverId: 'driver3',
    maskedNumber: '5478 2546 9874 9012',
    expiryDate: '10/23',
    cardHolderName: 'Alice Johnson',
    paymentToken: 'token3',
    cardBrand: 'Amex',
    last4Digits: '9012',
  ),
  DriverCreditCardModel(
    cardid: '4',
    driverId: 'driver4',
    maskedNumber: '7845 2145 6854 3456',
    expiryDate: '09/22',
    cardHolderName: 'Bob Brown',
    paymentToken: 'token4',
    cardBrand: 'Discover',
    last4Digits: '3456',
  ),
];
