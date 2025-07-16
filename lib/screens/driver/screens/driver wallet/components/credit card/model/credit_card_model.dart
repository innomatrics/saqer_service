// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'credit_card_model.g.dart';

@HiveType(typeId: 1)
class CreditCardModel extends HiveObject {
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
  CreditCardModel({
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

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
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

  factory CreditCardModel.fromJson(String source) =>
      CreditCardModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
