// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DriverDocumentModel {
  //personal
  final String id;
  final String name;
  final String email;
  final int mobileNumber;
  final int age;
  final DateTime dob;
  final String address;
  final String city;
  //driver
  final String driverImage;
  final String idCartImage;
  final String licenceImage;
  final String licenceNumber;
  final int yearsOfExperience;
  final Timestamp? joinedAt;
  DriverDocumentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.age,
    required this.dob,
    required this.address,
    required this.city,
    required this.driverImage,
    required this.idCartImage,
    required this.licenceImage,
    required this.licenceNumber,
    required this.yearsOfExperience,
    this.joinedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'age': age,
      'dob': dob.millisecondsSinceEpoch,
      'address': address,
      'city': city,
      'driverImage': driverImage,
      'idCartImage': idCartImage,
      'licenceImage': licenceImage,
      'licenceNumber': licenceNumber,
      'yearsOfExperience': yearsOfExperience,
      'joinedAt': joinedAt,
    };
  }

  factory DriverDocumentModel.fromMap(Map<String, dynamic> map) {
    return DriverDocumentModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as int,
      age: map['age'] as int,
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob'] as int),
      address: map['address'] as String,
      city: map['city'] as String,
      driverImage: map['driverImage'] as String,
      idCartImage: map['idCartImage'] as String,
      licenceImage: map['licenceImage'] as String,
      licenceNumber: map['licenceNumber'] as String,
      yearsOfExperience: map['yearsOfExperience'] as int,
      joinedAt: map['joinedAt'] as Timestamp?,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverDocumentModel.fromJson(String source) =>
      DriverDocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
