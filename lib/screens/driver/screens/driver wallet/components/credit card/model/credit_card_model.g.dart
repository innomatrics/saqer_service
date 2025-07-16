// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardModelAdapter extends TypeAdapter<CreditCardModel> {
  @override
  final int typeId = 1;

  @override
  CreditCardModel read(BinaryReader reader) {
    return CreditCardModel(
      cardid: '',
      driverId: '',
      maskedNumber: '',
      expiryDate: '',
      cardHolderName: '',
      paymentToken: '',
      cardBrand: '',
      last4Digits: '',
    );
  }

  @override
  void write(BinaryWriter writer, CreditCardModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.cardid)
      ..writeByte(1)
      ..write(obj.driverId)
      ..writeByte(3)
      ..write(obj.maskedNumber)
      ..writeByte(4)
      ..write(obj.expiryDate)
      ..writeByte(5)
      ..write(obj.cardHolderName)
      ..writeByte(6)
      ..write(obj.paymentToken)
      ..writeByte(7)
      ..write(obj.cardBrand)
      ..writeByte(8)
      ..write(obj.last4Digits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
