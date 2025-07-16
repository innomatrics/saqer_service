// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_credit_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DriverCreditCardModelAdapter extends TypeAdapter<DriverCreditCardModel> {
  @override
  final int typeId = 1;

  @override
  DriverCreditCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverCreditCardModel(
      cardid: fields[0] as String,
      driverId: fields[1] as String,
      maskedNumber: fields[3] as String,
      expiryDate: fields[4] as String,
      cardHolderName: fields[5] as String,
      paymentToken: fields[6] as String,
      cardBrand: fields[7] as String,
      last4Digits: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DriverCreditCardModel obj) {
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
      other is DriverCreditCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
